// SuccessController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "SuccessController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif
#ifndef VehicleGarageController_h
#import "VehicleGarageController.h"
#endif

static NSString* const detail = @"Thank you for your appointment request! It submitted successfully, and we will contact you soon to confirm your requested date and time.";
static NSString* const logo = @"PJWAuto-55";
static NSString* const SERVICE = @"Service";
static NSString* const VEHICLE = @"Vehicle";
static NSString* const CONTACT = @"Contact";
static NSString* const ServiceTypes = @"Service Types";
static NSString* const UnusualNoises = @"Unusual Noises";
static NSString* const Note = @"Note";
static NSString* const action = @"Copy Appointment Request";

@interface SuccessController ()
@property (nonatomic) Service* _service;
@property (nonatomic) Vehicle* _vehicle;
@property (nonatomic) Contact* _contact;
@property (nonatomic) UIScrollView* _scrollView;
@end

@implementation SuccessController

- (instancetype) initWithService:(Service*)service vehicle:(Vehicle *)vehicle contact:(Contact *)contact {
  if (self = [super init]) {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.leftBarButtonItem.tag = TagTypeDone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeAction;
    self._service = service;
    self._vehicle = vehicle;
    self._contact = contact;
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service vehicle:(Vehicle *)vehicle contact:(Contact *)contact {
  return [[SuccessController alloc] initWithService:service vehicle:vehicle contact:contact];
}

- (void) loadView {
  [super loadView];
  UILabel* detailLabel = [Library labelWithAttributedString:[Library attributedStringWithString:detail attributeDictionary:self._attributeDictionaryHeader25]];
  [self._contentView addSubview:detailLabel];
  UIImageView* logoImageView = [Library imageViewWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:logo]]];
  [self._contentView addSubview:logoImageView];
  self._scrollView = [Library scrollView];
  [self._contentView addSubview:self._scrollView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
    [Library constraintOfCenterXForView:detailLabel withReferenceView:self._contentView],
    [Library constraintOfTopMarginForView:detailLabel withReferenceView:self._contentView],
    [Library constraintOfCenterXForView:logoImageView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:detailLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height + [Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._scrollView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._scrollView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:logoImageView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfBottomMarginForView:self._scrollView withReferenceView:self._contentView],
    nil]];
  UILabel* serviceHeader = [Library labelWithAttributedString:[Library attributedStringWithString:SERVICE.uppercaseString attributeDictionary:self._attributeDictionaryHeader3]];
  [self._scrollView addSubview:serviceHeader];
  NSDictionary* service = [self._service service];
  UILabel* dateLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[service objectForKey:ServiceKeyDate] attributeDictionary:self._attributeDictionaryLabel15]];
  [self._scrollView addSubview:dateLabel];
  UILabel* timeLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[service objectForKey:ServiceKeyTime] attributeDictionary:self._attributeDictionaryLabel15]];
  [self._scrollView addSubview:timeLabel];
  UILabel* waitLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[service objectForKey:ServiceKeyWait] attributeDictionary:self._attributeDictionaryLabel23]];
  [self._scrollView addSubview:waitLabel];
  UILabel* typeHeader = [Library labelWithAttributedString:[Library attributedStringWithString:ServiceTypes attributeDictionary:self._attributeDictionaryHeader4]];
  [self._scrollView addSubview:typeHeader];
  NSArray* typeArray = (NSArray*)[service objectForKey:ServiceKeyTypeArray];
  NSMutableAttributedString* typeAttributedString = [Library mutableAttributedStringWithString:(NSString*)typeArray[0] attributeDictionary:self._attributeDictionaryLabel23];
  for (NSInteger index = 1; index < typeArray.count; index++) [typeAttributedString appendAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"\n%@", (NSString*)typeArray[index]] attributeDictionary:self._attributeDictionaryLabel23]];
  UILabel* typeLabel = [Library labelWithAttributedString:typeAttributedString];
  [self._scrollView addSubview:typeLabel];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:serviceHeader withReferenceView:self._scrollView],
    [Library constraintOfTopForView:serviceHeader withReferenceView:self._scrollView],
    [Library constraintOfCenterXForView:dateLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:dateLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:dateLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:serviceHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:timeLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:timeLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:timeLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:dateLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:waitLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:waitLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:waitLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:waitLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:timeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:typeHeader withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:typeHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:waitLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:6.0f],
    [Library constraintOfCenterXForView:typeLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:typeLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:typeLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:typeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:typeHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:2.0f],
    nil]];
  UIView* viewPrecedingNoteHeader = typeLabel;
  NSArray* noiseArray = (NSArray*)[service objectForKey:ServiceKeyNoiseArray];
  NSString* noiseAtZero = (NSString*)noiseArray[0];
  if (! [noiseAtZero isEqualToString:(NSString*)[self._service noiseTable][0]]) {
    UILabel* noiseHeader = [Library labelWithAttributedString:[Library attributedStringWithString:UnusualNoises attributeDictionary:self._attributeDictionaryHeader4]];
    [self._scrollView addSubview:noiseHeader];
    NSMutableAttributedString* noiseAttributedString = [Library mutableAttributedStringWithString:noiseAtZero attributeDictionary:self._attributeDictionaryLabel23];
    for (NSInteger index = 1; index < noiseArray.count; index++) [noiseAttributedString appendAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"\n%@", (NSString*)noiseArray[index]] attributeDictionary:self._attributeDictionaryLabel23]];
    UILabel* noiseLabel = [Library labelWithAttributedString:noiseAttributedString];
    [self._scrollView addSubview:noiseLabel];
    [self._scrollView addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfCenterXForView:noiseHeader withReferenceView:self._scrollView],
      [NSLayoutConstraint constraintWithItem:noiseHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:typeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:6.0f],
      [Library constraintOfLeftForView:noiseLabel withReferenceView:self._scrollView],
      [Library constraintOfRightForView:noiseLabel withReferenceView:self._scrollView],
      [Library constraintOfCenterXForView:noiseLabel withReferenceView:self._scrollView],
      [NSLayoutConstraint constraintWithItem:noiseLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:noiseHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:2.0f],
      nil]];
    viewPrecedingNoteHeader = noiseLabel;
  }
  UIView* viewPrecedingVehicleHeader = viewPrecedingNoteHeader;
  NSString* serviceNote = (NSString*)[service objectForKey:ServiceKeyNote];
  if (serviceNote) {
    UILabel* noteHeader = [Library labelWithAttributedString:[Library attributedStringWithString:Note attributeDictionary:self._attributeDictionaryHeader4]];
    [self._scrollView addSubview:noteHeader];
    UILabel* noteLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service note] attributeDictionary:self._attributeDictionaryLabel25]];
    [self._scrollView addSubview:noteLabel];
    [self._scrollView addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfCenterXForView:noteHeader withReferenceView:self._scrollView],
      [NSLayoutConstraint constraintWithItem:noteHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:viewPrecedingNoteHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:6.0f],
      [NSLayoutConstraint constraintWithItem:noteLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
        toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
      [NSLayoutConstraint constraintWithItem:noteLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
        toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
      [Library constraintOfCenterXForView:noteLabel withReferenceView:self._scrollView],
      [NSLayoutConstraint constraintWithItem:noteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:noteHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:2.0f],
      nil]];
    viewPrecedingVehicleHeader = noteLabel;
  }
  UILabel* vehicleHeader = [Library labelWithAttributedString:[Library attributedStringWithString:VEHICLE.uppercaseString attributeDictionary:self._attributeDictionaryHeader3]];
  [self._scrollView addSubview:vehicleHeader];
  UILabel* vehicleLabel = [Library labelWithAttributedString:[VehicleGarageController attributedStringForVehicle:[self._vehicle vehicle] withAttributeDictionary:self._attributeDictionaryLabel23 detailAttributeDictionary:self._attributeDictionaryLabel25]];
  [self._scrollView addSubview:vehicleLabel];
  UILabel* contactHeader = [Library labelWithAttributedString:[Library attributedStringWithString:CONTACT.uppercaseString attributeDictionary:self._attributeDictionaryHeader3]];
  [self._scrollView addSubview:contactHeader];
  NSDictionary* contact = [self._contact contact];
  UILabel* nameLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[Contact nameWithFirstName:(NSString*)[contact objectForKey:ContactKeyFirstName] lastName:(NSString*)[contact objectForKey:ContactKeyLastName]] attributeDictionary:self._attributeDictionaryLabel2]];
  [self._scrollView addSubview:nameLabel];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:vehicleHeader withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:vehicleHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:viewPrecedingVehicleHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:vehicleLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:vehicleLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:vehicleLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:vehicleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:vehicleHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:contactHeader withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:contactHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:vehicleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:nameLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:nameLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:nameLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:contactHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    nil]];
  UIView* viewPrecedingEmailLabel = nameLabel;
  NSString* company = (NSString*)[contact objectForKey:ContactKeyCompany];
  if (company) {
    UILabel* companyLabel = [Library labelWithAttributedString:[Library attributedStringWithString:company attributeDictionary:self._attributeDictionaryLabel23]];
    [self._scrollView addSubview:companyLabel];
    [self._scrollView addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfCenterXForView:companyLabel withReferenceView:self._scrollView],
      [Library constraintOfLeftForView:companyLabel withReferenceView:self._scrollView],
      [Library constraintOfRightForView:companyLabel withReferenceView:self._scrollView],
      [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:nameLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
      nil]];
    viewPrecedingEmailLabel = companyLabel;
  }
  UILabel* emailLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[contact objectForKey:ContactKeyEmail] attributeDictionary:self._attributeDictionaryLabel23]];
  [self._scrollView addSubview:emailLabel];
  UILabel* phoneLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[contact objectForKey:ContactKeyPhone] attributeDictionary:self._attributeDictionaryLabel23]];
  [self._scrollView addSubview:phoneLabel];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:emailLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:emailLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:emailLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:viewPrecedingEmailLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:phoneLabel withReferenceView:self._scrollView],
    [Library constraintOfLeftForView:phoneLabel withReferenceView:self._scrollView],
    [Library constraintOfRightForView:phoneLabel withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:emailLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomForView:phoneLabel withReferenceView:self._scrollView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._scrollView flashScrollIndicators];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  if ([sender tag] == TagTypeAction) {
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:action style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
      NSMutableString* string = [NSMutableString string];
      [string appendFormat:@"%@\n", SERVICE.uppercaseString];
      NSDictionary* service = [self._service service];
      [string appendFormat:@"%@\n", (NSString*)[service objectForKey:ServiceKeyDate]];
      [string appendFormat:@"%@\n", (NSString*)[service objectForKey:ServiceKeyTime]];
      [string appendFormat:@"%@\n", (NSString*)[service objectForKey:ServiceKeyWait]];
      [string appendFormat:@"-%@-\n", ServiceTypes];
      NSArray* typeArray = (NSArray*)[service objectForKey:ServiceKeyTypeArray];
      for (NSInteger index = 0; index < typeArray.count; index++) {
        NSMutableString* type = [NSMutableString stringWithString:(NSString*)typeArray[index]];
        NSRange range = [type rangeOfString:@"\n"];
        if (range.location != NSNotFound) [type replaceCharactersInRange:range withString:@" "];
        [string appendFormat:@"%@\n", type];
      }
      NSArray* noiseArray = (NSArray*)[service objectForKey:ServiceKeyNoiseArray];
      if (! [((NSString*)noiseArray[0]) isEqualToString:(NSString*)[self._service noiseTable][0]]) {
        [string appendFormat:@"-%@-\n", UnusualNoises];
        for (NSInteger index = 0; index < noiseArray.count; index++) [string appendFormat:@"%@\n", (NSString*)noiseArray[index]];
      }
      NSString* serviceNote = (NSString*)[service objectForKey:ServiceKeyNote];
      if (serviceNote) {
        [string appendFormat:@"-%@-\n", Note];
        [string appendFormat:@"%@\n", serviceNote];
      }
      [string appendString:@"\n"];
      [string appendFormat:@"%@\n", VEHICLE.uppercaseString];
      NSDictionary* vehicle = [self._vehicle vehicle];
      [string appendFormat:@"%@\n", [NSString stringWithFormat:@"%@ %@ %@", (NSString*)[vehicle objectForKey:VehicleKeyYear], (NSString*)[vehicle objectForKey:VehicleKeyMake], (NSString*)[vehicle objectForKey:VehicleKeyModel]]];
      NSString* vehicleNote = (NSString*)[vehicle objectForKey:VehicleKeyNote];
      if (vehicleNote) [string appendFormat:@"%@\n", vehicleNote];
      [string appendString:@"\n"];
      [string appendFormat:@"%@\n", CONTACT.uppercaseString];
      NSDictionary* contact = [self._contact contact];
      [string appendFormat:@"%@\n", [Contact nameWithFirstName:(NSString*)[contact objectForKey:ContactKeyFirstName] lastName:(NSString*)[contact objectForKey:ContactKeyLastName]]];
      NSString* company = (NSString*)[contact objectForKey:ContactKeyCompany];
      if (company) [string appendFormat:@"%@\n", company];
      [string appendFormat:@"%@\n", (NSString*)[contact objectForKey:ContactKeyEmail]];
      [string appendFormat:@"%@", (NSString*)[contact objectForKey:ContactKeyPhone]];
      [UIPasteboard generalPasteboard].string = string;
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {}]];
    [self presentViewController:controller animated:YES completion:nil];
  }
  else [self.delegate dismissViewController];
}

@end
