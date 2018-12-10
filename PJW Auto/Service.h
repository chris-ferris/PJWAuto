// Service.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Service_h
#define Service_h

#ifndef Library_h
#import "Library.h"
#endif
#ifndef Calendar_h
#import "Calendar.h"
#endif
#ifndef Date_h
#import "Date.h"
#endif

static NSString* const ServiceKeyDate = @"ServiceKeyDate";
static NSString* const ServiceKeyDateTag = @"ServiceKeyDateTag";
static NSString* const ServiceKeyTime = @"ServiceKeyTime";
static NSString* const ServiceKeyWait = @"ServiceKeyWait";
static NSString* const ServiceKeyTypeArray = @"ServiceKeyTypeArray";
static NSString* const ServiceKeyNoiseArray = @"ServiceKeyNoiseArray";
static NSString* const ServiceKeyNote = @"ServiceKeyNote";

@interface Service : NSObject
- (NSDictionary*) service;
- (void) cancel;
- (void) save;

- (Calendar*) calendar;

- (NSString*) date;
- (NSInteger) dateTag;
- (NSIndexPath*) dateIndexPath;
- (void) setDateWithTag:(NSInteger)tag;
- (void) resetDate;

- (NSArray*) timeTable;
- (NSString*) time;
- (NSInteger) timeIndex;
- (void) setTimeAtIndex:(NSInteger)index;
- (void) resetTime;

- (NSArray*) waitTable;
- (NSString*) wait;
- (NSInteger) waitIndex;
- (void) setWaitAtIndex:(NSInteger)index;
- (void) resetWait;

- (NSArray*) typeTable;
- (NSArray*) typeArray;
- (NSInteger) typeIndexFirst;
+ (NSString*) andMoreTypes:(NSInteger)count;
- (void) addTypeAtIndex:(NSInteger)index;
- (void) removeTypeAtIndex:(NSInteger)index;

- (NSArray*) noiseTable;
- (NSArray*) noiseArray;
- (NSInteger) noiseIndexFirst;
+ (NSString*) andMoreNoises:(NSInteger)count;
- (void) addNoiseAtIndex:(NSInteger)index;
- (void) removeNoiseAtIndex:(NSInteger)index;

- (NSString*) note;
- (void) setNote:(NSString*)note;
@end
#endif
