// RootController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "RootController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif
#ifndef AppointmentController_h
#import "AppointmentController.h"
#endif
#ifndef MapController_h
#import "MapController.h"
#endif
#ifndef SocialController_h
#import "SocialController.h"
#endif

static NSString* const title = @"PJW Automotive";
static NSString* const tagLine = @"Experienced Car Care You Can Count On";
static NSString* const logo = @"PJWAuto-66";
static NSString* const PJWAutoGarage = @"PJWAutoGarage.jpg";
static NSString* const PJWAutoCar = @"PJWAutoCar.jpg";
static NSString* const PJWAutoSign = @"PJWAutoSign.jpg";
static NSString* const Appointment = @"Appointment";
static NSString* const Appointments = @" Appointments";
static NSString* const Phone = @"Phone";
static NSString* const phoneUrl = @"tel:1-651-636-6141";
static NSString* const Email = @"Email";
static NSString* const emailTo = @"shop@pjwauto.com";
static NSString* const Map = @"Map";
static NSString* const Social = @"Social";
static NSString* const alertPhone = @"Device is unable to make a phone call.";
static NSString* const alertEmail = @"Device is currently unable to send email. Please try again.";

typedef NS_ENUM(NSInteger, RootTagType) {
  RootTagTypeAppointment,
  RootTagTypePhone,
  RootTagTypeEmail,
  RootTagTypeMap,
  RootTagTypeSocial
};

@implementation RootController

