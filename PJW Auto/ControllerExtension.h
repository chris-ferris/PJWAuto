// ControllerExtension.h
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#ifndef ControllerExtension_h
#define ControllerExtension_h

#import "Controller.h"

@interface Controller ()
@property (nonatomic) UIView* _contentView;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader1;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader15;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader16;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader2;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader25;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader28;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader3;
@property (nonatomic) NSDictionary* _attributeDictionaryHeader4;
@property (nonatomic) NSDictionary* _attributeDictionaryButton1;
@property (nonatomic) NSDictionary* _attributeDictionarySelected1;
@property (nonatomic) NSDictionary* _attributeDictionaryButton15;
@property (nonatomic) NSDictionary* _attributeDictionarySelected15;
@property (nonatomic) NSDictionary* _attributeDictionaryLabel15;
@property (nonatomic) NSDictionary* _attributeDictionaryButton2;
@property (nonatomic) NSDictionary* _attributeDictionarySelected2;
@property (nonatomic) NSDictionary* _attributeDictionaryLabel2;
@property (nonatomic) NSDictionary* _attributeDictionaryButton23;
@property (nonatomic) NSDictionary* _attributeDictionarySelected23;
@property (nonatomic) NSDictionary* _attributeDictionaryLabel23;
@property (nonatomic) NSDictionary* _attributeDictionaryButton25;
@property (nonatomic) NSDictionary* _attributeDictionarySelected25;
@property (nonatomic) NSDictionary* _attributeDictionaryLabel25;
@property (nonatomic) NSDictionary* _attributeDictionaryButton27;
@property (nonatomic) NSDictionary* _attributeDictionarySelected27;
@property (nonatomic) NSDictionary* _attributeDictionaryButton3;
@property (nonatomic) NSDictionary* _attributeDictionarySelected3;
@property (nonatomic) NSDictionary* _attributeDictionaryButton35;
@property (nonatomic) NSDictionary* _attributeDictionarySelected35;
@property (nonatomic) NSDictionary* _attributeDictionaryTagLine;
@property (nonatomic) NSDictionary* _attributeDictionaryToday;
@property (nonatomic) NSDictionary* _attributeDictionaryDayOff;
@property (nonatomic) NSDictionary* _attributeDictionaryPrompt;
@property (nonatomic) NSDictionary* _attributeDictionaryHint;
@property (nonatomic) NSDictionary* _attributeDictionaryAppointments;
@property (nonatomic) NSDictionary* _attributeDictionaryAdd;
@property (nonatomic) NSDictionary* _attributeDictionaryCheckmark;
@property (nonatomic) NSDictionary* _attributeDictionaryWeekday;
@property (nonatomic) NSDictionary* _attributeDictionaryWeekend;
@property (nonatomic) NSDictionary* _attributeDictionaryCircle;
@property (nonatomic) NSDictionary* _attributeDictionaryTextView;
@property (nonatomic) NSDictionary* _attributeDictionaryTextField;
- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification;
- (void) keyboardDidShowNotification:(NSNotification*)notification;
- (void) keyboardWillHideNotification:(NSNotification*)notification;
+ (UIAlertController*) alertControllerWithTitle:(NSString*)title handler:(void (^)(UIAlertAction* action))handler;
+ (void) tableView:(UITableView*)tableView select:(BOOL)select row:(NSInteger)row withAttributedString:(NSAttributedString*)attributedString;
@end
#endif
