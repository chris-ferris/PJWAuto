// VehicleController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef VehicleController_h
#define VehicleController_h

#ifndef Controller_h
#import "Controller.h"
#endif
#ifndef Vehicle_h
#import "Vehicle.h"
#endif

@interface VehicleController : Controller
- (instancetype) initWithVehicle:(Vehicle*)vehicle;
+ (instancetype) newWithVehicle:(Vehicle*)vehicle;
@end
#endif
