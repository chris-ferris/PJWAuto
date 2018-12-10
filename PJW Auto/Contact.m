// Contact.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "Contact.h"

static NSString* const ContactFilename = @"Contact.plist";

@interface Contact ()
@property (nonatomic) NSURL* _url;
@property (nonatomic) NSDictionary* _contact;
@end

@implementation Contact

- (instancetype) init {
  if (self = [super init]) {
    self._url = [[Library documentURL] URLByAppendingPathComponent:ContactFilename];
    self._contact = nil;
  }
  return self;
}

- (void) setContact:(NSDictionary*)contact {
  if (contact) {
    self._contact = [NSDictionary dictionaryWithDictionary:contact];
    [self._contact writeToURL:self._url atomically:YES];
  }
  else {
    self._contact = nil;
    [[NSFileManager defaultManager] removeItemAtURL:self._url error:nil];
  }
}

- (void) setFirstName:(NSString*)firstName lastName:(NSString*)lastName company:(NSString*)company email:(NSString*)email phone:(NSString*)phone {
  NSMutableDictionary* contact = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    firstName, ContactKeyFirstName,
    lastName, ContactKeyLastName,
    email, ContactKeyEmail,
    phone, ContactKeyPhone,
    nil];
  if (! [[NSCharacterSet whitespaceAndNewlineCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:company]]) [contact setObject:company forKey:ContactKeyCompany];
  [self setContact:contact];
}

- (NSDictionary*) contact {
  return (self._contact)? self._contact : [NSDictionary dictionaryWithContentsOfURL:self._url];
}

+ (NSString*) nameWithFirstName:(NSString*)firstName lastName:(NSString*)lastName {
  return [NSString stringWithFormat:@"%@ %@", firstName, lastName];
}

@end
