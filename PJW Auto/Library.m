// Library.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "Library.h"

@implementation Library

// UIViewController
+ (UITabBarController*) tabBarController {
  UITabBarController* tabBarController = [UITabBarController new];
  tabBarController.tabBar.translucent = NO;
  tabBarController.tabBar.barStyle = UIBarStyleDefault;
  tabBarController.tabBar.barTintColor = [self colorBaseBackground];
  tabBarController.tabBar.tintColor = [self colorBaseBlack];
  tabBarController.tabBar.shadowImage = [UIImage new];
  tabBarController.tabBar.backgroundImage = [UIImage new];
  return tabBarController;
}

+ (UINavigationController*) navigationControllerWithRootViewController:(UIViewController*)rootViewController {
  UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navigationController.navigationBar.translucent = NO;
  navigationController.navigationBar.barStyle = UIBarStyleDefault;
  navigationController.navigationBar.barTintColor = [self colorBaseBackground];
  navigationController.navigationBar.tintColor = [self colorBaseBlack];
  navigationController.navigationBar.shadowImage = [UIImage new];
  [navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
  navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
    [self fontWithMultiplier:1.3f traits:UIFontDescriptorTraitBold], [self attributeNameForAttributeType:AttributeTypeFont],
    [self colorBaseWhite], [self attributeNameForAttributeType:AttributeTypeForegroundColor],
    nil];
  return navigationController;
}

+ (UINavigationController*) navigationControllerIncludingToolbarWithRootViewController:(UIViewController*)rootViewController {
  UINavigationController* navigationController = [self navigationControllerWithRootViewController:rootViewController];
  navigationController.toolbarHidden = NO;
  navigationController.toolbar.translucent = NO;
  navigationController.toolbar.barStyle = UIBarStyleDefault;
  navigationController.toolbar.barTintColor = [self colorBaseWhite];
  navigationController.toolbar.tintColor = [self colorBaseBlack];
  [navigationController.toolbar setShadowImage:[UIImage new] forToolbarPosition:UIBarPositionAny];
  [navigationController.toolbar setBackgroundImage:[UIImage new] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
  return navigationController;
}

+ (UINavigationController*) navigationControllerWithRootViewController:(UIViewController*)rootViewController modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle {
  UINavigationController* navigationController = [self navigationControllerWithRootViewController:rootViewController];
  navigationController.modalTransitionStyle = modalTransitionStyle;
  return navigationController;
}

+ (UINavigationController*) navigationControllerIncludingToolbarWithRootViewController:(UIViewController*)rootViewController modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle {
  UINavigationController* navigationController = [self navigationControllerIncludingToolbarWithRootViewController:rootViewController];
  navigationController.modalTransitionStyle = modalTransitionStyle;
  return navigationController;
}

// UIView
+ (UIView*) view {
  return [self viewWithColor:[self colorBaseBackground]];
}

+ (UIView*) viewWithColor:(UIColor*)color {
  UIView* view = [UIView new];
  view.backgroundColor = color;
  return view;
}

+ (UIView*) contentView {
  return [self contentViewWithColor:[self colorBaseBackground]];
}

+ (UIView*) contentViewWithColor:(UIColor*)color {
  UIView* view = [self viewWithColor:color];
  view.translatesAutoresizingMaskIntoConstraints = NO;
  return view;
}

+ (UIActivityIndicatorView*) activityIndicatorViewWithStyleLarge:(BOOL)isStyleLarge {
  UIActivityIndicatorView* activityIndicatorView = (isStyleLarge)? [UIActivityIndicatorView new] : [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
  [activityIndicatorView startAnimating];
  return activityIndicatorView;
}

+ (UIImageView*) imageView {
  UIImageView* imageView = [UIImageView new];
  imageView.translatesAutoresizingMaskIntoConstraints = NO;
  return imageView;
}

+ (UIImageView*) imageViewWithImage:(UIImage*)image {
  UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
  imageView.translatesAutoresizingMaskIntoConstraints = NO;
  return imageView;
}

+ (UILabel*) label {
  UILabel* label = [UILabel new];
  label.translatesAutoresizingMaskIntoConstraints = NO;
  label.numberOfLines = 0;
  return label;
}

+ (UILabel*) labelWithString:(NSString*)string {
  UILabel* label = [self label];
  label.text = string;
  return label;
}

+ (UILabel*) labelWithAttributedString:(NSAttributedString*)attributedString {
  UILabel* label = [self label];
  label.attributedText = attributedString;
  return label;
}

+ (UILabel*) labelTitleWithAttributedString:(NSAttributedString*)attributedString {
  UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 44.0f)];
  label.attributedText = attributedString;
  return label;
}

+ (UIPickerView*) pickerView {
  UIPickerView* pickerView = [UIPickerView new];
  pickerView.translatesAutoresizingMaskIntoConstraints = NO;
  return pickerView;
}

