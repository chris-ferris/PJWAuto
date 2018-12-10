// ContactController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ContactController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif

static NSString* const header = @"CONTACT";
static NSString* const placeholderFirstName = @"First Name";
static NSString* const placeholderLastName = @"Last Name";
static NSString* const placeholderCompany = @"Company (optional)";
static NSString* const placeholderEmail = @"Email";
static NSString* const placeholderPhone = @"Phone";
static NSString* const alertFirstName = @"Please enter your first name.";
static NSString* const alertLastName = @"Please enter your last name.";
static NSString* const alertEmail = @"Please enter your email address.";
static NSString* const alertPhone = @"Please enter your phone number.";
static NSString* const validateEmail = @"Please enter a valid email address.";
static NSString* const validatePhone = @"Please enter a valid phone number in '(xxx) xxx-xxxx' format.";
static NSString* const DeleteContact = @"Delete Contact?";

@interface ContactController ()
@property (nonatomic) Contact* _contact;
@property (nonatomic) UIBarButtonItem* _cancelBarButton;
@property (nonatomic) UIBarButtonItem* _saveBarButton;
@property (nonatomic) NSArray* _saveBarButtonArray;
@property (nonatomic) NSArray* _saveDeleteBarButtonArray;
@property (nonatomic) NSArray* _doneBarButtonArray;
@property (nonatomic) UIScrollView* _scrollView;
@property (nonatomic) UITextField* _firstNameTextField;
@property (nonatomic) UITextField* _lastNameTextField;
@property (nonatomic) UITextField* _companyTextField;
@property (nonatomic) UITextField* _emailTextField;
@property (nonatomic) UITextField* _phoneTextField;
@end

@implementation ContactController