- (void) loadView {
  [super loadView];
  UIImageView* imageView = [Library imageView];
  imageView.animationImages = [NSArray arrayWithObjects:[Library imageOriginalWithImage:[UIImage imageNamed:PJWAutoGarage]], [Library imageOriginalWithImage:[UIImage imageNamed:PJWAutoCar]], [Library imageOriginalWithImage:[UIImage imageNamed:PJWAutoSign]], nil];
  imageView.animationDuration = 15.0f;
  [imageView startAnimating];
  [imageView addMotionEffect:[Library motionEffectGroupWithNaturalDirection:YES]];
  [self._contentView addSubview:imageView];
  UIView* navigationBarView = [Library contentView];
  [self._contentView addSubview:navigationBarView];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader1]];
  [self._contentView addSubview:titleLabel];
  UILabel* tagLineLabel = [Library labelWithAttributedString:[Library attributedStringWithString:tagLine attributeDictionary:self._attributeDictionaryTagLine]];
  [self._contentView addSubview:tagLineLabel];
  UIImageView* logoImageView = [Library imageViewWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:logo]]];
  [self._contentView addSubview:logoImageView];
  UIButton* appointmentButton = [Library buttonWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:Appointment]] attributedString:[Library attributedStringWithString:Appointments attributeDictionary:self._attributeDictionaryAppointments]];
  appointmentButton.layer.shadowOffset = [Library shadowOffset];
  appointmentButton.layer.shadowRadius = [Library shadowRadius];
  appointmentButton.layer.shadowOpacity = [Library shadowOpacity];
  appointmentButton.layer.shadowColor = [Library colorBaseBlack].CGColor;
  appointmentButton.tag = RootTagTypeAppointment;
  [appointmentButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  [self._contentView addSubview:appointmentButton];
  UIView* toolbarView = [Library contentView];
  [self._contentView addSubview:toolbarView];
  UIButton* phoneButton = [Library buttonWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:Phone]]];
  phoneButton.layer.shadowOffset = [Library shadowOffset];
  phoneButton.layer.shadowRadius = [Library shadowRadius];
  phoneButton.layer.shadowOpacity = [Library shadowOpacity];
  phoneButton.layer.shadowColor = [Library colorBaseBlack].CGColor;
  phoneButton.tag = RootTagTypePhone;
  [phoneButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  [self._contentView addSubview:phoneButton];
  UIButton* emailButton = [Library buttonWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:Email]]];
  emailButton.layer.shadowOffset = [Library shadowOffset];
  emailButton.layer.shadowRadius = [Library shadowRadius];
  emailButton.layer.shadowOpacity = [Library shadowOpacity];
  emailButton.layer.shadowColor = [Library colorBaseBlack].CGColor;
  emailButton.tag = RootTagTypeEmail;
  [emailButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  [self._contentView addSubview:emailButton];
  UIButton* mapButton = [Library buttonWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:Map]]];
  mapButton.layer.shadowOffset = [Library shadowOffset];
  mapButton.layer.shadowRadius = [Library shadowRadius];
  mapButton.layer.shadowOpacity = [Library shadowOpacity];
  mapButton.layer.shadowColor = [Library colorBaseBlack].CGColor;
  mapButton.tag = RootTagTypeMap;
  [mapButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  [self._contentView addSubview:mapButton];
  UIButton* socialButton = [Library buttonWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:Social]]];
  socialButton.layer.shadowOffset = [Library shadowOffset];
  socialButton.layer.shadowRadius = [Library shadowRadius];
  socialButton.layer.shadowOpacity = [Library shadowOpacity];
  socialButton.layer.shadowColor = [Library colorBaseBlack].CGColor;
  socialButton.tag = RootTagTypeSocial;
  [socialButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
  [self._contentView addSubview:socialButton];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:imageView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:logoImageView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f],
    [Library constraintOfLeftForView:navigationBarView withReferenceView:self._contentView],
    [Library constraintOfRightForView:navigationBarView withReferenceView:self._contentView],
    [Library constraintOfTopForView:navigationBarView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:navigationBarView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
      toItem:logoImageView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:tagLineLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:tagLineLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:logoImageView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:tagLineLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:appointmentButton withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:appointmentButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationGreaterThanOrEqual
      toItem:self._contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:appointmentButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual
      toItem:logoImageView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfLeftForView:toolbarView withReferenceView:self._contentView],
    [Library constraintOfRightForView:toolbarView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:toolbarView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:mapButton attribute:NSLayoutAttributeTop multiplier:1.0f constant:-1.0f * [Library sizeAquaStandard].height],
    [Library constraintOfBottomForView:toolbarView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:phoneButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:15.0f],
    [NSLayoutConstraint constraintWithItem:phoneButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual
      toItem:self._contentView attribute:NSLayoutAttributeBottomMargin multiplier:1.0f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:emailButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeCenterX multiplier:0.72f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:emailButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual
      toItem:self._contentView attribute:NSLayoutAttributeBottomMargin multiplier:1.0f constant:0.0f],
    [Library constraintOfCenterYForView:emailButton withReferenceView:phoneButton],
    [NSLayoutConstraint constraintWithItem:mapButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeCenterX multiplier:1.28f constant:0.0f],
    [NSLayoutConstraint constraintWithItem:mapButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual
      toItem:self._contentView attribute:NSLayoutAttributeBottomMargin multiplier:1.0f constant:0.0f],
    [Library constraintOfCenterYForView:mapButton withReferenceView:phoneButton],
    [NSLayoutConstraint constraintWithItem:socialButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
      toItem:self._contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-15.0f],
    [NSLayoutConstraint constraintWithItem:socialButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual
      toItem:self._contentView attribute:NSLayoutAttributeBottomMargin multiplier:1.0f constant:0.0f],
    [Library constraintOfCenterYForView:socialButton withReferenceView:phoneButton],
    nil]];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case RootTagTypeAppointment: {
      AppointmentController* controller = [AppointmentController new];
      controller.delegate = self;
      UINavigationController* navigationController = [Library navigationControllerIncludingToolbarWithRootViewController:controller];
      navigationController.delegate = controller;
      [self presentViewController:navigationController animated:YES completion:nil];
      break;
    }
    case RootTagTypePhone: {
      NSURL* url = [NSURL URLWithString:phoneUrl];
      if ([[UIApplication sharedApplication] canOpenURL:url]) [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
      else {
        UIAlertController* controller = [UIAlertController alertControllerWithTitle:alertPhone message:nil preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleDefault handler:^(UIAlertAction* alertAction) {}]];
        [self presentViewController:controller animated:YES completion:nil];
      }
      break;
    }
    case RootTagTypeEmail: {
      if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* controller = [MFMailComposeViewController new];
        controller.mailComposeDelegate = self;
        [controller setToRecipients:[NSArray arrayWithObjects:emailTo, nil]];
        controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:controller animated:YES completion:nil];
      }
      else {
        UIAlertController* controller = [UIAlertController alertControllerWithTitle:alertEmail message:nil preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleDefault handler:^(UIAlertAction* alertAction) {}]];
        [self presentViewController:controller animated:YES completion:nil];
      }
      break;
    }
    case RootTagTypeMap: {
      MapController* controller = [MapController new];
      controller.delegate = self;
      [self presentViewController:[Library navigationControllerWithRootViewController:controller modalTransitionStyle:UIModalTransitionStyleCrossDissolve] animated:YES completion:nil];
      break;
    }
    case RootTagTypeSocial: {
      SocialController* controller = [SocialController new];
      controller.delegate = self;
      UINavigationController* navigationController = [Library navigationControllerIncludingToolbarWithRootViewController:controller modalTransitionStyle:UIModalTransitionStyleCrossDissolve];
      navigationController.toolbar.barTintColor = [Library colorBaseBackground];
      [self presentViewController:navigationController animated:YES completion:nil];
      break;
    }
  }
}

- (void) dismissViewController {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
  [self dismissViewController];
}

@end
