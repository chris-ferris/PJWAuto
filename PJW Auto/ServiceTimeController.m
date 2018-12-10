// ServiceTimeController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ServiceTimeController.h"

#ifndef ServiceControllerExtension_h
#import "ServiceControllerExtension.h"
#endif
#ifndef ServiceWaitController_h
#import "ServiceWaitController.h"
#endif

static NSString* const identifier = @"ServiceTime";
static NSString* const title = @"Time";
static NSString* const hint = @"Please request a time for your appointment; we are open 8:00am-6:00pm.";
static NSString* const alert = @"Please select a time for your appointment request.";

@interface ServiceTimeController ()
@property (nonatomic) UITableView* _timeTableView;
@end

@implementation ServiceTimeController

- (instancetype) initWithService:(Service*)service {
  if (self = [super initWithService:service]) {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service {
  return [[ServiceTimeController alloc] initWithService:service];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._service time]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
}

- (void) loadView {
  [super loadView];
  UILabel* dateLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service date] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._contentView addSubview:dateLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._timeTableView = [Library tableView];
  self._timeTableView.dataSource = self;
  self._timeTableView.delegate = self;
  [self._contentView addSubview:self._timeTableView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:dateLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:dateLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._timeTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._timeTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._timeTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._timeTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._timeTableView flashScrollIndicators];
  NSInteger index = [self._service timeIndex];
  if (index != NSNotFound) [self._timeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeNext) ([self._service time])?
    [self.navigationController pushViewController:[ServiceWaitController newWithService:self._service] animated:YES] :
    [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._timeTableView flashScrollIndicators];}] animated:YES completion:nil];
  else {
    NSInteger row = tag - CellContentTagTypeText;
    NSInteger index = [self._service timeIndex];
    if (row == index) {
      [self._service resetTime];
      [Controller tableView:self._timeTableView select:NO row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._service timeTable][row] attributeDictionary:self._attributeDictionaryButton2]];
      self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      [self._service setTimeAtIndex:row];
      if (index != NSNotFound) [Controller tableView:self._timeTableView select:NO row:index withAttributedString:[Library attributedStringWithString:(NSString*)[self._service timeTable][index] attributeDictionary:self._attributeDictionaryButton2]];
      [Controller tableView:self._timeTableView select:YES row:row withAttributedString:[Library attributedStringWithString:(NSString*)[self._service timeTable][row] attributeDictionary:self._attributeDictionarySelected2]];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._service timeTable].count;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton2;
    BOOL checkLabelHidden = YES;
    if (indexPath.row == [self._service timeIndex]) {
      attributeDictionary = self._attributeDictionarySelected2;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:(NSString*)[self._service timeTable][indexPath.row] attributeDictionary:attributeDictionary]];
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
