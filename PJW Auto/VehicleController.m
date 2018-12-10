// VehicleController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "VehicleControllerExtension.h"

@implementation VehicleController

- (instancetype) initWithVehicle:(Vehicle*)vehicle {
  if (self = [super init]) {
    self._vehicle = vehicle;
  }
  return self;
}

+ (instancetype) newWithVehicle:(Vehicle*)vehicle {
  return [[VehicleController alloc] initWithVehicle:vehicle];
}

- (void) loadView {
  [super loadView];
  self._headerLabel = [Library labelWithAttributedString:[Library attributedStringWithString:header attributeDictionary:self._attributeDictionaryHeader3]];
  [self._contentView addSubview:self._headerLabel];
  [self._contentView addConstraints:[Library constraintArrayOfCenterXLeftRightTopForView:self._headerLabel withReferenceView:self._contentView]];
}

@end
