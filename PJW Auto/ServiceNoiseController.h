// ServiceNoiseController.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef ServiceNoiseController_h
#define ServiceNoiseController_h

#ifndef ServiceController_h
#import "ServiceController.h"
#endif

@interface ServiceNoiseController : ServiceController <UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate>
@end
#endif
