// Controller.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Controller_h
#define Controller_h

#ifndef Library_h
#import "Library.h"
#endif

@protocol ControllerProtocol <NSObject>
@optional
- (void) actionForSender:(id)sender;
- (void) dismissViewController;
@end

@interface Controller : UIViewController <ControllerProtocol>
@end
#endif
