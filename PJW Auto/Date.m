// Date.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "Date.h"

static NSInteger const monthCount = 12;
static NSString* const monthArray[] = {
  @"January",
  @"February",
  @"March",
  @"April",
  @"May",
  @"June",
  @"July",
  @"August",
  @"September",
  @"October",
  @"November",
  @"December"};
static NSInteger const weekdayCount = 7;
static NSString* const weekdayArray[] = {
  @"Sunday",
  @"Monday",
  @"Tuesday",
  @"Wednesday",
  @"Thursday",
  @"Friday",
  @"Saturday"};


@interface Date ()
@property (nonatomic) NSInteger _year;
@property (nonatomic) NSInteger _month;
@property (nonatomic) NSInteger _day;
@property (nonatomic) NSInteger _weekday;
@property (nonatomic) DateColor _dateColor;
@end

@implementation Date

- (instancetype) initWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day weekday:(NSInteger)weekday dateColor:(DateColor)dateColor {
  if (self = [super init]) {
    self._year = year;
    self._month = month;
    self._day = day;
    self._weekday = weekday;
    self._dateColor = dateColor;
  }
  return self;
}

+ (instancetype) newWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day weekday:(NSInteger)weekday dateColor:(DateColor)dateColor {
  return [[Date alloc] initWithYear:year month:month day:day weekday:weekday dateColor:dateColor];
}

- (NSInteger) year {
  return self._year;
}

- (NSString*) yearString {
  return [NSNumber numberWithInteger:self._year].stringValue;
}

- (NSInteger) month {
  return self._month;
}

- (NSString*) monthString {
  return [Date monthStringWithTag:self._month];
}

- (NSInteger) day {
  return self._day;
}

- (NSString*) dayString {
  return [NSNumber numberWithInteger:self._day].stringValue;
}

- (NSInteger) weekday {
  return self._weekday;
}

- (NSString*) weekdayString {
  return [Date weekdayStringWithTag:self._weekday];
}

- (NSString*) monthYearString {
  return [NSString stringWithFormat:@"%@ %@", [self monthString], [self yearString]];
}

- (DateColor) dateColor {
  return self._dateColor;
}

- (NSInteger) dateTagWithIndexPath:(NSIndexPath*)indexPath {
  return (((indexPath.section + 1) * 100000000) + ((indexPath.row + 1) * 10000000) + ((self._year - 2000) * 100000) + (self._month * 1000) + (self._day * 10) + self._weekday);
}

// 200,000,000
//  50,000,000
//   1,500,000
//      12,000
//         310
//           7

+ (NSString*) dateStringWithTag:(NSInteger)tag {
  NSString* string = [NSNumber numberWithInteger:tag].stringValue;
  NSString* year = [NSString stringWithFormat:@"20%@", [string substringWithRange:NSMakeRange(2, 2)]];
  NSString* month = [self monthStringWithTag:[string substringWithRange:NSMakeRange(4, 2)].integerValue];
  NSString* day = [string substringWithRange:NSMakeRange(6, 2)];
  NSString* weekday = [self weekdayStringWithTag:[string substringWithRange:NSMakeRange(8, 1)].integerValue];
  return [NSString stringWithFormat:@"%@, %@ %@, %@", weekday, month, day, year];
}

+ (NSInteger) monthCount {
  return monthCount;
}

+ (NSString*) monthStringWithTag:(NSInteger)tag {
  return monthArray[tag - 1];
}

+ (NSInteger) weekdayCount {
  return weekdayCount;
}

+ (NSString*) weekdayStringWithTag:(NSInteger)tag {
  return weekdayArray[tag - 1];
}

@end
