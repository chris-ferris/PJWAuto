// AppDelegate.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "AppDelegate.h"

#ifndef RootController_h
#import "RootController.h"
#endif

@implementation AppDelegate

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  application.statusBarStyle = UIStatusBarStyleLightContent;
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [RootController new];
  [self.window makeKeyAndVisible];
  [[AVAudioSession sharedInstance] setActive:YES error:nil];
  return YES;
}

- (void) applicationWillTerminate:(UIApplication*) application {
  [[AVAudioSession sharedInstance] setActive:NO error:nil];
}

@end
