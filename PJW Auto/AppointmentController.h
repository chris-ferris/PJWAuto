// AppointmentController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef AppointmentController_h
#define AppointmentController_h

#ifndef Controller_h
#import "Controller.h"
#endif
#ifndef Service_h
#import "Service.h"
#endif
#ifndef Vehicle_h
#import "Vehicle.h"
#endif
#ifndef Contact_h
#import "Contact.h"
#endif

@interface AppointmentController : Controller <UINavigationControllerDelegate, NSURLSessionDelegate>
@property (nonatomic) id delegate;
@end
#endif
