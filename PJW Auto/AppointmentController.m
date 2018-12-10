// AppointmentController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "AppointmentController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif
#ifndef ServiceDateController_h
#import "ServiceDateController.h"
#endif
#ifndef VehicleGarageController_h
#import "VehicleGarageController.h"
#endif
#ifndef VehicleYearController_h
#import "VehicleYearController.h"
#endif
#ifndef ContactController_h
#import "ContactController.h"
#endif
#ifndef SuccessController_h
#import "SuccessController.h"
#endif

static NSString* const title = @"Appointments";
static NSString* const logo = @"PJWAuto-44";
static NSString* const SERVICE = @"Service";
static NSString* const VEHICLE = @"Vehicle";
static NSString* const CONTACT = @"Contact";
static NSString* const ServiceTypes = @"Service Types";
static NSString* const UnusualNoises = @"Unusual Noises";
static NSString* const Note = @"Note";
static NSString* const alertService = @"Please add your service info.";
static NSString* const alertVehicle = @"Please add your vehicle info.";
static NSString* const alertContact = @"Please add your contact info.";
static NSString* const alertSubmit = @"Submit appointment request to PJW Automotive?";
static NSString* const alertHome = @"The service info of your unsubmitted appointment request will not be saved.";
static NSString* const url = @"http://www.pjwauto.com/contact-us/#wpcf7-f58-p79-o1";
static NSString* const data = @"_wpcf7=58&_wpcf7_version=4.3.1&_wpcf7_locale=&_wpcf7_unit_tag=wpcf7-f58-p79-o1&_wpnonce=d237624252";
static NSString* const errorSubmit = @"An error occurred. Please try submitting your appointment request again.";
static CGFloat const addButtonOffset = -63.0f;

typedef NS_ENUM(NSInteger, AppointmentTagType) {
  AppointmentTagTypeService,
  AppointmentTagTypeVehicle,
  AppointmentTagTypeContact
};

@interface AppointmentController ()
@property (nonatomic) Service* _service;
@property (nonatomic) Vehicle* _vehicle;
@property (nonatomic) Contact* _contact;
@property (nonatomic) UIBarButtonItem* _homeBarButton;
@property (nonatomic) NSArray* _submitBarButtonArray;
@property (nonatomic) UIBarButtonItem* _submitBarButton;
@property (nonatomic) NSArray* _activityBarButtonArray;
@property (nonatomic) UIScrollView* _scrollView;
@property (nonatomic) UIButton* _serviceButton;
@property (nonatomic) UIButton* _vehicleButton;
@property (nonatomic) UIButton* _contactButton;
@end

@implementation AppointmentController

- (instancetype) init {
  if (self = [super init]) {
    self.navigationItem.titleView = [Library labelTitleWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader16]];
    self._homeBarButton = [[UIBarButtonItem alloc] initWithTitle:Home style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self._homeBarButton.tag = TagTypeHome;
    self.navigationItem.leftBarButtonItem = self._homeBarButton;
    UIBarButtonItem* space = [Library barButtonItemFlexibleSpace];
    self._submitBarButton = [[UIBarButtonItem alloc] initWithTitle:Submit style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    [self._submitBarButton setTitleTextAttributes:[Library attributeDictionaryToolbarButton] forState:UIControlStateNormal];
    self._submitBarButton.tag = TagTypeSubmit;
    self._submitBarButton.tintColor = [Library colorBaseBlack];
    self._submitBarButtonArray = [NSArray arrayWithObjects:space, self._submitBarButton, space, nil];
    UIActivityIndicatorView* activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicatorView.color = [Library colorSub11Green];
    [activityIndicatorView startAnimating];
    UIBarButtonItem* activityBarButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicatorView];
    self._activityBarButtonArray = [NSArray arrayWithObjects:space, activityBarButton, space, nil];
    self.toolbarItems = self._submitBarButtonArray;
    self._service = [Service new];
    self._vehicle = [Vehicle new];
    self._contact = [Contact new];
  }
  return self;
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self._submitBarButton.tintColor = (([self._service service]) && ([self._vehicle vehicle]) && ([self._contact contact]))? [Library colorSub11Green] : [Library colorBaseBlack];
}

