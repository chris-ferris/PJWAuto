// Library.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Library_h
#define Library_h

@import UIKit;
@import WebKit;
@import MapKit;
@import MessageUI;
@import AVFoundation;
@import QuartzCore;

static NSString* const Yes = @"Yes";
static NSString* const No = @"No";
static NSString* const OK = @"OK";
static NSString* const Done = @"Done";
static NSString* const Cancel = @"Cancel";
static NSString* const Add = @"Add";
static NSString* const Edit = @"Edit";
static NSString* const Delete = @"Delete";
static NSString* const Save = @"Save";
static NSString* const Next = @"Next";
static NSString* const Submit = @"Submit";
static NSString* const Back = @"Back";
static NSString* const Forward = @"Forward";
static NSString* const Home = @"Home";
static NSString* const Error = @"Error";
static NSString* const OTHER = @"OTHER";
static NSString* const ThankYou = @"Thank You";
static NSString* const Decimal = @"Decimal";
static NSString* const Metric = @"Metric";
static NSString* const Customary = @"Customary";
static NSString* const m4a = @"m4a";

static NSString* const unicodeCheck = @"\U00002713";
static NSString* const unicodeCircle = @"\U000025EF";
static NSString* const unicodeSpeaker = @"\U0001F508";
static NSString* const unicodeSpeakerCancellation = @"\U0001F507";
static NSString* const unicodeKeyboard = @"\U00002328";
static NSString* const unicodeDownArrowhead = @"\U00002304";

typedef struct DecimalFormat {
  NSInteger integerScale;
  NSInteger fractionScale;
} DecimalFormat;

DecimalFormat DecimalFormatMake(NSInteger integerScale, NSInteger fractionScale) {
  DecimalFormat format;
  format.integerScale = integerScale;
  format.fractionScale = fractionScale;
  return format;
}

typedef NS_ENUM(NSInteger, MeasurementSystem) {
  MeasurementSystemMetric,
  MeasurementSystemCustomary
};

typedef NS_ENUM(NSInteger, HeightType) {
  HeightTypeSmall,
  HeightTypeMedium,
  HeightTypeLarge
};

typedef NS_ENUM(NSInteger, AttributeType) {
  AttributeTypeFont,
  AttributeTypeParagraphStyle,
  AttributeTypeForegroundColor,
  AttributeTypeStrokeWidth,
  AttributeTypeStrokeColor,
  AttributeTypeUnderlineStyle,
  AttributeTypeUnderlineColor,
  AttributeTypeShadow
};

typedef NS_ENUM(NSInteger, ButtonType) {
  ButtonTypeSystem = UIButtonTypeSystem,
  ButtonTypeAdd = UIButtonTypeContactAdd,
  ButtonTypeInfo = UIButtonTypeInfoDark,
  ButtonTypeCustom = UIButtonTypeCustom
};

typedef NS_ENUM(NSInteger, TagType) {
  TagTypeDone = 1000,
  TagTypeCancel = 1001,
  TagTypeAdd = 1002,
  TagTypeEdit = 1003,
  TagTypeDelete = 1004,
  TagTypeSave = 1005,
  TagTypeAction = 1006,
  TagTypeRefresh = 1007,
  TagTypeNext = 1008,
  TagTypeSubmit = 1009,
  TagTypeBack = 1010,
  TagTypeForward = 1011,
  TagTypeHome = 1012,
  TagTypeKeyboard = 1013,
  TagTypeSegmented = 1014
};

typedef NS_ENUM(NSInteger, CellContentTagType) {
  CellContentTagTypeText = 2000,
  CellContentTagTypeCheck = 3000,
  CellContentTagTypeAccessory = 4000
};

@interface Library : NSObject

// UIViewController subclass
+ (UITabBarController*) tabBarController;
+ (UINavigationController*) navigationControllerWithRootViewController:(UIViewController*)rootViewController;
+ (UINavigationController*) navigationControllerIncludingToolbarWithRootViewController:(UIViewController*)rootViewController;
+ (UINavigationController*) navigationControllerWithRootViewController:(UIViewController*)rootViewController modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle;
+ (UINavigationController*) navigationControllerIncludingToolbarWithRootViewController:(UIViewController*)rootViewController modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle;

