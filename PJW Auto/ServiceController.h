// ServiceController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef ServiceController_h
#define ServiceController_h

#ifndef Controller_h
#import "Controller.h"
#endif
#ifndef Service_h
#import "Service.h"
#endif

@interface ServiceController : Controller
- (instancetype) initWithService:(Service*)service;
+ (instancetype) newWithService:(Service*)service;
@end
#endif
