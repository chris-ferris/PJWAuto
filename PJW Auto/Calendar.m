// Calendar.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "Calendar.h"

static NSCalendarUnit const calendarUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekOfMonth;
static NSInteger const saturday = 1;
static NSInteger const sunday = 7;
static NSInteger const daysInAdvanceCount = 3;
static NSInteger const year[] = {2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024};
static NSInteger const newYearsMonth = 1;
static NSInteger const newYearsDay = 1;
static NSInteger const memorialMonth = 5;
static NSInteger const memorialDay[] = {25, 30, 29, 28, 27, 25, 31, 30, 29, 27};
static NSInteger const independenceMonth = 7;
static NSInteger const independenceDay = 4;
static NSInteger const laborMonth = 9;
static NSInteger const laborWeekday = 2;
static NSInteger const laborWeekdayOrdinal = 1;
static NSInteger const thanksgivingMonth = 11;
static NSInteger const thanksgivingWeekday = 5;
static NSInteger const thanksgivingWeekdayOrdinal = 4;
static NSInteger const blackFridayMonth = 11;
static NSInteger const blackFridayDay[] = {27, 25, 24, 23, 29, 27, 26, 25, 24, 29};
static NSInteger const christmasEveMonth = 12;
static NSInteger const christmasEveDay = 24;
static NSInteger const christmasMonth = 12;
static NSInteger const christmasDay = 25;
static NSInteger const newYearsEveMonth = 12;
static NSInteger const newYearsEveDay = 31;

@interface Calendar ()
@property (nonatomic) NSMutableArray* _calendar;
@end

@implementation Calendar

- (instancetype) init {
  if (self = [super init]) {
    self._calendar = [NSMutableArray array];
    NSInteger capacity = 2;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* today = [calendar dateFromComponents:[calendar components:calendarUnits fromDate:[NSDate date]]];
    NSDate* firstAvailableDate = [today copy];
    NSDate* date = [today copy];
    NSDateComponents* dateComponents = [calendar components:calendarUnits fromDate:date];
    NSDateComponents* addOneDay = [NSDateComponents new];
    addOneDay.day = 1;
    NSInteger count = 0;
    do {
      firstAvailableDate = [calendar dateByAddingComponents:addOneDay toDate:firstAvailableDate options:0];
      if ([Calendar isWorkdayForDateComponents:[calendar components:calendarUnits fromDate:firstAvailableDate]]) count++;
    } while (count < daysInAdvanceCount);
    do {
      NSMutableArray* month = [NSMutableArray array];
      NSInteger monthComponent = dateComponents.month;
      do {
        NSMutableArray* week = [NSMutableArray array];
        NSInteger weekOfMonthComponent = dateComponents.weekOfMonth;
        do {
          DateColor dateColor = ([date timeIntervalSinceDate:firstAvailableDate] < 0)? DateColorRed : DateColorBlack;
          if (dateColor == DateColorRed) {
            if ([date timeIntervalSinceDate:today] == 0) dateColor = DateColorWhite;
          }
          if (dateColor == DateColorBlack) {
            if (! [Calendar isWorkdayForDateComponents:dateComponents]) dateColor = DateColorRed;
          }
          [week addObject:[Date newWithYear:dateComponents.year month:dateComponents.month day:dateComponents.day weekday:dateComponents.weekday dateColor:dateColor]];
          date = [calendar dateByAddingComponents:addOneDay toDate:date options:0];
          dateComponents = [calendar components:calendarUnits fromDate:date];
        } while (weekOfMonthComponent == dateComponents.weekOfMonth);
        [month addObject:week];
      } while (monthComponent == dateComponents.month);
      [self._calendar addObject:month];
      if (self._calendar.count == 1) {
        if (((NSArray*)self._calendar[0]).count < 3) capacity = 3;
      }
    } while (self._calendar.count < capacity);
  }
  return self;
}

- (NSInteger) monthCount {
  return self._calendar.count;
}

- (NSString*) titleForMonth:(NSInteger)month {
  return [((Date*)((NSArray*)((NSArray*)self._calendar[month])[0])[0]) monthYearString];
}

- (NSInteger) weekCountInMonth:(NSInteger)month {
  return ((NSArray*)self._calendar[month]).count;
}

- (NSArray*) weekAtIndexPath:(NSIndexPath*)indexPath {
  return ((NSArray*)((NSArray*)self._calendar[indexPath.section])[indexPath.row]);
}

+ (BOOL) isWorkdayForDateComponents:(NSDateComponents*)dateComponents {
  BOOL workday = YES;
  if ((dateComponents.weekday == sunday) || (dateComponents.weekday == saturday)) workday = NO;
  if (workday) {
    if ((dateComponents.month == newYearsMonth) && (dateComponents.day == newYearsDay)) workday = NO;
    for (NSInteger index = 0; index < 10; index++) {
      if ((dateComponents.year == year[index]) && (dateComponents.month == memorialMonth) && (dateComponents.day == memorialDay[index])) workday = NO;
    }
    if ((dateComponents.month == independenceMonth) && (dateComponents.day == independenceDay)) workday = NO;
    if ((dateComponents.month == laborMonth) && (dateComponents.weekday == laborWeekday) && (dateComponents.weekdayOrdinal == laborWeekdayOrdinal)) workday = NO;
    if ((dateComponents.month == thanksgivingMonth) && (dateComponents.weekday == thanksgivingWeekday) && (dateComponents.weekdayOrdinal == thanksgivingWeekdayOrdinal)) workday = NO;
    for (NSInteger index = 0; index < 10; index++) {
      if ((dateComponents.year == year[index]) && (dateComponents.month == blackFridayMonth) && (dateComponents.day == blackFridayDay[index])) workday = NO;
    }
    if ((dateComponents.month == christmasEveMonth) && (dateComponents.day == christmasEveDay)) workday = NO;
    if ((dateComponents.month == christmasMonth) && (dateComponents.day == christmasDay)) workday = NO;
    if ((dateComponents.month == newYearsEveMonth) && (dateComponents.day == newYearsEveDay)) workday = NO;
  }
  return workday;
}

@end