+ (UIProgressView*) progressView {
  UIProgressView* progressView = [UIProgressView new];
  progressView.translatesAutoresizingMaskIntoConstraints = NO;
  return progressView;
}

// UIScrollView
+ (UIScrollView*) scrollView {
  UIScrollView* scrollView = [UIScrollView new];
  scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  scrollView.showsHorizontalScrollIndicator = NO;
  return scrollView;
}

+ (UIScrollView*) scrollViewPagingEnabled {
  UIScrollView* scrollView = [self scrollView];
  scrollView.pagingEnabled = YES;
  scrollView.showsVerticalScrollIndicator = NO;
  scrollView.scrollsToTop = NO;
  return scrollView;
}

+ (UITableView*) tableView {
  UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
  tableView.translatesAutoresizingMaskIntoConstraints = NO;
  tableView.allowsSelection = NO;
  tableView.rowHeight = [self sizeTap].height;
  tableView.backgroundColor = [self colorBaseClear];
  return tableView;
}

+ (UITableViewCell*) tableViewCellWithIdentifier:(NSString*)identifier {
  UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
  cell.separatorInset = UIEdgeInsetsMake(0.0f, [self sizeAquaStandard].width, 0.0f, 0.0f);
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.backgroundColor = [self colorBaseClear];
  return cell;
}

+ (UITextView*) textView {
  UITextView* textView = [UITextView new];
  textView.translatesAutoresizingMaskIntoConstraints = NO;
  textView.layer.cornerRadius = [Library sizeMini].width;
  return textView;
}

+ (UITextView*) textViewWithAttributeDictionary:(NSDictionary*)attributeDictionary {
  UITextView* textView = [self textView];
  textView.typingAttributes = attributeDictionary;
  return textView;
}

+ (UITextView*) textViewWithAttributedString:(NSAttributedString*)attributedString {
  UITextView* textView = [self textView];
  textView.attributedText = attributedString;
  textView.backgroundColor = [self colorBaseClear];
  return textView;
}

+ (UITextView*) textViewWithAttributeDictionary:(NSDictionary*)attributeDictionary attributedString:(NSAttributedString*)attributedString {
  UITextView* textView = [self textViewWithAttributedString:attributedString];
  textView.typingAttributes = attributeDictionary;
  return textView;
}

+ (void) keyboardDidShowNotification:(NSNotification*)notification forScrollView:(UIScrollView*)scrollView containingSubview:(UIView*)subview withPadding:(CGFloat)padding {
  CGFloat keyboardHeight = [((NSValue*)[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey]) CGRectValue].size.height;
  UIEdgeInsets insets = UIEdgeInsetsMake(0.0f, 0.0f, keyboardHeight, 0.0f);
  scrollView.contentInset = insets;
  scrollView.scrollIndicatorInsets = insets;
  CGRect bounds = scrollView.bounds;
  bounds.size.height -= keyboardHeight;
  if (! CGRectContainsPoint(bounds, subview.frame.origin)) {
    CGFloat gap = bounds.size.height - subview.frame.size.height + padding;
    [scrollView setContentOffset:CGPointMake(0.0f, subview.frame.origin.y - gap) animated:YES];
  }
}

