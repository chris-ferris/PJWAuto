// VehicleYearController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleYearController.h"

#ifndef VehicleControllerExtension_h
#import "VehicleControllerExtension.h"
#endif
#ifndef VehicleMakeController_h
#import "VehicleMakeController.h"
#endif
#ifndef VehicleOtherController_h
#import "VehicleOtherController.h"
#endif

static NSString* const identifier = @"VehicleYear";
static NSString* const title = @"Year";
static NSString* const alert = @"Please select your vehicle's year.";

@interface VehicleYearController ()
@property (nonatomic) UITableView* _yearTableView;
@end

@implementation VehicleYearController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super initWithVehicle:vehicle]) {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Cancel style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.leftBarButtonItem.tag = TagTypeCancel;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleYearController alloc] initWithVehicle:vehicle];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._vehicle year]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
}

- (void) loadView {
  [super loadView];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:alert attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._yearTableView = [Library tableView];
  self._yearTableView.dataSource = self;
  self._yearTableView.delegate = self;
  [self._contentView addSubview:self._yearTableView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._yearTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._yearTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._yearTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._yearTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._yearTableView flashScrollIndicators];
  NSInteger index = [self._vehicle yearIndex];
  if (index != NSNotFound) [self._yearTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeCancel) [self.navigationController popViewControllerAnimated:YES];
  else if (tag == TagTypeNext) {
    if ([self._vehicle year]) {
      UIViewController* controller = ([self._vehicle yearIndex] == VehicleYearIndexOther)? [VehicleOtherController newWithVehicle:self._vehicle] : [VehicleMakeController newWithVehicle:self._vehicle];
      [self.navigationController pushViewController:controller animated:YES];
    }
    else [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._yearTableView flashScrollIndicators];}] animated:YES completion:nil];
  }
  else {
    NSInteger row = tag - CellContentTagTypeText;
    NSInteger index = [self._vehicle yearIndex];
    if (row == index) {
      [self._vehicle resetYear];
      [Controller tableView:self._yearTableView select:NO row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle yearArray][row] attributeDictionary:self._attributeDictionaryButton2]];
      self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      [self._vehicle setYearAtIndex:row];
      if (index != NSNotFound) [Controller tableView:self._yearTableView select:NO row:index withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle yearArray][index] attributeDictionary:self._attributeDictionaryButton2]];
      [Controller tableView:self._yearTableView select:YES row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle yearArray][row] attributeDictionary:self._attributeDictionarySelected2]];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._vehicle yearArray].count;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton2;
    BOOL checkLabelHidden = YES;
    if (indexPath.row == [self._vehicle yearIndex]) {
      attributeDictionary = self._attributeDictionarySelected2;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:(NSString*)[self._vehicle yearArray][indexPath.row] attributeDictionary:attributeDictionary]];
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
