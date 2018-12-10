// Contact.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef Contact_h
#define Contact_h

#ifndef Library_h
#import "Library.h"
#endif

static NSString* const ContactKeyFirstName = @"ContactKeyFirstName";
static NSString* const ContactKeyLastName = @"ContactKeyLastName";
static NSString* const ContactKeyCompany = @"ContactKeyCompany";
static NSString* const ContactKeyEmail = @"ContactKeyEmail";
static NSString* const ContactKeyPhone = @"ContactKeyPhone";

@interface Contact : NSObject
- (void) setContact:(NSDictionary*)contact;
- (void) setFirstName:(NSString*)firstName lastName:(NSString*)lastName company:(NSString*)company email:(NSString*)email phone:(NSString*)phone;
- (NSDictionary*) contact;
+ (NSString*) nameWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;
@end
#endif
