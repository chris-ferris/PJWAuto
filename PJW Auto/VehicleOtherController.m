// VehicleOtherController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleOtherController.h"

#ifndef VehicleControllerExtension_h
#import "VehicleControllerExtension.h"
#endif

static NSString* const placeholderYear = @"Year";
static NSString* const placeholderMake = @"Make";
static NSString* const placeholderModel = @"Model";
static NSString* const placeholderNote = @"Vehicle Note (optional)";
static NSString* const hintNote = @"Optionally, please note any additional vehicle info.";
static NSString* const alertYear = @"Please enter your vehicle's year.";
static NSString* const alertMake = @"Please enter your vehicle's make.";
static NSString* const alertModel = @"Please enter your vehicle's model.";
static NSString* const validateYear = @"Please enter a valid vehicle year in 'xxxx' format.";

@interface VehicleOtherController ()
@property (nonatomic) UIBarButtonItem* _saveBarButton;
@property (nonatomic) UIBarButtonItem* _doneBarButton;
@property (nonatomic) UIScrollView* _scrollView;
@property (nonatomic) UITextField* _yearTextField;
@property (nonatomic) UITextField* _makeTextField;
@property (nonatomic) UITextField* _modelTextField;
@property (nonatomic) UITextField* _noteTextField;
@end

@implementation VehicleOtherController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super initWithVehicle:vehicle]) {
    self._saveBarButton = [[UIBarButtonItem alloc] initWithTitle:Save style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._saveBarButton.tag = TagTypeSave;
    self._doneBarButton = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._doneBarButton.tag = TagTypeDone;
    self.navigationItem.rightBarButtonItem = self._saveBarButton;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleOtherController alloc] initWithVehicle:vehicle];
}

- (void) loadView {
  [super loadView];
  self._scrollView = [Library scrollView];
  [self._contentView addSubview:self._scrollView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfLeftMarginForView:self._scrollView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._scrollView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfBottomMarginForView:self._scrollView withReferenceView:self._contentView],
    nil]];
  self._yearTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderYear
    keyboardType:UIKeyboardTypeNumberPad
    autocapitalizationType:UITextAutocapitalizationTypeNone
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._yearTextField.delegate = self;
  [self._scrollView addSubview:self._yearTextField];
  self._makeTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderMake
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._makeTextField.delegate = self;
  [self._scrollView addSubview:self._makeTextField];
  self._modelTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderModel
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._modelTextField.delegate = self;
  [self._scrollView addSubview:self._modelTextField];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hintNote attributeDictionary:self._attributeDictionaryHint]];
  [self._scrollView addSubview:hintLabel];
  self._noteTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderNote
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeDefault];
  self._noteTextField.delegate = self;
  [self._scrollView addSubview:self._noteTextField];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [NSLayoutConstraint constraintWithItem:self._yearTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._yearTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [Library constraintOfTopForView:self._yearTextField withReferenceView:self._scrollView],
    [Library constraintOfHeightForTextField:self._yearTextField],
    [NSLayoutConstraint constraintWithItem:self._makeTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._makeTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._makeTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._yearTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfHeightForTextField:self._makeTextField],
    [NSLayoutConstraint constraintWithItem:self._modelTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._modelTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._modelTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._makeTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfHeightForTextField:self._modelTextField],
    [Library constraintOfLeftForView:hintLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:hintLabel withReferenceView:self._scrollView],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._modelTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [NSLayoutConstraint constraintWithItem:self._noteTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._noteTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._noteTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfHeightForTextField:self._noteTextField],
    [Library constraintOfBottomForView:self._noteTextField withReferenceView:self._scrollView],
    nil]];
  NSString* year = [self._vehicle year];
  if (! [year isEqualToString:OTHER]) {
    self._yearTextField.text = year;
  }
  NSString* make = [self._vehicle make];
  if (! [make isEqualToString:OTHER]) {
    self._makeTextField.text = make;
  }
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._scrollView flashScrollIndicators];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (BOOL) isValidYear:(NSString*)year {
  BOOL valid = (year.length == 4);
  if (valid) {
    NSInteger yearValue = year.integerValue;
    if ((yearValue < VehicleYearMin) || (yearValue > VehicleYearMax)) valid = NO;
  }
  return valid;
}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case TagTypeDone: [[Library firstResponderInView:self._scrollView] resignFirstResponder]; break;
    case TagTypeSave: {
      NSString* year = self._yearTextField.text;
      NSString* make = self._makeTextField.text;
      NSString* model = self._modelTextField.text;
      NSString* note = self._noteTextField.text;
      NSCharacterSet* whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
      BOOL shouldSave = YES;
      if ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:year]]) {
        shouldSave = NO;
        [self presentViewController:[Controller alertControllerWithTitle:alertYear handler:^(UIAlertAction* action) {[self._yearTextField becomeFirstResponder];}] animated:YES completion:nil];
      }
      else if (! [self isValidYear:year]) {
        shouldSave = NO;
        [self presentViewController:[Controller alertControllerWithTitle:validateYear handler:^(UIAlertAction* action) {[self._yearTextField becomeFirstResponder];}] animated:YES completion:nil];
      }
      if (shouldSave && ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:self._makeTextField.text]])) {
        shouldSave = NO;
        [self presentViewController:[Controller alertControllerWithTitle:alertMake handler:^(UIAlertAction* action) {[self._makeTextField becomeFirstResponder];}] animated:YES completion:nil];
      }
      if (shouldSave && ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:self._modelTextField.text]])) {
        shouldSave = NO;
        [self presentViewController:[Controller alertControllerWithTitle:alertModel handler:^(UIAlertAction* action) {[self._modelTextField becomeFirstResponder];}] animated:YES completion:nil];
      }
      if (shouldSave) {
        [self._vehicle setYear:year make:make model:model note:note];
        [self.navigationController popToRootViewControllerAnimated:YES];
      }
      break;
    }
  }
}

- (void) keyboardDidShowNotification:(NSNotification*)notification {
  [Library keyboardDidShowNotification:notification forScrollView:self._scrollView containingSubview:[Library firstResponderInView:self._scrollView] withPadding:[Library sizeMini].height];
}

- (void) keyboardWillHideNotification:(NSNotification*)notification {
  [Library keyboardWillHideNotification:notification forScrollView:self._scrollView];
}

- (void) textFieldDidBeginEditing:(UITextField*)textField {
  self.navigationItem.hidesBackButton = YES;
  self.navigationItem.rightBarButtonItem = self._doneBarButton;
}

- (BOOL) textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)replacementString {
  BOOL shouldChangeCharacters = YES;
  if (textField == self._yearTextField) {
    if (! [replacementString isEqualToString:@""]) {
      if ((! [[NSCharacterSet decimalDigitCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:replacementString]]) ||
        (textField.text.length - range.length + replacementString.length > 4)) shouldChangeCharacters = NO;
    }
  }
  return shouldChangeCharacters;
}

- (void) textFieldDidEndEditing:(UITextField*)textField {
  NSString* year = self._yearTextField.text;
  NSString* make = self._makeTextField.text;
  NSString* model = self._modelTextField.text;
  NSCharacterSet* whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  BOOL canSave = YES;
  if ((([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:year]]) || (! [self isValidYear:year])) ||
    ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:make]]) ||
    ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:model]])) canSave = NO;
  self.navigationItem.hidesBackButton = NO;
  self._saveBarButton.tintColor = (canSave)? [Library colorApplePrimaryAddGreen] : [Library colorBaseBlack];
  self.navigationItem.rightBarButtonItem = self._saveBarButton;
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