+ (void) keyboardWillHideNotification:(NSNotification*)notification forScrollView:(UIScrollView*)scrollView {
  scrollView.contentInset = UIEdgeInsetsZero;
  scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

// UIControl
+ (UIButton*) buttonWithType:(ButtonType)buttonType {
  UIButton* button = [UIButton buttonWithType:(UIButtonType)buttonType];
  button.translatesAutoresizingMaskIntoConstraints = NO;
  button.titleLabel.numberOfLines = 0;
  return button;
}

+ (UIButton*) buttonWithType:(ButtonType)buttonType attributedString:(NSAttributedString*)attributedString {
  UIButton* button = [self buttonWithType:buttonType];
  [button setAttributedTitle:attributedString forState:UIControlStateNormal];
  return button;
}

+ (UIButton*) buttonWithImage:(UIImage*)image {
  UIButton* button = [self buttonWithType:ButtonTypeSystem];
  [button setImage:image forState:UIControlStateNormal];
  return button;
}

+ (UIButton*) buttonWithAttributedString:(NSAttributedString*)attributedString {
  return [self buttonWithType:ButtonTypeSystem attributedString:attributedString];
}

+ (UIButton*) buttonWithImage:(UIImage*)image attributedString:(NSAttributedString*)attributedString {
  UIButton* button = [self buttonWithImage:image];
  [button setAttributedTitle:attributedString forState:UIControlStateNormal];
  return button;
}

+ (UIButton*) buttonKeyboard {
  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.bounds = CGRectMake(0.0f, 0.0f, [self sizeTap].width, [self sizeTap].height);
  button.layer.shadowOffset = CGSizeZero;
  button.layer.shadowRadius = 0.0f;
  button.layer.shadowOpacity = [Library shadowOpacity];
  button.layer.shadowColor = [Library colorBaseWhite].CGColor;
  UILabel* keyboardLabel = [self labelWithString:unicodeKeyboard];
  [button addSubview:keyboardLabel];
  UILabel* arrowheadLabel = [self labelWithString:unicodeDownArrowhead];
  [button addSubview:arrowheadLabel];
  [button addConstraints:[NSArray arrayWithObjects:
    [self constraintOfCenterXForView:keyboardLabel withReferenceView:button],
    [self constraintOfCenterYForView:keyboardLabel withReferenceView:button],
    [self constraintOfCenterXForView:arrowheadLabel withReferenceView:button],
    [NSLayoutConstraint constraintWithItem:arrowheadLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
      toItem:button attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:[self sizeAquaStandard].height],
    nil]];
  button.tag = TagTypeKeyboard;
  return button;
}

+ (UIPageControl*) pageControl {
  UIPageControl* pageControl = [UIPageControl new];
  pageControl.translatesAutoresizingMaskIntoConstraints = NO;
  pageControl.defersCurrentPageDisplay = YES;
  pageControl.currentPage = 0;
  return pageControl;
}

+ (UIPageControl*) pageControlWithNumberOfPages:(NSInteger)numberOfPages {
  UIPageControl* pageControl = [self pageControl];
  pageControl.numberOfPages = numberOfPages;
  return pageControl;
}

+ (UISegmentedControl*) segmentedControlWithItems:(NSArray*)items {
  UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
  segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
  return segmentedControl;
}

+ (UISwitch*) switchWithColor:(UIColor*)color {
  UISwitch* _switch = [UISwitch new];
  _switch.translatesAutoresizingMaskIntoConstraints = NO;
  _switch.tintColor = [self colorWithWhite:0.3f];
  _switch.thumbTintColor = [self colorWithWhite:0.2f];
  _switch.onTintColor = color;
  return _switch;
}

+ (UITextField*) textField {
  UITextField* textField = [UITextField new];
  textField.translatesAutoresizingMaskIntoConstraints = NO;
  textField.layer.cornerRadius = [Library sizeMini].width;
  textField.backgroundColor = [self colorBaseWhite];
  return textField;
}

+ (UITextField*) textFieldWithAttributeDictionary:(NSDictionary*)attributeDictionary {
  UITextField* textField = [self textField];
  textField.defaultTextAttributes = attributeDictionary;
  return textField;
}

+ (UITextField*) textFieldWithAttributeDictionary:(NSDictionary*)attributeDictionary placeholder:(NSString*)placeholder {
  UITextField* textField = [self textFieldWithAttributeDictionary:attributeDictionary];
  textField.placeholder = placeholder;
  return textField;
}

+ (UITextField*) textFieldWithAttributeDictionary:(NSDictionary*)attributeDictionary placeholder:(NSString*)placeholder keyboardType:(NSInteger)keyboardType autocapitalizationType:(UITextAutocapitalizationType)autocapitalizationType autocorrectionType:(UITextAutocorrectionType)autocorrectionType {
  UITextField* textField = [self textFieldWithAttributeDictionary:attributeDictionary placeholder:placeholder];
  textField.keyboardType = keyboardType;
  textField.autocapitalizationType = autocapitalizationType;
  textField.autocorrectionType = autocorrectionType;
  return textField;
}

+ (void) forButton:(UIButton*)button animateWithDuration:(CGFloat)duration delay:(CGFloat)delay {
  [UIView animateWithDuration:duration delay:delay options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse)
    animations:^(void) {
      button.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
      button.layer.shadowRadius = 10.0f;
    }
    completion:^(BOOL finished) {
      button.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
      button.layer.shadowRadius = 0.0f;
    }];
}

+ (void) forTextField:(UITextField*)textField selectOffset:(NSInteger)offset {
  UITextPosition* from = [textField positionFromPosition:textField.beginningOfDocument offset:offset];
  textField.selectedTextRange = [textField textRangeFromPosition:from toPosition:[textField positionFromPosition:from offset:0]];
}

+ (UIView*) firstResponderInView:(UIView*)view {
  UIView* firstResponder = nil;
  NSArray* subviewArray = view.subviews;
  for (NSInteger index = 0; index < subviewArray.count; index++) {
    UIView* subview = (UIView*)subviewArray[index];
    if ([subview isFirstResponder]) {
      firstResponder = subview;
      break;
    }
  }
  return firstResponder;
}

