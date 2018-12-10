// VehicleGarageController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleGarageController.h"

#ifndef VehicleControllerExtension_h
#import "VehicleControllerExtension.h"
#endif
#ifndef VehicleYearController_h
#import "VehicleYearController.h"
#endif

static NSString* const identifier = @"VehicleGarage";
static NSString* const title = @"Garage";
static NSString* const hint = @"Please select a vehicle from your garage, or add a vehicle.";

@interface VehicleGarageController ()
@property (nonatomic) UIBarButtonItem* _saveBarButton;
@property (nonatomic) NSArray* _addEditBarButtonArray;
@property (nonatomic) NSArray* _doneBarButtonArray;
@property (nonatomic) UITableView* _garageTableView;
@end

@implementation VehicleGarageController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super initWithVehicle:vehicle]) {
    self._saveBarButton = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._saveBarButton.tag = TagTypeSave;
    UIBarButtonItem* addBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionForSender:)];
    addBarButton.tag = TagTypeAdd;
    addBarButton.tintColor = [Library colorApplePrimaryAddGreen];
    UIBarButtonItem* editBarButton = [[UIBarButtonItem alloc] initWithTitle:Edit style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    editBarButton.tag = TagTypeEdit;
    editBarButton.tintColor = [Library colorApplePrimaryAddRed];
    UIBarButtonItem* doneBarButton = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    doneBarButton.tag = TagTypeDone;
    UIBarButtonItem* space = [Library barButtonItemFixedSpaceWithWidth:[Library sizeAquaSuper].width];
    self._addEditBarButtonArray = [NSArray arrayWithObjects:addBarButton, space, editBarButton, nil];
    self._doneBarButtonArray = [NSArray arrayWithObject:doneBarButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = self._saveBarButton;
    self.navigationItem.rightBarButtonItems = self._addEditBarButtonArray;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleGarageController alloc] initWithVehicle:vehicle];
}

- (void) loadView {
  [super loadView];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._garageTableView = [Library tableView];
  self._garageTableView.rowHeight = 48.0f;
  self._garageTableView.dataSource = self;
  self._garageTableView.delegate = self;
  [self._contentView addSubview:self._garageTableView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._garageTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._garageTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._garageTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._garageTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._garageTableView flashScrollIndicators];
  NSInteger index = [self._vehicle vehicleIndex];
  if (index != NSNotFound) [self._garageTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeSave) [self.navigationController popToRootViewControllerAnimated:YES];
  else if (tag == TagTypeAdd) {
    [self._vehicle reload];
    VehicleYearController* controller = [VehicleYearController newWithVehicle:self._vehicle];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
  }
  else if (tag == TagTypeEdit) {
    [self._garageTableView setEditing:YES animated:YES];
    self.navigationItem.rightBarButtonItems = self._doneBarButtonArray;
    self.navigationItem.leftBarButtonItem = nil;
  }
  else if (tag == TagTypeDone) {
    [self._garageTableView setEditing:NO animated:YES];
    self.navigationItem.rightBarButtonItems = self._addEditBarButtonArray;
    self.navigationItem.leftBarButtonItem = self._saveBarButton;
  }
  else {
    if (! self._garageTableView.editing) {
      NSInteger row = tag - CellContentTagTypeText;
      NSInteger index = [self._vehicle vehicleIndex];
      if (row != index) {
        [self._vehicle setVehicleAtIndex:row];
        if (index != NSNotFound) [Controller tableView:self._garageTableView select:NO row:index withAttributedString:[VehicleGarageController attributedStringForVehicle:(NSDictionary*)[self._vehicle vehicleArray][index] withAttributeDictionary:self._attributeDictionaryButton27 detailAttributeDictionary:self._attributeDictionaryButton35]];
        [Controller tableView:self._garageTableView select:YES row:row withAttributedString:[VehicleGarageController attributedStringForVehicle:(NSDictionary*)[self._vehicle vehicleArray][row] withAttributeDictionary:self._attributeDictionarySelected27 detailAttributeDictionary:self._attributeDictionarySelected35]];
      }
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._vehicle vehicleArray].count;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton27;
    NSDictionary* detailAttributeDictionary = self._attributeDictionaryButton35;
    BOOL checkLabelHidden = YES;
    if (indexPath.row == [self._vehicle vehicleIndex]) {
      attributeDictionary = self._attributeDictionarySelected27;
      detailAttributeDictionary = self._attributeDictionarySelected35;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[VehicleGarageController attributedStringForVehicle:(NSDictionary*)[self._vehicle vehicleArray][indexPath.row] withAttributeDictionary:attributeDictionary detailAttributeDictionary:detailAttributeDictionary]];
    textButton.tag = CellContentTagTypeText + indexPath.row;
    [textButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:textButton];
    UILabel* checkLabel = [Library labelWithAttributedString:[Library attributedStringWithString:unicodeCheck attributeDictionary:self._attributeDictionarySelected1]];
    checkLabel.tag = CellContentTagTypeCheck + indexPath.row;
    checkLabel.hidden = checkLabelHidden;
    [cell.contentView addSubview:checkLabel];
    [cell.contentView addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfCenterXForView:textButton withReferenceView:cell.contentView],
      [Library constraintOfCenterYForView:textButton withReferenceView:cell.contentView],
      [NSLayoutConstraint constraintWithItem:checkLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
        toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:[Library sizeMini].width],
      [Library constraintOfCenterYForView:checkLabel withReferenceView:cell.contentView],
      nil]];
  }
  return cell;
}

- (void) tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self._vehicle removeVehicleAtIndex:indexPath.row];
    [self._garageTableView beginUpdates];
    [self._garageTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self._garageTableView endUpdates];
    [self.navigationController popToRootViewControllerAnimated:YES];
  }
}

- (BOOL) tableView:(UITableView*)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath {
  return NO;
}

+ (NSAttributedString*) attributedStringForVehicle:(NSDictionary*)vehicle withAttributeDictionary:(NSDictionary*)attributeDictionary detailAttributeDictionary:(NSDictionary*)detailAttributeDictionary {
  NSMutableAttributedString* attributedString = [Library mutableAttributedStringWithString:[NSString stringWithFormat:@"%@ %@ %@", (NSString*)[vehicle objectForKey:VehicleKeyYear], (NSString*)[vehicle objectForKey:VehicleKeyMake], (NSString*)[vehicle objectForKey:VehicleKeyModel]] attributeDictionary:attributeDictionary];
  NSString* note = (NSString*)[vehicle objectForKey:VehicleKeyNote];
  if (note) [attributedString appendAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"\n%@", note] attributeDictionary:detailAttributeDictionary]];
  return attributedString;
}

@end
