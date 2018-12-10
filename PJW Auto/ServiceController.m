// ServiceController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ServiceControllerExtension.h"

@implementation ServiceController

- (instancetype) initWithService:(Service*)service {
  if (self = [super init]) {
    self._service = service;
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service {
  return [[ServiceController alloc] initWithService:service];
}

- (void) loadView {
  [super loadView];
  self._headerLabel = [Library labelWithAttributedString:[Library attributedStringWithString:header attributeDictionary:self._attributeDictionaryHeader3]];
  [self._contentView addSubview:self._headerLabel];
  [self._contentView addConstraints:[Library constraintArrayOfCenterXLeftRightTopForView:self._headerLabel withReferenceView:self._contentView]];
}

@end
