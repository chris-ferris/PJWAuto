// ServiceNoteController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ServiceNoteController.h"

#ifndef ServiceControllerExtension_h
#import "ServiceControllerExtension.h"
#endif

static NSString* const title = @"Service Note";
static NSString* const hint = @"Optionally, please enter any additional info for your appointment.";

@interface ServiceNoteController ()
@property (nonatomic) UIBarButtonItem* _saveBarButton;
@property (nonatomic) UIBarButtonItem* _doneBarButton;
@property (nonatomic) UIScrollView* _scrollView;
@property (nonatomic) UITextView* _noteTextView;
@end

@implementation ServiceNoteController

- (instancetype) initWithService:(Service*)service {
  if (self = [super initWithService:service]) {
    self._saveBarButton = [[UIBarButtonItem alloc] initWithTitle:Save style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._saveBarButton.tag = TagTypeSave;
    self._saveBarButton.tintColor = [Library colorApplePrimaryAddGreen];
    self._doneBarButton = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._doneBarButton.tag = TagTypeDone;
    self.navigationItem.rightBarButtonItem = self._saveBarButton;
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service {
  return [[ServiceNoteController alloc] initWithService:service];
}

- (void) loadView {
  [super loadView];
  self._scrollView = [Library scrollView];
  [self._contentView addSubview:self._scrollView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfLeftMarginForView:self._scrollView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._scrollView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfBottomMarginForView:self._scrollView withReferenceView:self._contentView],
    nil]];
  UILabel* dateLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service date] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._scrollView addSubview:dateLabel];
  UILabel* timeLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service time] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._scrollView addSubview:timeLabel];
  UILabel* waitLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service wait] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._scrollView addSubview:waitLabel];
  NSMutableAttributedString* typeAttributedString = [Library mutableAttributedStringWithString:(NSString*)[self._service typeArray][0] attributeDictionary:self._attributeDictionaryHeader28];
  NSInteger typeCount = [self._service typeArray].count;
  if (typeCount > 1) [typeAttributedString appendAttributedString:[Library attributedStringWithString:[Service andMoreTypes:typeCount - 1] attributeDictionary:self._attributeDictionaryHeader28]];
  UILabel* typeLabel = [Library labelWithAttributedString:typeAttributedString];
  [self._scrollView addSubview:typeLabel];
  NSMutableAttributedString* noiseAttributedString = [Library mutableAttributedStringWithString:(NSString*)[self._service noiseArray][0] attributeDictionary:self._attributeDictionaryHeader28];
  NSInteger noiseCount = [self._service noiseArray].count;
  if (noiseCount > 1) [noiseAttributedString appendAttributedString:[Library attributedStringWithString:[Service andMoreNoises:noiseCount - 1] attributeDictionary:self._attributeDictionaryHeader28]];
  UILabel* noiseLabel = [Library labelWithAttributedString:noiseAttributedString];
  [self._scrollView addSubview:noiseLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._scrollView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._scrollView addSubview:hintLabel];
  self._noteTextView = [Library textViewWithAttributeDictionary:self._attributeDictionaryTextView];
  self._noteTextView.scrollEnabled = NO;
  NSString* note = [self._service note];
  if (note) self._noteTextView.text = note;
  self._noteTextView.delegate = self;
  [self._scrollView addSubview:self._noteTextView];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:dateLabel withReferenceView:self._scrollView],
    [Library constraintOfTopForView:dateLabel withReferenceView:self._scrollView],
    [Library constraintOfCenterXForView:timeLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:dateLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:waitLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:waitLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:timeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:typeLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:typeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:waitLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:noiseLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:noiseLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:typeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:noiseLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:hintLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:hintLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [NSLayoutConstraint constraintWithItem:self._noteTextView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._noteTextView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._noteTextView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfBottomForView:self._noteTextView withReferenceView:self._scrollView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._scrollView flashScrollIndicators];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case TagTypeDone: [self._noteTextView resignFirstResponder]; break;
    case TagTypeSave: {
      [self._service save];
      [self.navigationController popToRootViewControllerAnimated:YES];
      break;
    }
  }
}

- (void) keyboardDidShowNotification:(NSNotification*)notification {
  [Library keyboardDidShowNotification:notification forScrollView:self._scrollView containingSubview:self._noteTextView withPadding:[Library sizeMini].height];
}

- (void) keyboardWillHideNotification:(NSNotification*)notification {
  [Library keyboardWillHideNotification:notification forScrollView:self._scrollView];
}

- (void) textViewDidBeginEditing:(UITextView*)textView {
  self.navigationItem.rightBarButtonItem = self._doneBarButton;
  self.navigationItem.hidesBackButton = YES;
}

- (void) textViewDidEndEditing:(UITextView*)textView {
  [self._service setNote:self._noteTextView.text];
  self.navigationItem.rightBarButtonItem = self._saveBarButton;
  self.navigationItem.hidesBackButton = NO;
}

@end