// UIView
+ (UIView*) view;
+ (UIView*) viewWithColor:(UIColor*)color;
+ (UIView*) contentView;
+ (UIView*) contentViewWithColor:(UIColor*)color;
+ (UIActivityIndicatorView*) activityIndicatorViewWithStyleLarge:(BOOL)isStyleLarge;
+ (UIImageView*) imageView;
+ (UIImageView*) imageViewWithImage:(UIImage*)image;
+ (UILabel*) label;
+ (UILabel*) labelWithString:(NSString*)string;
+ (UILabel*) labelWithAttributedString:(NSAttributedString*)attributedString;
+ (UILabel*) labelTitleWithAttributedString:(NSAttributedString*)attributedString;
+ (UIPickerView*) pickerView;
+ (UIProgressView*) progressView;

// UIScrollView
+ (UIScrollView*) scrollView;
+ (UIScrollView*) scrollViewPagingEnabled;
+ (UITableView*) tableView;
+ (UITableViewCell*) tableViewCellWithIdentifier:(NSString*)identifier;
+ (UITextView*) textView;
+ (UITextView*) textViewWithAttributeDictionary:(NSDictionary*)attributeDictionary;
+ (UITextView*) textViewWithAttributedString:(NSAttributedString*)attributedString;
+ (UITextView*) textViewWithAttributeDictionary:(NSDictionary*)attributeDictionary attributedString:(NSAttributedString*)attributedString;
+ (void) keyboardDidShowNotification:(NSNotification*)notification forScrollView:(UIScrollView*)scrollView containingSubview:(UIView*)subview withPadding:(CGFloat)padding;
+ (void) keyboardWillHideNotification:(NSNotification*)notification forScrollView:(UIScrollView*)scrollView;

// UIControl subclass
+ (UIButton*) buttonWithType:(ButtonType)buttonType;
+ (UIButton*) buttonWithType:(ButtonType)buttonType attributedString:(NSAttributedString*)attributedString;
+ (UIButton*) buttonWithImage:(UIImage*)image;
+ (UIButton*) buttonWithAttributedString:(NSAttributedString*)attributedString;
+ (UIButton*) buttonWithImage:(UIImage*)image attributedString:(NSAttributedString*)attributedString;
+ (UIButton*) buttonKeyboard;
+ (UIPageControl*) pageControl;
+ (UIPageControl*) pageControlWithNumberOfPages:(NSInteger)numberOfPages;
+ (UISegmentedControl*) segmentedControlWithItems:(NSArray*)items;
+ (UISwitch*) switchWithColor:(UIColor*)color;
+ (UITextField*) textField;
+ (UITextField*) textFieldWithAttributeDictionary:(NSDictionary*)attributeDictionary;
+ (UITextField*) textFieldWithAttributeDictionary:(NSDictionary*)attributeDictionary placeholder:(NSString*)placeholder;
+ (UITextField*) textFieldWithAttributeDictionary:(NSDictionary*)attributeDictionary placeholder:(NSString*)placeholder keyboardType:(NSInteger)keyboardType autocapitalizationType:(UITextAutocapitalizationType)autocapitalizationType autocorrectionType:(UITextAutocorrectionType)autocorrectionType;
+ (void) forButton:(UIButton*)button animateWithDuration:(CGFloat)duration delay:(CGFloat)delay;
+ (void) forTextField:(UITextField*)textField selectOffset:(NSInteger)offset;
+ (UIView*) firstResponderInView:(UIView*)view;

// UIImage
+ (UIImage*) imageOriginalWithImage:(UIImage*)image;

// UIBarItem
+ (UIBarButtonItem*) barButtonItemFixedSpaceWithWidth:(CGFloat)width;
+ (UIBarButtonItem*) barButtonItemFlexibleSpace;

