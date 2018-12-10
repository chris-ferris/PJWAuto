// MapController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "MapController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif

static NSString* const identifier = @"Map";
static CGFloat const latitude = 45.084284f;
static CGFloat const longitude = -93.188242f;
static CGFloat const distance = 10000.0f;
static NSString* const title = @"2087 Old Hwy 8 NW";
static NSString* const subtitle = @"New Brighton, MN 55112";
static NSString* const imageLeftCallout = @"PJWAuto-44";
static NSString* const action = @"Copy PJW Automotive Address";
static NSString* const address = @"2087 Old Highway 8 NW, New Brighton, MN 55112";

@implementation MapController

- (instancetype) init {
  if (self = [super init]) {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.leftBarButtonItem.tag = TagTypeDone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeAction;
  }
  return self;
}

- (void) loadView {
  [super loadView];
  CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
  MKMapView* mapView = [Library mapViewWithCenterCoordinate:coordinate spanDistance:distance];
  mapView.delegate = self;
  [self._contentView addSubview:mapView];
  [self._contentView addConstraints:[Library constraintArrayForSubview:mapView withContentView:self._contentView]];
  MKPointAnnotation* annotation = [Library pointAnnotationWithCoordinate:coordinate title:title subtitle:subtitle];
  [mapView addAnnotation:annotation];
  [mapView selectAnnotation:annotation animated:YES];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  if ([sender tag] == TagTypeAction) {
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:action style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
      [UIPasteboard generalPasteboard].string = address;
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {}]];
    [self presentViewController:controller animated:YES completion:nil];
  }
  else [self.delegate dismissViewController];
}

- (MKAnnotationView*) mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  MKPinAnnotationView* pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
  if (! pin) {
    pin = [Library pinAnnotationViewWithAnnotation:annotation reuseIdentifier:identifier];
    pin.pinTintColor = MKPinAnnotationView.redPinColor;
    pin.canShowCallout = YES;
    pin.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[Library imageOriginalWithImage:[UIImage imageNamed:imageLeftCallout]]];
  }
  return pin;
}

@end
