// ServiceControllerExtension.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef ServiceControllerExtension_h
#define ServiceControllerExtension_h

#import "ServiceController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif

static NSString* const header = @"SERVICE";

@interface ServiceController ()
@property (nonatomic) Service* _service;
@property (nonatomic) UILabel* _headerLabel;
@end
#endif