// UIImage
+ (UIImage*) imageOriginalWithImage:(UIImage*)image {
  return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

// UIBarItem
+ (UIBarButtonItem*) barButtonItemFixedSpaceWithWidth:(CGFloat)width {
  UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
  barButtonItem.width = width;
  return barButtonItem;
}

+ (UIBarButtonItem*) barButtonItemFlexibleSpace {
  return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

// UIFont
+ (UIFont*) fontWithMultiplier:(CGFloat)multiplier {
  UIFont* font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  return (multiplier == 1.0f)? font : [font fontWithSize:(multiplier * font.pointSize)];
}

+ (UIFont*) fontWithMultiplier:(CGFloat)multiplier traits:(UIFontDescriptorSymbolicTraits)traits {
  UIFontDescriptor* fontDescriptor = [[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody] fontDescriptorWithSymbolicTraits:traits];
  CGFloat size = (multiplier == 1.0f)? 0.0f : (multiplier * fontDescriptor.pointSize);
  return [UIFont fontWithDescriptor:fontDescriptor size:size];
}

// UIColor
+ (UIColor*) colorWithWhite:(CGFloat)white {
  return [UIColor colorWithWhite:white alpha:1.0f];
}

+ (UIColor*) colorTextStyleHeadline {
  return [self colorWithWhite:0.9f];
}

+ (UIColor*) colorTextStyleSubheadline {
  return [self colorWithWhite:0.75f];
}

+ (UIColor*) colorTextStyleBody {
  return [self colorWithWhite:0.75f];
}

+ (UIColor*) colorTextStyleFootnote {
  return [self colorWithWhite:0.8f];
}

// Black
// RGB: 0.0f 0.0f 0.0f
+ (UIColor*) colorBaseBlack {
  return [UIColor blackColor];
}

// White
// RGB: 1.0f 1.0f 1.0f
+ (UIColor*) colorBaseWhite {
  return [UIColor whiteColor];
}

// Gray
+ (UIColor*) colorBaseGray {
  return [UIColor grayColor];
}

// Dark Gray
+ (UIColor*) colorBaseDarkGray {
  return [UIColor darkGrayColor];
}

// Light Gray
+ (UIColor*) colorBaseLightGray {
  return [UIColor lightGrayColor];
}

// Clear
+ (UIColor*) colorBaseClear {
  return [UIColor clearColor];
}

// Background
// RGB: 0 51 242
+ (UIColor*) colorBaseBackground {
  return [UIColor colorWithRed:0.0f green:0.2f blue:0.95f alpha:1.0f];
}

// Red
// RGB: 1.0f 0.0f 0.0f
+ (UIColor*) colorApplePrimaryAddRed {
  return [UIColor redColor];
}

// Green
// RGB: 0.0f 1.0f 0.0f
+ (UIColor*) colorApplePrimaryAddGreen {
  return [UIColor greenColor];
}

// Blue
// RGB: 0.0f 0.0f 1.0f
+ (UIColor*) colorApplePrimaryAddBlue {
  return [UIColor blueColor];
}

// Cyan
// RGB: 0.0f 1.0f 1.0f
+ (UIColor*) colorApplePrimarySubCyan {
  return [UIColor cyanColor];
}

// Magenta
// RGB: 1.0f 0.0f 1.0f
+ (UIColor*) colorApplePrimarySubMagenta {
  return [UIColor magentaColor];
}

// Yellow
// RGB: 1.0f 1.0f 0.0f
+ (UIColor*) colorApplePrimarySubYellow {
  return [UIColor yellowColor];
}

// Mustard
// RGB: 0.5f 0.5f 0.0f
+ (UIColor*) colorAppleHalfDarkMustard {
  return [UIColor colorWithRed:0.5f green:0.5f blue:0.0f alpha:1.0f];
}

// Purple
// RGB: 0.5f 0.0f 0.5f
+ (UIColor*) colorAppleHalfDarkPurple {
  return [UIColor purpleColor];
}

// Seaweed
// RGB: 0.0f 0.5f 0.5f
+ (UIColor*) colorAppleHalfDarkSeaweed {
  return [UIColor colorWithRed:0.0f green:0.5f blue:0.5f alpha:1.0f];
}

// Orange
// RGB: 1.0f 0.5f 0.0f
+ (UIColor*) colorAppleHalfLightOrange {
  return [UIColor orangeColor];
}

// Pink
// RGB: 1.0f 0.0f 0.5f
+ (UIColor*) colorAppleHalfLightPink {
  return [UIColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0f];
}

// Lime
// RGB: 0.5f 1.0f 0.0f
+ (UIColor*) colorAppleHalfLightLime {
  return [UIColor colorWithRed:0.5f green:1.0f blue:0.0f alpha:1.0f];
}

// Seafoam
// RGB: 0.0f 1.0f 0.5f
+ (UIColor*) colorAppleHalfLightSeafoam {
  return [UIColor colorWithRed:0.0f green:1.0f blue:0.5f alpha:1.0f];
}

// Mountain
// RGB: 0.5f 0.0f 1.0f
+ (UIColor*) colorAppleHalfLightMountain {
  return [UIColor colorWithRed:0.5f green:0.0f blue:1.0f alpha:1.0f];
}

// Sky
// RGB: 0.0f 0.5f 1.0f
+ (UIColor*) colorAppleHalfLightSky {
  return [UIColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:1.0f];
}

// Pantone Cool Gray 11 C
// CMYK: 44 34 22 77
+ (UIColor*) colorSub11Gray {
  return [UIColor colorWithRed:83.0f/255.0f green:86.0f/255.0f blue:90.0f/255.0f alpha:1.0f];
}

// Pantone Red 186 C
// CMYK: 2 100 85 6
+ (UIColor*) colorSub11Red {
  return [UIColor colorWithRed:200.0f/255.0f green:16.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
}

// Pantone Reflex Blue C
// CMYK: 100 89 0 0
+ (UIColor*) colorSub11Blue {
  return [UIColor colorWithRed:0.0f/255.0f green:20.0f/255.0f blue:137.0f/255.0f alpha:1.0f];
}

// Pantone Yellow C
// CMYK: 0 1 100 0
+ (UIColor*) colorSub11Yellow {
  return [UIColor colorWithRed:254.0f/255.0f green:221.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

// Pantone Green 348 C
// CMYK: 96 2 100 12
+ (UIColor*) colorSub11Green {
  return [UIColor colorWithRed:0.0f/255.0f green:132.0f/255.0f blue:61.0f/255.0f alpha:1.0f];
}

// Pantone Orange 021 C
// CMYK: 0 65 100 0
+ (UIColor*) colorSub11Orange {
  return [UIColor colorWithRed:254.0f/255.0f green:80.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

// Pantone Pink 219 C
// CMYK: 1 92 4 0
+ (UIColor*) colorSub11Pink {
  return [UIColor colorWithRed:218.0f/255.0f green:24.0f/255.0f blue:132.0f/255.0f alpha:1.0f];
}

// Pantone Purple C
// CMYK: 40 90 0 0
+ (UIColor*) colorSub11Purple {
  return [UIColor colorWithRed:187.0f/255.0f green:41.0f/255.0f blue:187.0f/255.0f alpha:1.0f];
}

// UIMotionEffectGroup
+ (UIMotionEffectGroup*) motionEffectGroupWithNaturalDirection:(BOOL)naturalDirection {
  UIInterpolatingMotionEffect* motionEffectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
  UIInterpolatingMotionEffect* motionEffectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
  if (naturalDirection) {
    motionEffectX.minimumRelativeValue = @-10;
    motionEffectX.maximumRelativeValue = @10;
    motionEffectY.minimumRelativeValue = @-10;
    motionEffectY.maximumRelativeValue = @10;
  }
  else {
    motionEffectX.minimumRelativeValue = @10;
    motionEffectX.maximumRelativeValue = @-10;
    motionEffectY.minimumRelativeValue = @10;
    motionEffectY.maximumRelativeValue = @-10;
  }
  UIMotionEffectGroup* motionEffectGroup = [UIMotionEffectGroup new];
  motionEffectGroup.motionEffects = @[motionEffectX, motionEffectY];
  return motionEffectGroup;
}

// UITraitCollection
+ (UITraitCollection*) traitCollectionWithHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass verticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass {
  return [UITraitCollection traitCollectionWithTraitsFromCollections:[NSArray arrayWithObjects:[UITraitCollection traitCollectionWithHorizontalSizeClass:horizontalSizeClass], [UITraitCollection traitCollectionWithVerticalSizeClass:verticalSizeClass], nil]];
}

// MKMapView
+ (MKMapView*) mapView {
  MKMapView* mapView = [MKMapView new];
  mapView.translatesAutoresizingMaskIntoConstraints = NO;
  return mapView;
}

+ (MKMapView*) mapViewWithCenterCoordinate:(CLLocationCoordinate2D)coordinate spanDistance:(CGFloat)distance {
  MKMapView* mapView = [self mapView];
  mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, distance, distance);
  return mapView;
}

+ (MKPointAnnotation*) pointAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle {
  MKPointAnnotation* annotation = [MKPointAnnotation new];
  annotation.coordinate = coordinate;
  if (title) annotation.title = title;
  if (subtitle) annotation.subtitle = subtitle;
  return annotation;
}

+ (MKPinAnnotationView*) pinAnnotationViewWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString*)identifier {
  MKPinAnnotationView* pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
  pin.animatesDrop = YES;
  return pin;
}

// WKWebView
+ (WKWebView*) webView {
  WKWebView* webView = [WKWebView new];
  webView.translatesAutoresizingMaskIntoConstraints = NO;
  webView.allowsBackForwardNavigationGestures = YES;
  return webView;
}

// NSAttributedString
+ (NSAttributedString*) attributedStringWithString:(NSString*)string attributeDictionary:(NSDictionary*)attributeDictionary {
  return [[NSAttributedString alloc] initWithString:string attributes:attributeDictionary];
}

// NSMutableAttributedString
+ (NSMutableAttributedString*) mutableAttributedStringWithAttributedString:(NSAttributedString*)attributedString {
  return [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
}

+ (NSMutableAttributedString*) mutableAttributedStringWithString:(NSString*)string attributeDictionary:(NSDictionary*)attributeDictionary {
  return [[NSMutableAttributedString alloc] initWithString:string attributes:attributeDictionary];
}

// NSString
+ (NSString*) string:(NSString*)string remainderWithCharactersInSet:(NSCharacterSet*)characterSet {
  NSMutableString* mutableString = [NSMutableString string];
  for (NSInteger index = 0; index < string.length; index++) {
    NSString* substring = [string substringWithRange:NSMakeRange(index, 1)];
    if ([characterSet isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:substring]]) [mutableString appendString:substring];
  }
  return mutableString;
}

+ (NSString*) string:(NSString*)string remainderWithoutCharactersInSet:(NSCharacterSet*)characterSet {
  NSArray* components = [string componentsSeparatedByCharactersInSet:characterSet];
  NSMutableString* mutableString = [NSMutableString string];
  for (NSInteger index = 0; index < components.count; index++) [mutableString appendString:(NSString*)components[index]];
  return mutableString;
}

// NSCharacterSet
+ (NSCharacterSet*) characterSetPhonePunctuation {
  return [NSCharacterSet characterSetWithCharactersInString:@"() -"];
}

// NSDictionary
+ (NSDictionary*) attributeDictionaryToolbarButton {
  return [NSDictionary dictionaryWithObject:[self fontWithMultiplier:1.3f traits:UIFontDescriptorTraitBold] forKey:[Library attributeNameForAttributeType:AttributeTypeFont]];
}

// NSParagraphStyle
+ (NSParagraphStyle*) paragraphStyleWithTextAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode {
  NSMutableParagraphStyle* paragraphStyle = [NSMutableParagraphStyle new];
  paragraphStyle.alignment = textAlignment;
  paragraphStyle.lineBreakMode = lineBreakMode;
  return paragraphStyle;
}

+ (NSParagraphStyle*) paragraphStyleWithTextAlignment:(NSTextAlignment)textAlignment {
  return [self paragraphStyleWithTextAlignment:textAlignment lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSParagraphStyle*) paragraphStyleTextAlignmentCenter {
  return [self paragraphStyleWithTextAlignment:NSTextAlignmentCenter];
}

+ (NSParagraphStyle*) paragraphStyleTextAlignmentLeft {
  return [self paragraphStyleWithTextAlignment:NSTextAlignmentLeft];
}

// NSNumber
+ (NSNumber*) strokeWidthSheer {
  return [NSNumber numberWithFloat:-0.4f];
}

+ (NSNumber*) strokeWidthSubtle {
  return [NSNumber numberWithFloat:-0.65f];
}

+ (NSNumber*) strokeWidthStandard {
  return [NSNumber numberWithFloat:-2.0f];
}

+ (NSNumber*) strokeWidthSuper {
  return [NSNumber numberWithFloat:-3.0f];
}

// NSShadow
+ (NSShadow*) shadow {
  NSShadow* shadow = [NSShadow new];
  shadow.shadowOffset = [self shadowOffset];
  shadow.shadowBlurRadius = [self shadowRadius];
  shadow.shadowColor = [self colorBaseBlack];
  return shadow;
}

+ (CGSize) shadowOffset {
  return CGSizeMake(1.0f, 1.0f);
}

+ (CGFloat) shadowRadius {
  return 4.0f;
}

+ (CGFloat) shadowOpacity {
  return 1.0f;
}

// NSDecimal
+ (NSDecimal) decimal0 {
  return [[NSDecimalNumber zero] decimalValue];
}

+ (NSDecimal) decimal1 {
  return [[NSDecimalNumber one] decimalValue];
}

+ (NSDecimal) decimalAddWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode {
  NSDecimal result;
  NSDecimalAdd(&result, &leftOperand, &rightOperand, roundingMode);
  return result;
}

+ (NSComparisonResult) decimalCompareWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand {
  return NSDecimalCompare(&leftOperand, &rightOperand);
}

+ (NSDecimal) decimalCopyWithSource:(NSDecimal)source {
  NSDecimal destination;
  NSDecimalCopy(&destination, &source);
  return destination;
}

+ (NSDecimal) decimalDivideWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode {
  NSDecimal result;
  NSDecimalDivide(&result, &leftOperand, &rightOperand, roundingMode);
  return result;
}

+ (NSDecimal) decimalMultiplyWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode {
  NSDecimal result;
  NSDecimalMultiply(&result, &leftOperand, &rightOperand, roundingMode);
  return result;
}

+ (NSDecimal) decimalMultiplyByPowerOf10WithNumber:(NSDecimal)number power:(short)power roundingMode:(NSRoundingMode)roundingMode {
  NSDecimal result;
  NSDecimalMultiplyByPowerOf10(&result, &number, power, roundingMode);
  return result;
}

+ (NSDecimal) decimalRoundWithNumber:(NSDecimal)number scale:(NSInteger)scale roundingMode:(NSRoundingMode)roundingMode {
  NSDecimal result;
  NSDecimalRound(&result, &number, scale, roundingMode);
  return result;
}

+ (NSDecimal) decimalScanWithString:(NSString*)string {
  NSDecimal decimal;
  [[NSScanner localizedScannerWithString:string] scanDecimal:&decimal];
  return decimal;
}

+ (NSString*) decimalStringWithDecimal:(NSDecimal)decimal {
  return NSDecimalString(&decimal, [NSLocale autoupdatingCurrentLocale]);
}

+ (NSDecimal) decimalSubtractWithLeftOperand:(NSDecimal)leftOperand rightOperand:(NSDecimal)rightOperand roundingMode:(NSRoundingMode)roundingMode {
  NSDecimal result;
  NSDecimalSubtract(&result, &leftOperand, &rightOperand, roundingMode);
  return result;
}

// NSLayoutConstraint
+ (NSArray*) constraintArrayForContentView:(UIView*)contentView withController:(UIViewController*)controller {
  return [NSArray arrayWithObjects:
    [self constraintOfLeftForView:contentView withReferenceView:controller.view],
    [self constraintOfRightForView:contentView withReferenceView:controller.view],
    [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:controller.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
      toItem:controller.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f],
    nil];
}

+ (NSArray*) constraintArrayForSubview:(UIView*)subview withContentView:(UIView*)contentView {
  return [NSArray arrayWithObjects:
    [self constraintOfLeftForView:subview withReferenceView:contentView],
    [self constraintOfRightForView:subview withReferenceView:contentView],
    [self constraintOfTopForView:subview withReferenceView:contentView],
    [self constraintOfBottomForView:subview withReferenceView:contentView],
    nil];
}

+ (NSArray*) constraintArrayWithLeftMarginRightMarginTopBottomMarginForSubview:(UIView*)subview withContentView:(UIView*)contentView {
  return [NSArray arrayWithObjects:
    [self constraintOfLeftMarginForView:subview withReferenceView:contentView],
    [self constraintOfRightMarginForView:subview withReferenceView:contentView],
    [self constraintOfTopForView:subview withReferenceView:contentView],
    [self constraintOfBottomMarginForView:subview withReferenceView:contentView],
    nil];
}

+ (NSArray*) constraintArrayWithLeftRightTopMarginBottomForSubview:(UIView*)subview withContentView:(UIView*)contentView {
  return [NSArray arrayWithObjects:
    [Library constraintOfLeftForView:subview withReferenceView:contentView],
    [Library constraintOfRightForView:subview withReferenceView:contentView],
    [Library constraintOfTopMarginForView:subview withReferenceView:contentView],
    [Library constraintOfBottomForView:subview withReferenceView:contentView],
    nil];
}

+ (NSArray*) constraintArrayOfCenterXLeftRightForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:view withReferenceView:referenceView],
    [Library constraintOfLeftForView:view withReferenceView:referenceView],
    [Library constraintOfRightForView:view withReferenceView:referenceView],
    nil];
}

+ (NSArray*) constraintArrayOfCenterXLeftRightTopForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSArray arrayWithObjects:
    [self constraintOfCenterXForView:view withReferenceView:referenceView],
    [self constraintOfLeftForView:view withReferenceView:referenceView],
    [self constraintOfRightForView:view withReferenceView:referenceView],
    [self constraintOfTopForView:view withReferenceView:referenceView],
    nil];
}

+ (NSLayoutConstraint*) constraintOfCenterXForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfLeftForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfLeftMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeLeftMargin multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfRightForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfRightMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeRightMargin multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfCenterYForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfTopForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfTopMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeTopMargin multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfBottomForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfBottomMarginForView:(UIView*)view withReferenceView:(UIView*)referenceView {
  return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
    toItem:referenceView attribute:NSLayoutAttributeBottomMargin multiplier:1.0f constant:0.0f];
}

