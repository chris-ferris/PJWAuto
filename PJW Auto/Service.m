// Service.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "Service.h"

@interface Service ()
@property (nonatomic) NSDictionary* _service;
@property (nonatomic) Calendar* _calendar;
@property (nonatomic) NSString* _date;
@property (nonatomic) NSInteger _dateTag;
@property (nonatomic) NSArray* _timeTable;
@property (nonatomic) NSString* _time;
@property (nonatomic) NSArray* _waitTable;
@property (nonatomic) NSString* _wait;
@property (nonatomic) NSArray* _typeTable;
@property (nonatomic) NSMutableArray* _typeArray;
@property (nonatomic) NSArray* _noiseTable;
@property (nonatomic) NSMutableArray* _noiseArray;
@property (nonatomic) NSString* _note;
@end

@implementation Service

- (instancetype) init {
  if (self = [super init]) {
    self._service = nil;
    self._calendar = [Calendar new];
    self._date = nil;
    self._dateTag = NSNotFound;
    self._timeTable = [NSArray arrayWithObjects:
      @"8:00 am",
      @"9:00 am",
      @"10:00 am",
      @"11:00 am",
      @"12:00 pm",
      @"1:00 pm",
      @"2:00 pm",
      @"3:00 pm",
      @"4:00 pm",
      @"5:00 pm",
      nil];
    self._time = nil;
    self._waitTable = [NSArray arrayWithObjects:
      @"Wait in Lobby",
      @"Drop-off Vehicle",
      nil];
    self._wait = nil;
    self._typeTable = [NSArray arrayWithObjects:
      @"Diagnose a Problem",
      @"Oil Change Service",
      @"Recommended Mileage-Based\nMaintenance",
      @"Dash Warning Lights On",
      @"Engine Performance Problem",
      @"Brakes",
      @"Starting and Charging",
      @"Steering and Suspension",
      @"Wheels and Tires",
      @"Muffler and Exhaust",
      @"Electrical and Lights",
      @"Heating and Air Conditioning",
      @"Transmission",
      @"Vogue Performance Exhaust\nUpgrade",
      @"Used Vehicle Pre-Purchase\nInspection",
      nil];
    self._typeArray = [NSMutableArray array];
    self._noiseTable = [NSArray arrayWithObjects:
      @"No Unusual Noises",
      @"Vacuum Leak",
      @"Belt Squeal",
      @"Brake Grind",
      @"Battery Weak",
      @"Sway Links Loose",
      @"Heater Blower Click",
      @"Other Unusual Noise",
      nil];
    self._noiseArray = [NSMutableArray array];
    self._note = nil;
  }
  return self;
}

- (NSDictionary*) service {
  return self._service;
}

- (void) cancel {
    self._date = (NSString*)[self._service objectForKey:ServiceKeyDate];
    self._dateTag = ((NSNumber*)[self._service objectForKey:ServiceKeyDateTag]).integerValue;
    self._time = (NSString*)[self._service objectForKey:ServiceKeyTime];
    self._wait = (NSString*)[self._service objectForKey:ServiceKeyWait];
    self._typeArray = [NSMutableArray arrayWithArray:(NSArray*)[self._service objectForKey:ServiceKeyTypeArray]];
    self._noiseArray = [NSMutableArray arrayWithArray:(NSArray*)[self._service objectForKey:ServiceKeyNoiseArray]];
    self._note = (NSString*)[self._service objectForKey:ServiceKeyNote];
}

- (void) save {
  NSMutableDictionary* service = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    self._date, ServiceKeyDate,
    [NSNumber numberWithInteger:self._dateTag], ServiceKeyDateTag,
    self._time, ServiceKeyTime,
    self._wait, ServiceKeyWait,
    [NSArray arrayWithArray:self._typeArray], ServiceKeyTypeArray,
    [NSArray arrayWithArray:self._noiseArray], ServiceKeyNoiseArray,
    nil];
  if (self._note) [service setObject:self._note forKey:ServiceKeyNote];
  self._service = service;
}

- (Calendar*) calendar {
  return self._calendar;
}

- (NSString*) date {
  return self._date;
}