// UIFont
+ (UIFont*) fontWithMultiplier:(CGFloat)multiplier;
+ (UIFont*) fontWithMultiplier:(CGFloat)multiplier traits:(UIFontDescriptorSymbolicTraits)traits;

// UIColor
+ (UIColor*) colorWithWhite:(CGFloat)white;
+ (UIColor*) colorTextStyleHeadline;
+ (UIColor*) colorTextStyleSubheadline;
+ (UIColor*) colorTextStyleBody;
+ (UIColor*) colorTextStyleFootnote;
+ (UIColor*) colorBaseBlack;
+ (UIColor*) colorBaseWhite;
+ (UIColor*) colorBaseGray;
+ (UIColor*) colorBaseDarkGray;
+ (UIColor*) colorBaseLightGray;
+ (UIColor*) colorBaseClear;
+ (UIColor*) colorBaseBackground;
+ (UIColor*) colorApplePrimaryAddRed;
+ (UIColor*) colorApplePrimaryAddGreen;
+ (UIColor*) colorApplePrimaryAddBlue;
+ (UIColor*) colorApplePrimarySubCyan;
+ (UIColor*) colorApplePrimarySubMagenta;
+ (UIColor*) colorApplePrimarySubYellow;
+ (UIColor*) colorAppleHalfDarkMustard;
+ (UIColor*) colorAppleHalfDarkPurple;
+ (UIColor*) colorAppleHalfDarkSeaweed;
+ (UIColor*) colorAppleHalfLightOrange;
+ (UIColor*) colorAppleHalfLightPink;
+ (UIColor*) colorAppleHalfLightLime;
+ (UIColor*) colorAppleHalfLightSeafoam;
+ (UIColor*) colorAppleHalfLightMountain;
+ (UIColor*) colorAppleHalfLightSky;
+ (UIColor*) colorSub11Gray;
+ (UIColor*) colorSub11Red;
+ (UIColor*) colorSub11Blue;
+ (UIColor*) colorSub11Yellow;
+ (UIColor*) colorSub11Green;
+ (UIColor*) colorSub11Orange;
+ (UIColor*) colorSub11Pink;
+ (UIColor*) colorSub11Purple;

// UIMotionEffectGroup
+ (UIMotionEffectGroup*) motionEffectGroupWithNaturalDirection:(BOOL)naturalDirection;

// UITraitCollection
+ (UITraitCollection*) traitCollectionWithHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass verticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass;

// MKMapView
+ (MKMapView*) mapView;
+ (MKMapView*) mapViewWithCenterCoordinate:(CLLocationCoordinate2D)coordinate spanDistance:(CGFloat)distance;
+ (MKPointAnnotation*) pointAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle;
+ (MKPinAnnotationView*) pinAnnotationViewWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString*)identifier;

// WKWebView
+ (WKWebView*) webView;

// NSAttributedString
+ (NSAttributedString*) attributedStringWithString:(NSString*)string attributeDictionary:(NSDictionary*)attributeDictionary;

// NSMutableAttributedString
+ (NSMutableAttributedString*) mutableAttributedStringWithAttributedString:(NSAttributedString*)attributedString;
+ (NSMutableAttributedString*) mutableAttributedStringWithString:(NSString*)string attributeDictionary:(NSDictionary*)attributeDictionary;

// NSString
+ (NSString*) string:(NSString*)string remainderWithCharactersInSet:(NSCharacterSet*)characterSet;
+ (NSString*) string:(NSString*)string remainderWithoutCharactersInSet:(NSCharacterSet*)characterSet;

// NSCharacterSet
+ (NSCharacterSet*) characterSetPhonePunctuation;

// NSDictionary
+ (NSDictionary*) attributeDictionaryToolbarButton;

// NSParagraphStyle
+ (NSParagraphStyle*) paragraphStyleWithTextAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;
+ (NSParagraphStyle*) paragraphStyleWithTextAlignment:(NSTextAlignment)textAlignment;
+ (NSParagraphStyle*) paragraphStyleTextAlignmentCenter;
+ (NSParagraphStyle*) paragraphStyleTextAlignmentLeft;

