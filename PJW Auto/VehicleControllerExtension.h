// VehicleControllerExtension.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef VehicleControllerExtension_h
#define VehicleControllerExtension_h

#import "VehicleController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif

static NSString* const header = @"VEHICLE";

@interface VehicleController ()
@property (nonatomic) Vehicle* _vehicle;
@property (nonatomic) UILabel* _headerLabel;
@end
#endif