- (NSInteger) dateTag {
  return self._dateTag;
}

- (NSIndexPath*) dateIndexPath {
  NSIndexPath* indexPath = nil;
  if (self._dateTag != NSNotFound) {
    NSString* string = [NSNumber numberWithInteger:self._dateTag].stringValue;
    indexPath = [NSIndexPath indexPathForRow:([string substringWithRange:NSMakeRange(1, 1)].integerValue - 1) inSection:([string substringWithRange:NSMakeRange(0, 1)].integerValue - 1)];
  }
  return indexPath;
}

- (void) setDateWithTag:(NSInteger)tag {
  self._date = [Date dateStringWithTag:tag];
  self._dateTag = tag;
}

- (void) resetDate {
  self._date = nil;
  self._dateTag = NSNotFound;
}

- (NSArray*) timeTable {
  return self._timeTable;
}

- (NSString*) time {
  return self._time;
}

- (NSInteger) timeIndex {
  return [self._timeTable indexOfObject:self._time];
}

- (void) setTimeAtIndex:(NSInteger)index {
  self._time = (NSString*)self._timeTable[index];
}

- (void) resetTime {
  self._time = nil;
}

- (NSArray*) waitTable {
  return self._waitTable;
}

- (NSString*) wait {
  return self._wait;
}

- (NSInteger) waitIndex {
  return [self._waitTable indexOfObject:self._wait];
}

- (void) setWaitAtIndex:(NSInteger)index {
  self._wait = (NSString*)self._waitTable[index];
}

- (void) resetWait {
  self._wait = nil;
}

- (NSArray*) typeTable {
  return self._typeTable;
}

- (NSArray*) typeArray {
  return [NSArray arrayWithArray:self._typeArray];
}

- (NSInteger) typeIndexFirst {
  NSInteger index = NSNotFound;
  for (NSInteger x = 0; x < self._typeTable.count; x++) {
    for (NSInteger y = 0; y < self._typeArray.count; y++) {
      if ([((NSString*)self._typeTable[x]) isEqualToString:((NSString*)self._typeArray[y])]) {
        index = x;
        break;
      }
    }
    if (index != NSNotFound) break;
  }
  return index;
}

+ (NSString*) andMoreTypes:(NSInteger)count {
  return (count == 1)? @"\nand 1 more service type" : [NSString stringWithFormat:@"\nand %@ more service types", [NSNumber numberWithInteger:count].stringValue];
}

- (void) addTypeAtIndex:(NSInteger)index {
  [self._typeArray addObject:self._typeTable[index]];
}

- (void) removeTypeAtIndex:(NSInteger)index {
  [self._typeArray removeObject:self._typeTable[index]];
}

- (NSArray*) noiseTable {
  return self._noiseTable;
}

- (NSArray*) noiseArray {
  return [NSArray arrayWithArray:self._noiseArray];
}

- (NSInteger) noiseIndexFirst {
  NSInteger index = NSNotFound;
  for (NSInteger x = 0; x < self._noiseTable.count; x++) {
    for (NSInteger y = 0; y < self._noiseArray.count; y++) {
      if ([((NSString*)self._noiseTable[x]) isEqualToString:((NSString*)self._noiseArray[y])]) {
        index = x;
        break;
      }
    }
    if (index != NSNotFound) break;
  }
  return index;
}

+ (NSString*) andMoreNoises:(NSInteger)count {
  return (count == 1)? @"\nand 1 more unusual noise" : [NSString stringWithFormat:@"\nand %@ more unusual noises", [NSNumber numberWithInteger:count].stringValue];
}

- (void) addNoiseAtIndex:(NSInteger)index {
  if (index == 0) self._noiseArray = [NSMutableArray array];
  [self._noiseArray addObject:(NSString*)self._noiseTable[index]];
}

- (void) removeNoiseAtIndex:(NSInteger)index {
  [self._noiseArray removeObject:(NSString*)self._noiseTable[index]];
}

- (NSString*) note {
  return self._note;
}

- (void) setNote:(NSString*)note {
  self._note = ([[NSCharacterSet whitespaceAndNewlineCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:note]])? nil : note;
}

@end
