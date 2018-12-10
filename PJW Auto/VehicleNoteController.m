// VehicleNoteController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleNoteController.h"

#ifndef VehicleControllerExtension_h
#import "VehicleControllerExtension.h"
#endif

static NSString* const title = @"Vehicle Note";
static NSString* const hint = @"Optionally, please note any additional vehicle info.";
static NSString* const placeholder = @"Vehicle Note (optional)";

@interface VehicleNoteController ()
@property (nonatomic) UIBarButtonItem* _saveBarButton;
@property (nonatomic) UIBarButtonItem* _doneBarButton;
@property (nonatomic) UIScrollView* _scrollView;
@property (nonatomic) UITextField* _noteTextField;
@end

@implementation VehicleNoteController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super initWithVehicle:vehicle]) {
    self._saveBarButton = [[UIBarButtonItem alloc] initWithTitle:Save style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._saveBarButton.tag = TagTypeSave;
    self._saveBarButton.tintColor = [Library colorApplePrimaryAddGreen];
    self._doneBarButton = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._doneBarButton.tag = TagTypeDone;
    self.navigationItem.rightBarButtonItem = self._saveBarButton;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleNoteController alloc] initWithVehicle:vehicle];
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
  UILabel* vehicleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"%@ %@ %@", [self._vehicle year], [self._vehicle make], [self._vehicle model]] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._scrollView addSubview:vehicleLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._scrollView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._scrollView addSubview:hintLabel];
  self._noteTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholder
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeDefault];
  NSString* note = [self._vehicle note];
  if (note) self._noteTextField.text = note;
  self._noteTextField.delegate = self;
  [self._scrollView addSubview:self._noteTextField];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:vehicleLabel withReferenceView:self._scrollView],
    [Library constraintOfTopForView:vehicleLabel withReferenceView:self._scrollView],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:vehicleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfLeftForView:hintLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:hintLabel withReferenceView:self._scrollView],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [NSLayoutConstraint constraintWithItem:self._noteTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._noteTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._noteTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfHeightForTextField:self._noteTextField],
    [Library constraintOfBottomForView:self._noteTextField withReferenceView:self._scrollView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._scrollView flashScrollIndicators];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case TagTypeDone: [self._noteTextField resignFirstResponder]; break;
    case TagTypeSave: {
      [self._vehicle save];
      [self.navigationController popToRootViewControllerAnimated:YES];
      break;
    }
  }
}

- (void) keyboardDidShowNotification:(NSNotification*)notification {
  [Library keyboardDidShowNotification:notification forScrollView:self._scrollView containingSubview:self._noteTextField withPadding:[Library sizeMini].height];
}

- (void) keyboardWillHideNotification:(NSNotification*)notification {
  [Library keyboardWillHideNotification:notification forScrollView:self._scrollView];
}

- (void) textFieldDidBeginEditing:(UITextField*)textField {
  self.navigationItem.hidesBackButton = YES;
  self.navigationItem.rightBarButtonItem = self._doneBarButton;
}

- (void) textFieldDidEndEditing:(UITextField*)textField {
  [self._vehicle setNote:self._noteTextField.text];
  self.navigationItem.hidesBackButton = NO;
  self.navigationItem.rightBarButtonItem = self._saveBarButton;
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
