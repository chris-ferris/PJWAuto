// VehicleMakeController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleMakeController.h"

#ifndef VehicleControllerExtension_h
#import "VehicleControllerExtension.h"
#endif
#ifndef VehicleModelController_h
#import "VehicleModelController.h"
#endif
#ifndef VehicleOtherController_h
#import "VehicleOtherController.h"
#endif

static NSString* const identifier = @"VehicleMake";
static NSString* const title = @"Make";
static NSString* const alert = @"Please select your vehicle's make.";

@interface VehicleMakeController ()
@property (nonatomic) UITableView* _makeTableView;
@end

@implementation VehicleMakeController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super initWithVehicle:vehicle]) {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleMakeController alloc] initWithVehicle:vehicle];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._vehicle make]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
}

- (void) loadView {
  [super loadView];
  UILabel* vehicleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._vehicle year] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._contentView addSubview:vehicleLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:alert attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._makeTableView = [Library tableView];
  self._makeTableView.dataSource = self;
  self._makeTableView.delegate = self;
  [self._contentView addSubview:self._makeTableView];
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
    [Library constraintOfLeftMarginForView:self._makeTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._makeTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._makeTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._makeTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._makeTableView flashScrollIndicators];
  NSInteger index = [self._vehicle makeIndex];
  if (index != NSNotFound) [self._makeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeNext) {
    if ([self._vehicle make]) {
      UIViewController* controller = ([[self._vehicle make] isEqualToString:OTHER])? [VehicleOtherController newWithVehicle:self._vehicle] : [VehicleModelController newWithVehicle:self._vehicle];
      [self.navigationController pushViewController:controller animated:YES];
    }
    else [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._makeTableView flashScrollIndicators];}] animated:YES completion:nil];
  }
  else {
    NSInteger row = tag - CellContentTagTypeText;
    NSInteger index = [self._vehicle makeIndex];
    if (row == index) {
      [self._vehicle resetMake];
      [Controller tableView:self._makeTableView select:NO row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle makeArray][row] attributeDictionary:self._attributeDictionaryButton2]];
      self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      [self._vehicle setMakeAtIndex:row];
      if (index != NSNotFound) [Controller tableView:self._makeTableView select:NO row:index withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle makeArray][index] attributeDictionary:self._attributeDictionaryButton2]];
      [Controller tableView:self._makeTableView select:YES row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle makeArray][row] attributeDictionary:self._attributeDictionarySelected2]];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._vehicle makeArray].count;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton2;
    BOOL checkLabelHidden = YES;
    if (indexPath.row == [self._vehicle makeIndex]) {
      attributeDictionary = self._attributeDictionarySelected2;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle makeArray][indexPath.row] attributeDictionary:attributeDictionary]];
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