- (instancetype) initWithContact:(Contact*)contact {
  if (self = [super init]) {
    self._contact = contact;
    self._cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:Cancel style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._cancelBarButton.tag = TagTypeCancel;
    self._saveBarButton = [[UIBarButtonItem alloc] initWithTitle:Save style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._saveBarButton.tag = TagTypeSave;
    UIBarButtonItem* deleteBarButton = [[UIBarButtonItem alloc] initWithTitle:Delete style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    deleteBarButton.tag = TagTypeDelete;
    deleteBarButton.tintColor = [Library colorApplePrimaryAddRed];
    UIBarButtonItem* doneBarButton = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    doneBarButton.tag = TagTypeDone;
    UIBarButtonItem* space = [Library barButtonItemFixedSpaceWithWidth:[Library sizeAquaSuper].width];
    self._saveBarButtonArray = [NSArray arrayWithObject:self._saveBarButton];
    self._saveDeleteBarButtonArray = [NSArray arrayWithObjects:self._saveBarButton, space, deleteBarButton, nil];
    self._doneBarButtonArray = [NSArray arrayWithObject:doneBarButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = self._cancelBarButton;
    if ([self._contact contact]) {
      self._saveBarButton.tintColor = [Library colorApplePrimaryAddGreen];
      self.navigationItem.rightBarButtonItems = self._saveDeleteBarButtonArray;
    }
    else self.navigationItem.rightBarButtonItems = self._saveBarButtonArray;
  }
  return self;
}

+ (instancetype) newWithContact:(Contact*)contact {
  return [[ContactController alloc] initWithContact:contact];
}

- (void) loadView {
  [super loadView];
  UILabel* headerLabel = [Library labelWithAttributedString:[Library attributedStringWithString:header attributeDictionary:self._attributeDictionaryHeader3]];
  [self._contentView addSubview:headerLabel];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:headerLabel withReferenceView:self._contentView],
    [Library constraintOfLeftForView:headerLabel withReferenceView:self._contentView],
    [Library constraintOfRightForView:headerLabel withReferenceView:self._contentView],
    [Library constraintOfTopMarginForView:headerLabel withReferenceView:self._contentView],
    nil]];
  self._scrollView = [Library scrollView];
  [self._contentView addSubview:self._scrollView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfLeftMarginForView:self._scrollView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._scrollView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfBottomMarginForView:self._scrollView withReferenceView:self._contentView],
    nil]];
  self._firstNameTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderFirstName
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._firstNameTextField.delegate = self;
  [self._scrollView addSubview:self._firstNameTextField];
  self._lastNameTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderLastName
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._lastNameTextField.delegate = self;
  [self._scrollView addSubview:self._lastNameTextField];
  self._companyTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderCompany
    keyboardType:UIKeyboardTypeDefault
    autocapitalizationType:UITextAutocapitalizationTypeWords
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._companyTextField.delegate = self;
  [self._scrollView addSubview:self._companyTextField];
  self._emailTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderEmail
    keyboardType:UIKeyboardTypeEmailAddress
    autocapitalizationType:UITextAutocapitalizationTypeNone
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._emailTextField.delegate = self;
  [self._scrollView addSubview:self._emailTextField];
  self._phoneTextField = [Library textFieldWithAttributeDictionary:self._attributeDictionaryTextField placeholder:placeholderPhone
    keyboardType:UIKeyboardTypeNumberPad
    autocapitalizationType:UITextAutocapitalizationTypeNone
    autocorrectionType:UITextAutocorrectionTypeNo];
  self._phoneTextField.delegate = self;
  [self._scrollView addSubview:self._phoneTextField];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [NSLayoutConstraint constraintWithItem:self._firstNameTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._firstNameTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [Library constraintOfTopForView:self._firstNameTextField withReferenceView:self._scrollView],
    [Library constraintOfHeightForTextField:self._firstNameTextField],
    [NSLayoutConstraint constraintWithItem:self._lastNameTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._lastNameTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._lastNameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._firstNameTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfHeightForTextField:self._lastNameTextField],
    [NSLayoutConstraint constraintWithItem:self._companyTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._companyTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._companyTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._lastNameTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfHeightForTextField:self._companyTextField],
    [NSLayoutConstraint constraintWithItem:self._emailTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._emailTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._emailTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._companyTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfHeightForTextField:self._emailTextField],
    [NSLayoutConstraint constraintWithItem:self._phoneTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._phoneTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:self._phoneTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._emailTextField attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfHeightForTextField:self._phoneTextField],
    [Library constraintOfBottomForView:self._phoneTextField withReferenceView:self._scrollView],
    nil]];
  NSDictionary* contact = [self._contact contact];
  if (contact) {
    NSString* firstName = (NSString*)[contact objectForKey:ContactKeyFirstName];
    if (firstName) self._firstNameTextField.text = firstName;
    NSString* lastName = (NSString*)[contact objectForKey:ContactKeyLastName];
    if (lastName) self._lastNameTextField.text = lastName;
    NSString* company = (NSString*)[contact objectForKey:ContactKeyCompany];
    if (company) self._companyTextField.text = company;
    NSString* email = (NSString*)[contact objectForKey:ContactKeyEmail];
    if (email) self._emailTextField.text = email;
    NSString* phone = (NSString*)[contact objectForKey:ContactKeyPhone];
    if (phone) self._phoneTextField.text = phone;
  }
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._scrollView flashScrollIndicators];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case TagTypeDone: [[Library firstResponderInView:self._scrollView] resignFirstResponder]; break;
    case TagTypeCancel: [self.navigationController popToRootViewControllerAnimated:YES]; break;
    case TagTypeSave: {
      NSString* firstName = self._firstNameTextField.text;
      NSString* lastName = self._lastNameTextField.text;
      NSString* company = self._companyTextField.text;
      NSString* email = self._emailTextField.text;
      NSString* phone = self._phoneTextField.text;
      NSCharacterSet* whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
      BOOL shouldSave = YES;
      if ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:firstName]]) {
        shouldSave = NO;
        [self presentViewController:[Controller alertControllerWithTitle:alertFirstName handler:^(UIAlertAction* action) {[self._firstNameTextField becomeFirstResponder];}] animated:YES completion:nil];
      }
      if (shouldSave && ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:lastName]])) {
        shouldSave = NO;
        [self presentViewController:[Controller alertControllerWithTitle:alertLastName handler:^(UIAlertAction* action) {[self._lastNameTextField becomeFirstResponder];}] animated:YES completion:nil];
      }
      if (shouldSave) {
        if ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:email]]) {
          shouldSave = NO;
          [self presentViewController:[Controller alertControllerWithTitle:alertEmail handler:^(UIAlertAction* action) {[self._emailTextField becomeFirstResponder];}] animated:YES completion:nil];
        }
        else if (! [Library isValidEmail:email]) {
          shouldSave = NO;
          [self presentViewController:[Controller alertControllerWithTitle:validateEmail handler:^(UIAlertAction* action) {[self._emailTextField becomeFirstResponder];}] animated:YES completion:nil];
        }
      }
      if (shouldSave) {
        if ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:phone]]) {
          shouldSave = NO;
          [self presentViewController:[Controller alertControllerWithTitle:alertPhone handler:^(UIAlertAction* action) {[self._phoneTextField becomeFirstResponder];}] animated:YES completion:nil];
        }
        else if (! [Library isValidPhone:phone]) {
          shouldSave = NO;
          [self presentViewController:[Controller alertControllerWithTitle:validatePhone handler:^(UIAlertAction* action) {[self._phoneTextField becomeFirstResponder];}] animated:YES completion:nil];
        }
      }
      if (shouldSave) {
        [self._contact setFirstName:firstName lastName:lastName company:company email:email phone:phone];
        [self.navigationController popToRootViewControllerAnimated:YES];
      }
      break;
    }
    case TagTypeDelete: {
      UIAlertController* controller = [UIAlertController alertControllerWithTitle:DeleteContact message:nil preferredStyle:UIAlertControllerStyleAlert];
      [controller addAction:[UIAlertAction actionWithTitle:Cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {}]];
      [controller addAction:[UIAlertAction actionWithTitle:Delete style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action) {
        ((UIBarButtonItem*)self.navigationItem.rightBarButtonItems[0]).tintColor = [Library colorBaseBlack];
        [self._contact setContact:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
      }]];
      [self presentViewController:controller animated:YES completion:nil];
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
  self.navigationItem.leftBarButtonItem = nil;
  self.navigationItem.rightBarButtonItems = self._doneBarButtonArray;
}