// NSNumber
+ (NSNumber*) strokeWidthSheer;
+ (NSNumber*) strokeWidthSubtle;
+ (NSNumber*) strokeWidthStandard;
+ (NSNumber*) strokeWidthSuper;

// NSShadow
+ (NSShadow*) shadow;
+ (CGSize) shadowOffset;
+ (CGFloat) shadowRadius;
+ (CGFloat) shadowOpacity;

// NSDecimal
+ (NSDecimal) decimal0;
+ (NSDecimal) decimal1;
+ (NSDecimal) decimalAddWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode;
+ (NSComparisonResult) decimalCompareWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand;
+ (NSDecimal) decimalCopyWithSource:(NSDecimal)source;
+ (NSDecimal) decimalDivideWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode;
+ (NSDecimal) decimalMultiplyWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode;
+ (NSDecimal) decimalMultiplyByPowerOf10WithNumber:(NSDecimal)number power:(short)power roundingMode:(NSRoundingMode)roundingMode;
+ (NSDecimal) decimalRoundWithNumber:(NSDecimal)number scale:(NSInteger)scale roundingMode:(NSRoundingMode)roundingMode;
+ (NSDecimal) decimalScanWithString:(NSString*)string;
+ (NSString*) decimalStringWithDecimal:(NSDecimal)decimal;
+ (NSDecimal) decimalSubtractWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode;

// NSLayoutConstraint
+ (NSArray*) constraintArrayForContentView:(UIView*)contentView withController:(UIViewController*)controller;
+ (NSArray*) constraintArrayForSubview:(UIView*)subview withContentView:(UIView*)contentView;
+ (NSArray*) constraintArrayWithLeftMarginRightMarginTopBottomMarginForSubview:(UIView*)subview withContentView:(UIView*)contentView;
+ (NSArray*) constraintArrayWithLeftRightTopMarginBottomForSubview:(UIView*)subview withContentView:(UIView*)contentView;
+ (NSArray*) constraintArrayOfCenterXLeftRightForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSArray*) constraintArrayOfCenterXLeftRightTopForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfCenterXForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfLeftForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfLeftMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfRightForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfRightMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfCenterYForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfTopForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfTopMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfBottomForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfBottomMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView;
+ (NSLayoutConstraint*) constraintOfHeightForTextField:(UITextField*)textField;
+ (NSLayoutConstraint*) constraintOfHeightForPickerView:(UIPickerView*)pickerView withHeightType:(HeightType)heightType;

// BOOL
+ (BOOL) isValidEmail:(NSString*)email;
+ (BOOL) isValidPhone:(NSString*)phone;

// NSURL
+ (NSURL*) documentURL;

// NSString
+ (NSString*) attributeNameForAttributeType:(AttributeType)attributeType;
+ (NSString*) identifierWithDomain:(NSString*)domain index:(NSInteger)index;
+ (NSString*) identifierWithDomain:(NSString*)domain indexPath:(NSIndexPath*)indexPath;

// CGFloat
+ (CGFloat) pickerViewComponentWidthForIntegerWithTextStyle:(NSString*)textStyle;
+ (CGFloat) pickerViewComponentWidthForStringOfLength:(NSInteger)length withTextStyle:(NSString*)textStyle;
+ (CGFloat) pickerViewComponentWidthForPunctuationWithTextStyle:(NSString*)textStyle;
+ (CGFloat) pickerViewRowHeight;
+ (CGFloat) bezierHeight;

// CGSize
+ (CGSize) sizeMini;
+ (CGSize) sizeAquaStandard;
+ (CGSize) sizeAquaSuper;
+ (CGSize) sizeTap;

// AVAudioPlayer
+ (AVAudioPlayer*) audioPlayerWithResource:(NSString*)resource extension:(NSString*)extension hint:(NSString*)hint;
+ (void) playAudioPlayer:(AVAudioPlayer*)audioPlayer;
+ (void) stopAudioPlayer:(AVAudioPlayer*)audioPlayer;

@end
#endif
