// VehicleModelController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleModelController.h"

#ifndef VehicleControllerExtension_h
#import "VehicleControllerExtension.h"
#endif
#ifndef VehicleNoteController_h
#import "VehicleNoteController.h"
#endif
#ifndef VehicleOtherController_h
#import "VehicleOtherController.h"
#endif

static NSString* const identifier = @"VehicleModel";
static NSString* const title = @"Model";
static NSString* const alert = @"Please select your vehicle's model.";

@interface VehicleModelController ()
@property (nonatomic) UITableView* _modelTableView;
@end

@implementation VehicleModelController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super initWithVehicle:vehicle]) {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleModelController alloc] initWithVehicle:vehicle];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._vehicle model]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
}

- (void) loadView {
  [super loadView];
  UILabel* vehicleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"%@ %@", [self._vehicle year], [self._vehicle make]] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._contentView addSubview:vehicleLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:alert attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._modelTableView = [Library tableView];
  self._modelTableView.dataSource = self;
  self._modelTableView.delegate = self;
  [self._contentView addSubview:self._modelTableView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:vehicleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:vehicleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:vehicleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._modelTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._modelTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._modelTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._modelTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._modelTableView flashScrollIndicators];
  NSInteger index = [self._vehicle modelIndex];
  if (index != NSNotFound) [self._modelTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeNext) {
    if ([self._vehicle model]) {
      UIViewController* controller = ([[self._vehicle model] isEqualToString:OTHER])? [VehicleOtherController newWithVehicle:self._vehicle] : [VehicleNoteController newWithVehicle:self._vehicle];
      [self.navigationController pushViewController:controller animated:YES];
    }
    else [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._modelTableView flashScrollIndicators];}] animated:YES completion:nil];
  }
  else {
    NSInteger row = tag - CellContentTagTypeText;
    NSInteger index = [self._vehicle modelIndex];
    if (row == index) {
      [self._vehicle resetModel];
      [Controller tableView:self._modelTableView select:NO row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle modelArray][row] attributeDictionary:self._attributeDictionaryButton2]];
      self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      [self._vehicle setModelAtIndex:row];
      if (index != NSNotFound) [Controller tableView:self._modelTableView select:NO row:index withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle modelArray][index] attributeDictionary:self._attributeDictionaryButton2]];
      [Controller tableView:self._modelTableView select:YES row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle modelArray][row] attributeDictionary:self._attributeDictionarySelected2]];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._vehicle modelArray].count;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton2;
    BOOL checkLabelHidden = YES;
    if (indexPath.row == [self._vehicle modelIndex]) {
      attributeDictionary = self._attributeDictionarySelected2;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle modelArray][indexPath.row] attributeDictionary:attributeDictionary]];
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
      [Library constraintOfLeftMarginForView:checkLabel withReferenceView:cell.contentView],
      [Library constraintOfCenterYForView:checkLabel withReferenceView:cell.contentView],
      nil]];
  }
  return cell;
}

@end