- (void) loadPhoneWithText:(NSString*)text offset:(NSInteger)offset {
  NSMutableString* mutableText = [NSMutableString stringWithString:text];
  if ((text.length > 3) && (text.length < 8)) {
    [mutableText insertString:@"-" atIndex:3];
    if (offset > 3) offset++;
  }
  else if (text.length > 7) {
    [mutableText insertString:@"(" atIndex:0];
    [mutableText insertString:@") " atIndex:4];
    [mutableText insertString:@"-" atIndex:9];
    if ((offset > 3) && (offset < 7)) offset = offset + 2;
    else if (offset > 6) offset = offset + 3;
    offset++;
  }
  self._phoneTextField.text = mutableText;
  [Library forTextField:self._phoneTextField selectOffset:offset];
}

- (BOOL) textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)replacementString {
  BOOL shouldChangeCharacters = YES;
  if (textField == self._phoneTextField) {
    shouldChangeCharacters = NO;
    NSCharacterSet* characterSetDecimalDigit = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet* characterSetPhonePunctuation = [Library characterSetPhonePunctuation];
    if ([replacementString isEqualToString:@""]) {
      BOOL shouldLoadPhone = YES;
      NSString* subtext = [textField.text substringWithRange:range];
      if ([characterSetPhonePunctuation isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:subtext]]) {
        if ([subtext isEqualToString:@" "]) range = NSMakeRange(range.location - 2, 1);
        else if (([subtext isEqualToString:@")"]) || ([subtext isEqualToString:@") "]) || ([subtext isEqualToString:@"-"])) range = NSMakeRange(range.location - 1, 1);
        else shouldLoadPhone = NO;
      }
      if (shouldLoadPhone) {
        NSString* digitsPreRange = [Library string:[textField.text substringToIndex:range.location] remainderWithoutCharactersInSet:characterSetPhonePunctuation];
        NSString* digitsPostRange = [Library string:[textField.text substringFromIndex:range.location + range.length] remainderWithoutCharactersInSet:characterSetPhonePunctuation];
        [self loadPhoneWithText:[NSString stringWithFormat:@"%@%@", digitsPreRange, digitsPostRange] offset:digitsPreRange.length];
      }
    }
    else {
      if ((range.length == 0) || (! [characterSetPhonePunctuation isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:[textField.text substringWithRange:range]]])) {
        NSString* replacementText = [Library string:replacementString remainderWithCharactersInSet:characterSetDecimalDigit];
        if (replacementText.length > 0) {
          NSString* digitsPreRange = [Library string:[textField.text substringToIndex:range.location] remainderWithoutCharactersInSet:characterSetPhonePunctuation];
          NSString* digitsPostRange = [Library string:[textField.text substringFromIndex:range.location + range.length] remainderWithoutCharactersInSet:characterSetPhonePunctuation];
          NSString* text = [NSString stringWithFormat:@"%@%@%@", digitsPreRange, replacementText, digitsPostRange];
          if (text.length < 11) [self loadPhoneWithText:text offset:digitsPreRange.length + replacementText.length];
        }
      }
    }
  }
  return shouldChangeCharacters;
}

- (void) textFieldDidEndEditing:(UITextField*)textField {
  NSString* firstName = self._firstNameTextField.text;
  NSString* lastName = self._lastNameTextField.text;
  NSString* email = self._emailTextField.text;
  NSString* phone = self._phoneTextField.text;
  NSCharacterSet* whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  BOOL canSave = YES;
  if (([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:firstName]]) ||
    ([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:lastName]]) ||
    (([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:email]]) || (! [Library isValidEmail:email])) ||
    (([whitespaceAndNewlineCharacterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:phone]]) || (! [Library isValidPhone:phone]))) canSave = NO;
  self.navigationItem.leftBarButtonItem = self._cancelBarButton;
  self._saveBarButton.tintColor = (canSave)? [Library colorApplePrimaryAddGreen] : [Library colorBaseBlack];
  self.navigationItem.rightBarButtonItems = ([self._contact contact])? self._saveDeleteBarButtonArray : self._saveBarButtonArray;
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
