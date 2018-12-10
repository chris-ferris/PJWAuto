// VehicleGarageController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef VehicleGarageController_h
#define VehicleGarageController_h

#ifndef VehicleController_h
#import "VehicleController.h"
#endif

@interface VehicleGarageController : VehicleController <UITableViewDataSource, UITableViewDelegate>
+ (NSAttributedString*) attributedStringForVehicle:(NSDictionary*)vehicle withAttributeDictionary:(NSDictionary*)attributeDictionary detailAttributeDictionary:(NSDictionary*)detailAttributeDictionary;
@end
#endif
