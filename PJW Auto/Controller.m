// Controller.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ControllerExtension.h"

@implementation Controller

- (instancetype) init {
  if (self = [super init]) {
    self._attributeDictionaryHeader1 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.8f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSuper], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader15 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.5f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader16 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.4f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthStandard], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader2 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.2f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader25 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader28 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.85f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader3 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.8f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthStandard], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHeader4 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.6f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorWithWhite:0.9f], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton1 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.4f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected1 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.4f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton15 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.25f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected15 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.25f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryLabel15 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.25f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton2 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.1f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected2 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.1f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryLabel2 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.1f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton23 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected23 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryLabel23 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton25 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.95f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected25 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.95f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryLabel25 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.95f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton27 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.9f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected27 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.9f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton3 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.85f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected3 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.85f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryButton35 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.8f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionarySelected35 = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.8f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryTagLine = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.9f traits:(UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic)], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSuper], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryToday = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.4f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryDayOff = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.1f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddRed], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryPrompt = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryHint = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.8f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorWithWhite:0.8f], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryAppointments = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:2.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      [Library shadow], [Library attributeNameForAttributeType:AttributeTypeShadow],
      nil];
    self._attributeDictionaryAdd = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.5f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSheer], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryCheckmark = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.7f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryWeekday = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.9f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorWithWhite:0.25f], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryWeekend = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:0.8f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddRed], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryCircle = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:2.3f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorApplePrimaryAddGreen], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseWhite], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryTextView = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentLeft], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
    self._attributeDictionaryTextField = [NSDictionary dictionaryWithObjectsAndKeys:
      [Library fontWithMultiplier:1.0f traits:UIFontDescriptorTraitBold], [Library attributeNameForAttributeType:AttributeTypeFont],
      [Library paragraphStyleTextAlignmentCenter], [Library attributeNameForAttributeType:AttributeTypeParagraphStyle],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeForegroundColor],
      [Library strokeWidthSubtle], [Library attributeNameForAttributeType:AttributeTypeStrokeWidth],
      [Library colorBaseBlack], [Library attributeNameForAttributeType:AttributeTypeStrokeColor],
      nil];
  }
  return self;
}

- (void) loadView {
  self.view = [Library view];
  self._contentView = [Library contentView];
  self._contentView.tintColor = [Library colorBaseBlack];
  [self.view addSubview:self._contentView];
  [self.view addConstraints:[Library constraintArrayForContentView:self._contentView withController:self]];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentSizeCategoryDidChangeForNotification:) name:UIContentSizeCategoryDidChangeNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void) didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
//! NSLog(@"[%@] didReceiveMemoryWarning", NSStringFromClass([self class]));
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {
  // Send the invalidateIntrinsicContentSize message to views positioned by Auto Layout, and invalidate preferred fonts or font descriptors and acquire new ones as needed
  // Include when user chooses 'bold' text setting
}

- (void) keyboardDidShowNotification:(NSNotification*)notification {}
- (void) keyboardWillHideNotification:(NSNotification*)notification {}

+ (UIAlertController*) alertControllerWithTitle:(NSString*)title handler:(void (^)(UIAlertAction* action))handler {
  UIAlertController* controller = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
  [controller addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleDefault handler:handler]];
  return controller;
}

+ (void) tableView:(UITableView*)tableView select:(BOOL)select row:(NSInteger)row withAttributedString:(NSAttributedString*)attributedString {
  [((UIButton*)[tableView viewWithTag:CellContentTagTypeText + row]) setAttributedTitle:attributedString forState:UIControlStateNormal];
  [tableView viewWithTag:CellContentTagTypeCheck + row].hidden = (! select);
}

@end