+ (NSLayoutConstraint*) constraintOfHeightForTextField:(UITextField*)textField {
  return [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
    toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:35.0f];
}

+ (NSLayoutConstraint*) constraintOfHeightForPickerView:(UIPickerView*)pickerView withHeightType:(HeightType)heightType {
  CGFloat height = 0.0f;
  switch (heightType) {
    case HeightTypeSmall: height = 162.0f; break;
    case HeightTypeMedium: height = 180.0f; break;
    case HeightTypeLarge: height = 216.0f; break;
  }
  return [NSLayoutConstraint constraintWithItem:pickerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
    toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:height];
}

// BOOL
+ (BOOL) isValidEmail:(NSString*)email {
  BOOL valid = (email.length > 0);
  if (valid) {
    if ([email hasPrefix:@"mailto:"]) valid = NO;
  }
  if (valid) {
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:NULL];
    NSRange range = NSMakeRange(0, [email length]);
    NSArray* matches = [detector matchesInString:email options:0 range:range];
    if (matches.count != 1) valid = NO;
    else {
      NSTextCheckingResult* result = matches.firstObject;
      if ((result.resultType != NSTextCheckingTypeLink) || (! [result.URL.scheme isEqualToString:@"mailto"]) || (! NSEqualRanges(result.range, range))) valid = NO;
    }
  }
  return valid;
}