- (void) loadView {
  [super loadView];
  UIImageView* logoImageView = [Library imageViewWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:logo]]];
  [self._contentView addSubview:logoImageView];
  self._scrollView = [Library scrollView];
  [self._contentView addSubview:self._scrollView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:logoImageView withReferenceView:self._contentView],
    [Library constraintOfTopForView:logoImageView withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:self._scrollView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._scrollView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:logoImageView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfBottomMarginForView:self._scrollView withReferenceView:self._contentView],
    nil]];
  UILabel* serviceHeader = [Library labelWithAttributedString:[Library attributedStringWithString:SERVICE.uppercaseString attributeDictionary:self._attributeDictionaryHeader3]];
  [self._scrollView addSubview:serviceHeader];
  self._serviceButton = [Library buttonWithType:ButtonTypeCustom];
  self._serviceButton.tag = AppointmentTagTypeService;
  [self._serviceButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  self._serviceButton.layer.shadowOffset = CGSizeZero;
  self._serviceButton.layer.shadowRadius = 0.0f;
  self._serviceButton.layer.shadowOpacity = [Library shadowOpacity];
  self._serviceButton.layer.shadowColor = [Library colorBaseWhite].CGColor;
  [self._scrollView addSubview:self._serviceButton];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:serviceHeader withReferenceView:self._scrollView],
    [Library constraintOfTopForView:serviceHeader withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:self._serviceButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:serviceHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f],
    nil]];
  NSDictionary* service = [self._service service];
  if (service) {
    [self._scrollView addConstraints:[Library constraintArrayOfCenterXLeftRightForView:self._serviceButton withReferenceView:self._scrollView]];
    UILabel* dateLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[service objectForKey:ServiceKeyDate] attributeDictionary:self._attributeDictionaryButton15]];
    [self._serviceButton addSubview:dateLabel];
    UILabel* timeLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[service objectForKey:ServiceKeyTime] attributeDictionary:self._attributeDictionaryButton15]];
    [self._serviceButton addSubview:timeLabel];
    UILabel* waitLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[service objectForKey:ServiceKeyWait] attributeDictionary:self._attributeDictionaryButton23]];
    [self._serviceButton addSubview:waitLabel];
    UILabel* typeHeader = [Library labelWithAttributedString:[Library attributedStringWithString:ServiceTypes attributeDictionary:self._attributeDictionaryHeader4]];
    [self._serviceButton addSubview:typeHeader];
    NSArray* typeArray = (NSArray*)[service objectForKey:ServiceKeyTypeArray];
    NSMutableAttributedString* typeAttributedString = [Library mutableAttributedStringWithString:(NSString*)typeArray[0] attributeDictionary:self._attributeDictionaryButton23];
    for (NSInteger index = 1; index < typeArray.count; index++) [typeAttributedString appendAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"\n%@", (NSString*)typeArray[index]] attributeDictionary:self._attributeDictionaryButton23]];
    UILabel* typeLabel = [Library labelWithAttributedString:typeAttributedString];
    [self._serviceButton addSubview:typeLabel];
    [self._serviceButton addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfLeftForView:dateLabel withReferenceView:self._serviceButton],
      [Library constraintOfRightForView:dateLabel withReferenceView:self._serviceButton],
      [Library constraintOfTopMarginForView:dateLabel withReferenceView:self._serviceButton],
      [Library constraintOfLeftForView:timeLabel withReferenceView:self._serviceButton],
      [Library constraintOfRightForView:timeLabel withReferenceView:self._serviceButton],
      [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:dateLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
      [Library constraintOfLeftForView:waitLabel withReferenceView:self._serviceButton],
      [Library constraintOfRightForView:waitLabel withReferenceView:self._serviceButton],
      [NSLayoutConstraint constraintWithItem:waitLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:timeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
      [Library constraintOfLeftForView:typeHeader withReferenceView:self._serviceButton],
      [Library constraintOfRightForView:typeHeader withReferenceView:self._serviceButton],
      [NSLayoutConstraint constraintWithItem:typeHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:waitLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:6.0f],
      [Library constraintOfLeftForView:typeLabel withReferenceView:self._serviceButton],
      [Library constraintOfRightForView:typeLabel withReferenceView:self._serviceButton],
      [NSLayoutConstraint constraintWithItem:typeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:typeHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:2.0f],
      nil]];
    UIView* viewPrecedingNoteHeader = typeLabel;
    NSArray* noiseArray = (NSArray*)[service objectForKey:ServiceKeyNoiseArray];
    NSString* noiseAtZero = (NSString*)noiseArray[0];
    if (! [noiseAtZero isEqualToString:(NSString*)[self._service noiseTable][0]]) {
      UILabel* noiseHeader = [Library labelWithAttributedString:[Library attributedStringWithString:UnusualNoises attributeDictionary:self._attributeDictionaryHeader4]];
      [self._serviceButton addSubview:noiseHeader];
      NSMutableAttributedString* noiseAttributedString = [Library mutableAttributedStringWithString:noiseAtZero attributeDictionary:self._attributeDictionaryButton23];
      for (NSInteger index = 1; index < noiseArray.count; index++) [noiseAttributedString appendAttributedString:[Library attributedStringWithString:[NSString stringWithFormat:@"\n%@", (NSString*)noiseArray[index]] attributeDictionary:self._attributeDictionaryButton23]];
      UILabel* noiseLabel = [Library labelWithAttributedString:noiseAttributedString];
      [self._serviceButton addSubview:noiseLabel];
      [self._serviceButton addConstraints:[NSArray arrayWithObjects:
        [Library constraintOfLeftForView:noiseHeader withReferenceView:self._serviceButton],
        [Library constraintOfRightForView:noiseHeader withReferenceView:self._serviceButton],
        [NSLayoutConstraint constraintWithItem:noiseHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
          toItem:typeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:6.0f],
        [Library constraintOfLeftForView:noiseLabel withReferenceView:self._serviceButton],
        [Library constraintOfRightForView:noiseLabel withReferenceView:self._serviceButton],
        [NSLayoutConstraint constraintWithItem:noiseLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
          toItem:noiseHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:2.0f],
        nil]];
      viewPrecedingNoteHeader = noiseLabel;
    }
    NSString* note = (NSString*)[service objectForKey:ServiceKeyNote];
    if (note) {
      UILabel* noteHeader = [Library labelWithAttributedString:[Library attributedStringWithString:Note attributeDictionary:self._attributeDictionaryHeader4]];
      [self._serviceButton addSubview:noteHeader];
      UILabel* noteLabel = [Library labelWithAttributedString:[Library attributedStringWithString:note attributeDictionary:self._attributeDictionaryButton25]];
      [self._serviceButton addSubview:noteLabel];
      [self._serviceButton addConstraints:[NSArray arrayWithObjects:
        [Library constraintOfLeftForView:noteHeader withReferenceView:self._serviceButton],
        [Library constraintOfRightForView:noteHeader withReferenceView:self._serviceButton],
        [NSLayoutConstraint constraintWithItem:noteHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
          toItem:viewPrecedingNoteHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:6.0f],
        [NSLayoutConstraint constraintWithItem:noteLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
          toItem:self._serviceButton attribute:NSLayoutAttributeCenterX multiplier:0.15f constant:0.0f],
        [NSLayoutConstraint constraintWithItem:noteLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
          toItem:self._serviceButton attribute:NSLayoutAttributeCenterX multiplier:1.85f constant:0.0f],
        [Library constraintOfCenterXForView:noteLabel withReferenceView:self._serviceButton],
        [NSLayoutConstraint constraintWithItem:noteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
          toItem:noteHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:2.0f],
        [Library constraintOfBottomForView:noteLabel withReferenceView:self._serviceButton],
        nil]];
    }
    else [self._serviceButton addConstraint:[Library constraintOfBottomForView:viewPrecedingNoteHeader withReferenceView:self._serviceButton]];
  }
  else {
    self._service = [Service new];
    [self._scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self._serviceButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:addButtonOffset]];
    UIButton* serviceContent = [Library buttonWithType:ButtonTypeAdd attributedString:[Library attributedStringWithString:[NSString stringWithFormat:@" %@", SERVICE] attributeDictionary:self._attributeDictionaryAdd]];
    serviceContent.userInteractionEnabled = NO;
    serviceContent.tintColor = [Library colorApplePrimaryAddGreen];
    [self._serviceButton addSubview:serviceContent];
    [self._serviceButton addConstraints:[Library constraintArrayWithLeftRightTopMarginBottomForSubview:serviceContent withContentView:self._serviceButton]];
  }
  UILabel* vehicleHeader = [Library labelWithAttributedString:[Library attributedStringWithString:VEHICLE.uppercaseString attributeDictionary:self._attributeDictionaryHeader3]];
  [self._scrollView addSubview:vehicleHeader];
  self._vehicleButton = [Library buttonWithType:ButtonTypeCustom];
  self._vehicleButton.tag = AppointmentTagTypeVehicle;
  [self._vehicleButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  self._vehicleButton.layer.shadowOffset = CGSizeZero;
  self._vehicleButton.layer.shadowRadius = 0.0f;
  self._vehicleButton.layer.shadowOpacity = [Library shadowOpacity];
  self._vehicleButton.layer.shadowColor = [Library colorBaseWhite].CGColor;
  [self._scrollView addSubview:self._vehicleButton];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:vehicleHeader withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:vehicleHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._serviceButton attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [NSLayoutConstraint constraintWithItem:self._vehicleButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:vehicleHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f],
    nil]];
  UIView* vehicleContent = nil;
  NSDictionary* vehicle = [self._vehicle vehicle];
  if (vehicle) {
    [self._scrollView addConstraints:[Library constraintArrayOfCenterXLeftRightForView:self._vehicleButton withReferenceView:self._scrollView]];
    vehicleContent = [Library labelWithAttributedString:[VehicleGarageController attributedStringForVehicle:vehicle withAttributeDictionary:self._attributeDictionaryButton23 detailAttributeDictionary:self._attributeDictionaryButton25]];
  }
  else {
    [self._scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self._vehicleButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:addButtonOffset]];
    vehicleContent = [Library buttonWithType:ButtonTypeAdd attributedString:[Library attributedStringWithString:[NSString stringWithFormat:@" %@", VEHICLE] attributeDictionary:self._attributeDictionaryAdd]];
    vehicleContent.userInteractionEnabled = NO;
    vehicleContent.tintColor = [Library colorApplePrimaryAddGreen];
  }
  [self._vehicleButton addSubview:vehicleContent];
  [self._vehicleButton addConstraints:[Library constraintArrayWithLeftRightTopMarginBottomForSubview:vehicleContent withContentView:self._vehicleButton]];
  UILabel* contactHeader = [Library labelWithAttributedString:[Library attributedStringWithString:CONTACT.uppercaseString attributeDictionary:self._attributeDictionaryHeader3]];
  [self._scrollView addSubview:contactHeader];
  self._contactButton = [Library buttonWithType:ButtonTypeCustom];
  self._contactButton.tag = AppointmentTagTypeContact;
  [self._contactButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  self._contactButton.layer.shadowOffset = CGSizeZero;
  self._contactButton.layer.shadowRadius = 0.0f;
  self._contactButton.layer.shadowOpacity = [Library shadowOpacity];
  self._contactButton.layer.shadowColor = [Library colorBaseWhite].CGColor;
  [self._scrollView addSubview:self._contactButton];
  [self._scrollView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:contactHeader withReferenceView:self._scrollView],
    [NSLayoutConstraint constraintWithItem:contactHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._vehicleButton attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [NSLayoutConstraint constraintWithItem:self._contactButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:contactHeader attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f],
    [Library constraintOfBottomForView:self._contactButton withReferenceView:self._scrollView],
    nil]];
  NSDictionary* contact = [self._contact contact];
  if (contact) {
    [self._scrollView addConstraints:[Library constraintArrayOfCenterXLeftRightForView:self._contactButton withReferenceView:self._scrollView]];
    UILabel* nameLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[Contact nameWithFirstName:(NSString*)[contact objectForKey:ContactKeyFirstName] lastName:(NSString*)[contact objectForKey:ContactKeyLastName]] attributeDictionary:self._attributeDictionaryButton2]];
    [self._contactButton addSubview:nameLabel];
    [self._contactButton addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfLeftForView:nameLabel withReferenceView:self._contactButton],
      [Library constraintOfRightForView:nameLabel withReferenceView:self._contactButton],
      [Library constraintOfTopMarginForView:nameLabel withReferenceView:self._contactButton],
      nil]];
    UIView* viewPrecedingEmailLabel = nameLabel;
    NSString* company = (NSString*)[contact objectForKey:ContactKeyCompany];
    if (company) {
      UILabel* companyLabel = [Library labelWithAttributedString:[Library attributedStringWithString:company attributeDictionary:self._attributeDictionaryButton23]];
      [self._contactButton addSubview:companyLabel];
      [self._contactButton addConstraints:[NSArray arrayWithObjects:
        [Library constraintOfLeftForView:companyLabel withReferenceView:self._contactButton],
        [Library constraintOfRightForView:companyLabel withReferenceView:self._contactButton],
        [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
          toItem:nameLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
        nil]];
      viewPrecedingEmailLabel = companyLabel;
    }
    UILabel* emailLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[contact objectForKey:ContactKeyEmail] attributeDictionary:self._attributeDictionaryButton23]];
    [self._contactButton addSubview:emailLabel];
    UILabel* phoneLabel = [Library labelWithAttributedString:[Library attributedStringWithString:(NSString*)[contact objectForKey:ContactKeyPhone] attributeDictionary:self._attributeDictionaryButton23]];
    [self._contactButton addSubview:phoneLabel];
    [self._contactButton addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfLeftForView:emailLabel withReferenceView:self._contactButton],
      [Library constraintOfRightForView:emailLabel withReferenceView:self._contactButton],
      [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:viewPrecedingEmailLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
      [Library constraintOfLeftForView:phoneLabel withReferenceView:self._contactButton],
      [Library constraintOfRightForView:phoneLabel withReferenceView:self._contactButton],
      [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
        toItem:emailLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
      [Library constraintOfBottomForView:phoneLabel withReferenceView:self._contactButton],
      nil]];
  }
  else {
    [self._scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self._contactButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:addButtonOffset]];
    UIButton* contactContent = [Library buttonWithType:ButtonTypeAdd attributedString:[Library attributedStringWithString:[NSString stringWithFormat:@" %@", CONTACT] attributeDictionary:self._attributeDictionaryAdd]];
    contactContent.userInteractionEnabled = NO;
    contactContent.tintColor = [Library colorApplePrimaryAddGreen];
    [self._contactButton addSubview:contactContent];
    [self._contactButton addConstraints:[Library constraintArrayWithLeftRightTopMarginBottomForSubview:contactContent withContentView:self._contactButton]];
  }
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._scrollView flashScrollIndicators];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) animateButton:(UIButton*)button {
  [self._scrollView scrollRectToVisible:button.frame animated:YES];
  [Library forButton:button animateWithDuration:0.3f delay:0.0f];
}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case TagTypeHome: {
      if ([self._service service]) {
        UIAlertController* controller = [UIAlertController alertControllerWithTitle:alertHome message:nil preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:Cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {}]];
        [controller addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action) {[self.delegate dismissViewController];}]];
        [self presentViewController:controller animated:YES completion:nil];
      }
      else [self.delegate dismissViewController];
      break;
    }
    case TagTypeSubmit: {
      if (! [self._service service]) [self presentViewController:[Controller alertControllerWithTitle:alertService handler:^(UIAlertAction* action) {[self animateButton:self._serviceButton];}] animated:YES completion:nil];
      else if (! [self._vehicle vehicle]) [self presentViewController:[Controller alertControllerWithTitle:alertVehicle handler:^(UIAlertAction* action) {[self animateButton:self._vehicleButton];}] animated:YES completion:nil];
      else if (! [self._contact contact]) [self presentViewController:[Controller alertControllerWithTitle:alertContact handler:^(UIAlertAction* action) {[self animateButton:self._contactButton];}] animated:YES completion:nil];
      else {
        UIAlertController* controller = [UIAlertController alertControllerWithTitle:alertSubmit message:nil preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:Cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {}]];
        [controller addAction:[UIAlertAction actionWithTitle:Submit style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
          self.toolbarItems = self._activityBarButtonArray;
          self.navigationItem.leftBarButtonItem = nil;
          NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
          [request setHTTPMethod:@"POST"];
          [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
          NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:nil delegateQueue:nil];
          NSMutableString* string = [NSMutableString stringWithString:data];
          NSDictionary* service = [self._service service];
          NSDictionary* vehicle = [self._vehicle vehicle];
          NSDictionary* contact = [self._contact contact];
          [string appendFormat:@"&your-name=%@", [Contact nameWithFirstName:(NSString*)[contact objectForKey:ContactKeyFirstName] lastName:(NSString*)[contact objectForKey:ContactKeyLastName]]];
          [string appendFormat:@"&phone=%@", (NSString*)[contact objectForKey:ContactKeyPhone]];
          [string appendFormat:@"&your-email=%@", (NSString*)[contact objectForKey:ContactKeyEmail]];
          [string appendString:@"&your-message="];
          [string appendString:@"Appointment Request from PJW Auto App\n\n"];
          [string appendFormat:@"%@\n", SERVICE.uppercaseString];
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
          [string appendFormat:@"%@\n", [NSString stringWithFormat:@"%@ %@ %@", (NSString*)[vehicle objectForKey:VehicleKeyYear], (NSString*)[vehicle objectForKey:VehicleKeyMake], (NSString*)[vehicle objectForKey:VehicleKeyModel]]];
          NSString* vehicleNote = (NSString*)[vehicle objectForKey:VehicleKeyNote];
          if (vehicleNote) [string appendFormat:@"%@\n", vehicleNote];
          [string appendString:@"\n"];
          [string appendFormat:@"%@\n", CONTACT.uppercaseString];
          [string appendFormat:@"%@\n", [Contact nameWithFirstName:(NSString*)[contact objectForKey:ContactKeyFirstName] lastName:(NSString*)[contact objectForKey:ContactKeyLastName]]];
          NSString* company = (NSString*)[contact objectForKey:ContactKeyCompany];
          if (company) [string appendFormat:@"%@\n", company];
          [string appendFormat:@"%@\n", (NSString*)[contact objectForKey:ContactKeyEmail]];
          [string appendFormat:@"%@", (NSString*)[contact objectForKey:ContactKeyPhone]];
          [[session uploadTaskWithRequest:request fromData:[string dataUsingEncoding:NSUTF8StringEncoding] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
            self.toolbarItems = nil;
            if (error) {
              UIAlertController* alertController = [UIAlertController alertControllerWithTitle:errorSubmit message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
              [alertController addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleDefault handler:^(UIAlertAction* alertAction) {
                self.toolbarItems = self._submitBarButtonArray;
                self.navigationItem.leftBarButtonItem = self._homeBarButton;
              }]];
              [self presentViewController:alertController animated:YES completion:nil];
            }
            else {
              SuccessController* successController = [SuccessController newWithService:self._service vehicle:self._vehicle contact:self._contact];
              successController.delegate = self;
              UINavigationController* navigationController = [Library navigationControllerWithRootViewController:successController modalTransitionStyle:UIModalTransitionStyleCrossDissolve];
              successController.navigationItem.titleView = [Library labelTitleWithAttributedString:[Library attributedStringWithString:ThankYou attributeDictionary:self._attributeDictionaryHeader16]];
              [self presentViewController:navigationController animated:YES completion:nil];
            }
            // NSLog(@"RESPONSE:\n%@\n\n", response);
            // NSLog(@"DATA:\n%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
          }] resume];
          [session finishTasksAndInvalidate];
        }]];
        [self presentViewController:controller animated:YES completion:nil];
      }
      break;
    }
    case AppointmentTagTypeService: {
      if (self.toolbarItems == self._submitBarButtonArray) {
        ServiceDateController* controller = [ServiceDateController newWithService:self._service];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
      }
      break;
    }
    case AppointmentTagTypeVehicle: {
      if (self.toolbarItems == self._submitBarButtonArray) {
        UIViewController* controller = ([self._vehicle vehicleArray].count == 0)? [VehicleYearController newWithVehicle:self._vehicle] : [VehicleGarageController newWithVehicle:self._vehicle];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
      }
      break;
    }
    case AppointmentTagTypeContact: {
      if (self.toolbarItems == self._submitBarButtonArray) {
        ContactController* controller = [ContactController newWithContact:self._contact];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
      }
      break;
    }
  }
}

- (void) navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated {
  if (viewController == self) {
    [self._vehicle reload];
    self.view = nil;
  }
  else if ([NSStringFromClass([viewController class]) isEqualToString:NSStringFromClass([VehicleGarageController class])]) viewController.view = nil;
}

- (void) dismissViewController {
  [self.delegate dismissViewController];
}

@end
