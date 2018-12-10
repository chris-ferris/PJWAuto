// SocialController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef SocialController_h
#define SocialController_h

#ifndef Controller_h
#import "Controller.h"
#endif

@interface SocialController : Controller <WKNavigationDelegate>
@property (nonatomic) id delegate;
@end
#endif
