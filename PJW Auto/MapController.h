// MapController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef MapController_h
#define MapController_h

#ifndef Controller_h
#import "Controller.h"
#endif

@interface MapController : Controller <MKMapViewDelegate>
@property (nonatomic) id delegate;
@end
#endif