+ (BOOL) isValidPhone:(NSString*)phone {
  BOOL valid = (phone.length == 14);
  if (valid) {
    NSString* areaFirstDigit = [phone substringWithRange:NSMakeRange(1, 1)];
    NSString* exchangeFirstDigit = [phone substringWithRange:NSMakeRange(6, 1)];
    if (([areaFirstDigit isEqualToString:@"0"]) || ([areaFirstDigit isEqualToString:@"1"]) || ([exchangeFirstDigit isEqualToString:@"0"]) || ([exchangeFirstDigit isEqualToString:@"1"])) valid = NO;
  }
  return valid;
}

// NSURL
+ (NSURL*) documentURL {
  return [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
}

// NSString
+ (NSString*) attributeNameForAttributeType:(AttributeType)attributeType {
  NSString* string;
  switch (attributeType) {
    case AttributeTypeFont:string = NSFontAttributeName; break;
    case AttributeTypeParagraphStyle: string = NSParagraphStyleAttributeName; break;
    case AttributeTypeForegroundColor: string = NSForegroundColorAttributeName; break;
    case AttributeTypeStrokeWidth: string = NSStrokeWidthAttributeName; break;
    case AttributeTypeStrokeColor: string = NSStrokeColorAttributeName; break;
    case AttributeTypeUnderlineStyle: string = NSUnderlineStyleAttributeName; break;
    case AttributeTypeUnderlineColor: string = NSUnderlineColorAttributeName; break;
    case AttributeTypeShadow: string = NSShadowAttributeName; break;
  }
  return string;
}

+ (NSString*) identifierWithDomain:(NSString*)domain index:(NSInteger)index {
  return [NSString stringWithFormat:@"%@%@", domain, [NSNumber numberWithInteger:index].stringValue];
}

+ (NSString*) identifierWithDomain:(NSString*)domain indexPath:(NSIndexPath*)indexPath {
  return [NSString stringWithFormat:@"%@%@%@", domain, [NSNumber numberWithInteger:indexPath.section].stringValue, [NSNumber numberWithInteger:indexPath.row].stringValue];
}

// CGFloat
+ (CGFloat) pickerViewComponentWidthForIntegerWithTextStyle:(NSString*)textStyle {
  CGFloat constant = 0.0f;
  if ([textStyle isEqualToString:UIFontTextStyleHeadline]) constant = 21.0f;
  return constant;
}

+ (CGFloat) pickerViewComponentWidthForStringOfLength:(NSInteger)length withTextStyle:(NSString*)textStyle {
  CGFloat multiplier = 1.0f;
  if ([textStyle isEqualToString:UIFontTextStyleHeadline]) multiplier = 28.0f;
  return (multiplier * length);
}

+ (CGFloat) pickerViewComponentWidthForPunctuationWithTextStyle:(NSString*)textStyle {
  CGFloat constant = 0.0f;
  if ([textStyle isEqualToString:UIFontTextStyleHeadline]) constant = 21.0f;  // 14.0f;
  return constant;
}

+ (CGFloat) pickerViewRowHeight {
  return [self sizeTap].height;
}

+ (CGFloat) bezierHeight {
  return 1.0f;
}

// CGSize
+ (CGSize) sizeMini {
  return CGSizeMake(4.0f, 4.0f);
}

+ (CGSize) sizeAquaStandard {
  return CGSizeMake(8.0f, 8.0f);
}

+ (CGSize) sizeAquaSuper {
  return CGSizeMake(20.0f, 20.0f);
}

+ (CGSize) sizeTap {
  return CGSizeMake(44.0f, 44.0f);
}

// AVAudioPlayer
+ (AVAudioPlayer*) audioPlayerWithResource:(NSString*)resource extension:(NSString*)extension hint:(NSString*)hint {
  AVAudioPlayer* audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:resource withExtension:extension] fileTypeHint:hint error:nil];
  if (audioPlayer) [audioPlayer prepareToPlay];
  return audioPlayer;
}

+ (void) playAudioPlayer:(AVAudioPlayer*)audioPlayer {
  [audioPlayer play];
  [audioPlayer prepareToPlay];
}

+ (void) stopAudioPlayer:(AVAudioPlayer*)audioPlayer {
  [audioPlayer stop];
  audioPlayer.currentTime = 0.0f;
  [audioPlayer prepareToPlay];
}

@end
