// ContactController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef ContactController_h
#define ContactController_h

#ifndef Controller_h
#import "Controller.h"
#endif
#ifndef Contact_h
#import "Contact.h"
#endif

@interface ContactController : Controller <UITextFieldDelegate>
- (instancetype) initWithContact:(Contact*)contact;
+ (instancetype) newWithContact:(Contact*)contact;
@end
#endif
