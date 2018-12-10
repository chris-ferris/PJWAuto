// ServiceDateController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ServiceDateController.h"

#ifndef ServiceControllerExtension_h
#import "ServiceControllerExtension.h"
#endif
#ifndef ServiceTimeController_h
#import "ServiceTimeController.h"
#endif

static NSString* const identifier = @"ServiceDate";
static NSString* const title = @"Date";
static NSString* const hint = @"Please request a date for your appointment at least three days in advance; we are open Monday-Friday.";
static NSString* const alert = @"Please select a date for your appointment request.";
static NSString* const S = @"S";
static NSString* const M = @"M";
static NSString* const T = @"T";
static NSString* const W = @"W";
static NSString* const F = @"F";

@interface ServiceDateController ()
@property (nonatomic) UITableView* _dateTableView;
@end

@implementation ServiceDateController

- (instancetype) initWithService:(Service*)service {
  if (self = [super initWithService:service]) {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Cancel style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.leftBarButtonItem.tag = TagTypeCancel;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service {
  return [[ServiceDateController alloc] initWithService:service];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._service date]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
}

- (void) loadView {
  [super loadView];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    nil]];
  NSArray* headerArray = [NSArray arrayWithObjects:
    [Library labelWithAttributedString:[Library attributedStringWithString:S attributeDictionary:self._attributeDictionaryWeekend]],
    [Library labelWithAttributedString:[Library attributedStringWithString:M attributeDictionary:self._attributeDictionaryWeekday]],
    [Library labelWithAttributedString:[Library attributedStringWithString:T attributeDictionary:self._attributeDictionaryWeekday]],
    [Library labelWithAttributedString:[Library attributedStringWithString:W attributeDictionary:self._attributeDictionaryWeekday]],
    [Library labelWithAttributedString:[Library attributedStringWithString:T attributeDictionary:self._attributeDictionaryWeekday]],
    [Library labelWithAttributedString:[Library attributedStringWithString:F attributeDictionary:self._attributeDictionaryWeekday]],
    [Library labelWithAttributedString:[Library attributedStringWithString:S attributeDictionary:self._attributeDictionaryWeekend]],
    nil];
  CGFloat multiplier = 0.25f;
  for (NSInteger index = 0; index < headerArray.count; index++) {
    UILabel* header = (UILabel*)headerArray[index];
    [self._contentView addSubview:header];
    [self._contentView addConstraints:[NSArray arrayWithObjects:
      [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
        toItem:self._contentView attribute:NSLayoutAttributeCenterX multiplier:multiplier constant:0.0f],
      [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeTap].height],
      nil]];
    multiplier += 0.25f;
  }
  self._dateTableView = [Library tableView];
  self._dateTableView.dataSource = self;
  self._dateTableView.delegate = self;
  self._dateTableView.rowHeight = 55.0f;
  [self._contentView addSubview:self._dateTableView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfLeftMarginForView:self._dateTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._dateTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._dateTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:(UILabel*)headerArray[0] attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfBottomMarginForView:self._dateTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._dateTableView flashScrollIndicators];
  NSIndexPath* indexPath = [self._service dateIndexPath];
  if (indexPath) [self._dateTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) select:(BOOL)select dateWithTag:(NSInteger)tag {
  UIButton* button = (UIButton*)[self._dateTableView viewWithTag:tag];
  NSDictionary* attributeDictionary = (select)? self._attributeDictionarySelected1 : self._attributeDictionaryButton1;
  [button setAttributedTitle:[Library attributedStringWithString:[button attributedTitleForState:UIControlStateNormal].string attributeDictionary:attributeDictionary] forState:UIControlStateNormal];
  ((UIView*)button.subviews[1]).hidden = (! select);
}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeCancel) {
    [self._service cancel];
    [self.navigationController popToRootViewControllerAnimated:YES];
  }
  else if (tag == TagTypeNext) ([self._service date])?
    [self.navigationController pushViewController:[ServiceTimeController newWithService:self._service] animated:YES] :
    [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._dateTableView flashScrollIndicators];}] animated:YES completion:nil];
  else {
    NSInteger index = [self._service dateTag];
    if (tag == index) {
      [self._service resetDate];
      [self select:NO dateWithTag:tag];
      self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      [self._service setDateWithTag:tag];
      if (index != NSNotFound) [self select:NO dateWithTag:index];
      [self select:YES dateWithTag:tag];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (UIView*) tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
  UILabel* label = [UILabel new];
  label.numberOfLines = 0;
  label.attributedText = [Library attributedStringWithString:[[self._service calendar] titleForMonth:section] attributeDictionary:self._attributeDictionaryHeader4];
  return label;
}

- (CGFloat) tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
  return 22.0f;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView*)tableView {
  return [[self._service calendar] monthCount];
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [[self._service calendar] weekCountInMonth:section];
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier indexPath:indexPath]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier indexPath:indexPath]];
    NSArray* dateArray = [[self._service calendar] weekAtIndexPath:indexPath];
    for (NSInteger index = 0; index < dateArray.count; index++) {
      Date* date = (Date*)dateArray[index];
      DateColor dateColor = [date dateColor];
      UIView* view;
      if ((dateColor == DateColorWhite) || (dateColor == DateColorRed)) {
        NSDictionary* attributeDictionary = (dateColor == DateColorWhite)? self._attributeDictionaryToday : self._attributeDictionaryDayOff;
        view = [Library labelWithAttributedString:[Library attributedStringWithString:[date dayString] attributeDictionary:attributeDictionary]];
      }
      else {
        NSInteger dateTag = [date dateTagWithIndexPath:indexPath];
        NSDictionary* attributeDictionary = self._attributeDictionaryButton1;
        BOOL circleLabelHidden = YES;
        if (dateTag == [self._service dateTag]) {
          attributeDictionary = self._attributeDictionarySelected1;
          circleLabelHidden = NO;
        }
        UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:[date dayString] attributeDictionary:attributeDictionary]];
        textButton.tag = dateTag;
        [textButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
        UILabel* circleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:unicodeCircle attributeDictionary:self._attributeDictionaryCircle]];
        circleLabel.hidden = circleLabelHidden;
        [textButton addSubview:circleLabel];
        [textButton addConstraints:[NSArray arrayWithObjects:
          [NSLayoutConstraint constraintWithItem:circleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
            toItem:textButton attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.1f],
          [NSLayoutConstraint constraintWithItem:circleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
            toItem:textButton attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.8f],
          nil]];
        view = textButton;
      }
      [cell.contentView addSubview:view];
      [cell.contentView addConstraints:[NSArray arrayWithObjects:
        [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
          toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:0.25f * [date weekday] constant:0.0f],
        [Library constraintOfCenterYForView:view withReferenceView:cell.contentView],
        nil]];
    }
  }
  return cell;
}

@end
