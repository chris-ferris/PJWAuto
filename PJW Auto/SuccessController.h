// SuccessController.h
// PJW Auto
//  Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef SuccessController_h
#define SuccessController_h

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

@interface SuccessController : Controller <UITextViewDelegate>
@property (nonatomic) id delegate;
- (instancetype) initWithService:(Service*)service vehicle:(Vehicle*)vehicle contact:(Contact*)contact;
+ (instancetype) newWithService:(Service*)service vehicle:(Vehicle*)vehicle contact:(Contact*)contact;
@end
#endif
