// Calendar.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Calendar_h
#define Calendar_h

#ifndef Library_h
#import "Library.h"
#endif
#ifndef Date_h
#import "Date.h"
#endif

@interface Calendar : NSObject
- (NSInteger) monthCount;
- (NSString*) titleForMonth:(NSInteger)month;
- (NSInteger) weekCountInMonth:(NSInteger)month;
- (NSArray*) weekAtIndexPath:(NSIndexPath*)indexPath;
@end
#endif
