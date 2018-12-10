// ServiceTypeController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ServiceTypeController.h"

#ifndef ServiceControllerExtension_h
#import "ServiceControllerExtension.h"
#endif
#ifndef ServiceNoiseController_h
#import "ServiceNoiseController.h"
#endif

static NSString* const identifier = @"ServiceType";
static NSString* const title = @"Service Types";
static NSString* const hint = @"Please select all that apply.";
static NSString* const alert = @"Please select all the service types that apply.";
static NSString* const audioResource = @"VoguePerformanceExhaust";

@interface ServiceTypeController ()
@property (nonatomic) UITableView* _typeTableView;
@property (nonatomic) AVAudioPlayer* _audioPlayer;
@end

@implementation ServiceTypeController

- (instancetype) initWithService:(Service*)service {
  if (self = [super initWithService:service]) {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
    self._audioPlayer = [Library audioPlayerWithResource:audioResource extension:m4a hint:AVFileTypeAppleM4A];
    self._audioPlayer.delegate = self;
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service {
  return [[ServiceTypeController alloc] initWithService:service];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._service typeArray].count > 0) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
  [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
}

- (void) loadView {
  [super loadView];
  UILabel* dateLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service date] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._contentView addSubview:dateLabel];
  UILabel* timeLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service time] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._contentView addSubview:timeLabel];
  UILabel* waitLabel = [Library labelWithAttributedString:[Library attributedStringWithString:[self._service wait] attributeDictionary:self._attributeDictionaryHeader28]];
  [self._contentView addSubview:waitLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._typeTableView = [Library tableView];
  self._typeTableView.dataSource = self;
  self._typeTableView.delegate = self;
  [self._contentView addSubview:self._typeTableView];
  [self._contentView addConstraints:[NSArray arrayWithObjects:
    [Library constraintOfCenterXForView:dateLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:self._headerLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaStandard].height],
    [Library constraintOfCenterXForView:timeLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:dateLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:waitLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:waitLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:timeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:waitLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._typeTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._typeTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._typeTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._typeTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._typeTableView flashScrollIndicators];
  NSInteger index = [self._service typeIndexFirst];
  if (index != NSNotFound) [self._typeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void) viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self stopAudioPlayer];
  [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) stopAudioPlayer {
  if (self._audioPlayer.playing) {
    [Library stopAudioPlayer:self._audioPlayer];
    [((UIButton*)[self._typeTableView viewWithTag:CellContentTagTypeAccessory]) setAttributedTitle:[Library attributedStringWithString:unicodeSpeaker attributeDictionary:self._attributeDictionaryButton1] forState:UIControlStateNormal];
  }
}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeNext) ([self._service typeArray].count > 0)?
    [self.navigationController pushViewController:[ServiceNoiseController newWithService:self._service] animated:YES] :
    [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._typeTableView flashScrollIndicators];}] animated:YES completion:nil];
  else if (tag == CellContentTagTypeAccessory) {
    UIButton* button = (UIButton*)[self._typeTableView viewWithTag:tag];
    BOOL shouldPlay = [[button attributedTitleForState:UIControlStateNormal].string isEqualToString:unicodeSpeaker];
    [self stopAudioPlayer];
    if (shouldPlay) {
      [Library playAudioPlayer:self._audioPlayer];
      [button setAttributedTitle:[Library attributedStringWithString:unicodeSpeakerCancellation attributeDictionary:self._attributeDictionaryButton1] forState:UIControlStateNormal];
    }
  }
  else {
    NSInteger row = tag - CellContentTagTypeText;
    NSString* type = (NSString*)[self._service typeTable][row];
    if ([[self._service typeArray] containsObject:(NSString*)[self._service typeTable][row]]) {
      [self._service removeTypeAtIndex:row];
      [Controller tableView:self._typeTableView select:NO row:row withAttributedString:[Library attributedStringWithString:type attributeDictionary:self._attributeDictionaryButton25]];
      if ([self._service typeArray].count == 0) self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      [self._service addTypeAtIndex:row];
      [Controller tableView:self._typeTableView select:YES row:row withAttributedString:[Library attributedStringWithString:type attributeDictionary:self._attributeDictionarySelected25]];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._service typeTable].count;
}

- (CGFloat) tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
  return ([((NSString*)[self._service typeTable][indexPath.row]) rangeOfString:@"\n"].location == NSNotFound)? 38.0f : 55.0f;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton25;
    BOOL checkLabelHidden = YES;
    NSString* type = (NSString*)[self._service typeTable][indexPath.row];
    if ([[self._service typeArray] containsObject:type]) {
      attributeDictionary = self._attributeDictionarySelected25;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:type attributeDictionary:attributeDictionary]];
    textButton.tag = CellContentTagTypeText + indexPath.row;
    [textButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:textButton];
    UILabel* checkLabel = [Library labelWithAttributedString:[Library attributedStringWithString:unicodeCheck attributeDictionary:self._attributeDictionarySelected1]];
    checkLabel.tag = CellContentTagTypeCheck + indexPath.row;
    checkLabel.hidden = checkLabelHidden;
    [cell.contentView addSubview:checkLabel];
    [cell.contentView addConstraints:[NSArray arrayWithObjects:
      [Library constraintOfCenterXForView:textButton withReferenceView:cell.contentView],
      [Library constraintOfCenterYForView:textButton withReferenceView:cell.contentView],
      [Library constraintOfLeftForView:checkLabel withReferenceView:cell.contentView],
      [Library constraintOfCenterYForView:checkLabel withReferenceView:cell.contentView],
      nil]];
    if ([type rangeOfString:@"Vogue"].location != NSNotFound) {
      UIButton* accessoryButton = [Library buttonWithAttributedString:[Library attributedStringWithString:unicodeSpeaker attributeDictionary:self._attributeDictionaryButton1]];
      accessoryButton.tag = CellContentTagTypeAccessory;
      [accessoryButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
      [cell.contentView addSubview:accessoryButton];
      [cell.contentView addConstraints:[NSArray arrayWithObjects:
        [NSLayoutConstraint constraintWithItem:accessoryButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
          toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-1.0f * [Library sizeMini].width],
        [Library constraintOfCenterYForView:accessoryButton withReferenceView:cell.contentView],
        nil]];
    }
  }
  return cell;
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer*)audioPlayer successfully:(BOOL)flag {
  [((UIButton*)[self._typeTableView viewWithTag:CellContentTagTypeAccessory]) setAttributedTitle:[Library attributedStringWithString:unicodeSpeaker attributeDictionary:self._attributeDictionaryButton1] forState:UIControlStateNormal];
}

@end
