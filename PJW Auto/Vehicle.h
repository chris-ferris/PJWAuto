// Vehicle.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Vehicle_h
#define Vehicle_h

#ifndef Library_h
#import "Library.h"
#endif

static NSString* const VehicleKeyYear = @"VehicleKeyYear";
static NSString* const VehicleKeyMake = @"VehicleKeyMake";
static NSString* const VehicleKeyModel = @"VehicleKeyModel";
static NSString* const VehicleKeyNote = @"VehicleKeyNote";

static NSInteger const VehicleYearMin = 1900;
static NSInteger const VehicleYearMax = 2099;

typedef NS_ENUM(NSInteger, VehicleYearIndex) {
                                                                                          VehicleYearIndex2015, VehicleYearIndex2014, VehicleYearIndex2013, VehicleYearIndex2012, VehicleYearIndex2011, VehicleYearIndex2010,
  VehicleYearIndex2009, VehicleYearIndex2008, VehicleYearIndex2007, VehicleYearIndex2006, VehicleYearIndex2005, VehicleYearIndex2004, VehicleYearIndex2003, VehicleYearIndex2002, VehicleYearIndex2001, VehicleYearIndex2000,
  VehicleYearIndex1999, VehicleYearIndex1998, VehicleYearIndex1997, VehicleYearIndex1996, VehicleYearIndex1995, VehicleYearIndex1994, VehicleYearIndex1993, VehicleYearIndex1992, VehicleYearIndex1991, VehicleYearIndex1990,
  VehicleYearIndex1989, VehicleYearIndex1988, VehicleYearIndex1987, VehicleYearIndex1986, VehicleYearIndex1985, VehicleYearIndex1984, VehicleYearIndex1983, VehicleYearIndex1982, VehicleYearIndex1981, VehicleYearIndex1980,
  VehicleYearIndexOther
};

@interface Vehicle : NSObject
- (NSArray*) yearArray;
- (NSString*) year;
- (NSInteger) yearIndex;
- (void) setYearAtIndex:(VehicleYearIndex)index;
- (void) setYear:(NSString*)year;
- (void) resetYear;

- (NSArray*) makeArray;
- (NSString*) make;
- (NSInteger) makeIndex;
- (void) setMakeAtIndex:(NSInteger)index;
- (void) setMake:(NSString*)make;
- (void) resetMake;

- (NSArray*) modelArray;
- (NSString*) model;
- (NSInteger) modelIndex;
- (void) setModelAtIndex:(NSInteger)index;
- (void) setModel:(NSString*)model;
- (void) resetModel;

- (NSString*) note;
- (void) setNote:(NSString*)note;

- (void) setYear:(NSString*)year make:(NSString*)make model:(NSString*)model note:(NSString*)note;
- (void) save;
- (void) reload;

- (NSArray*) vehicleArray;
- (NSDictionary*) vehicle;
- (NSInteger) vehicleIndex;
- (void) setVehicleAtIndex:(NSInteger)index;

- (void) removeVehicleAtIndex:(NSInteger)index;
- (void) moveVehicleFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

+ (id) sharedKeySet;
@end
#endif
