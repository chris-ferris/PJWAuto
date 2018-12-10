// Date.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Date_h
#define Date_h

#ifndef Library_h
#import "Library.h"
#endif

typedef NS_ENUM(NSInteger, DateColor) {
  DateColorWhite,
  DateColorRed,
  DateColorBlack
};

@interface Date : NSObject
- (instancetype) initWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day weekday:(NSInteger)weekday dateColor:(DateColor)dateColor;
+ (instancetype) newWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day weekday:(NSInteger)weekday dateColor:(DateColor)dateColor;
- (NSInteger) year;
- (NSString*) yearString;
- (NSInteger) month;
- (NSString*) monthString;
- (NSInteger) day;
- (NSString*) dayString;
- (NSInteger) weekday;
- (NSString*) weekdayString;
- (NSString*) monthYearString;
- (DateColor) dateColor;
- (NSInteger) dateTagWithIndexPath:(NSIndexPath*)indexPath;
+ (NSString*) dateStringWithTag:(NSInteger)tag;
+ (NSInteger) monthCount;
+ (NSString*) monthStringWithTag:(NSInteger)tag;
+ (NSInteger) weekdayCount;
+ (NSString*) weekdayStringWithTag:(NSInteger)tag;
@end
#endif
