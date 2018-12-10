// ServiceNoiseController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "ServiceNoiseController.h"

#ifndef ServiceControllerExtension_h
#import "ServiceControllerExtension.h"
#endif
#ifndef ServiceNoteController_h
#import "ServiceNoteController.h"
#endif

static NSString* const identifier = @"ServiceNoise";
static NSString* const title = @"Unusual Noises";
static NSString* const hint = @"Is your vehicle making any unusual noises?";
static NSString* const alert = @"If your vehicle is making unusual noises, please select all that apply; or, select 'No Unusual Noises'.";

@interface ServiceNoiseController ()
@property (nonatomic) UITableView* _noiseTableView;
@property (nonatomic) NSMutableArray* _audioPlayerArray;
@end

@implementation ServiceNoiseController

- (instancetype) initWithService:(Service*)service {
  if (self = [super initWithService:service]) {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Next style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeNext;
    NSInteger capacity = [self._service noiseTable].count;
    self._audioPlayerArray = [NSMutableArray arrayWithCapacity:capacity];
    for (NSInteger index = 0; index < capacity; index++) {
      if ((index > 0) && (index < capacity - 1)) {
        NSMutableString* string = [NSMutableString stringWithString:(NSString*)[self._service noiseTable][index]];
        NSRange range = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
        while (range.location != NSNotFound) {
          [string deleteCharactersInRange:range];
          range = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
        }
        AVAudioPlayer* audioPlayer = [Library audioPlayerWithResource:string extension:m4a hint:AVFileTypeAppleM4A];
        audioPlayer.delegate = self;
        [self._audioPlayerArray addObject:audioPlayer];
      }
      else [self._audioPlayerArray addObject:[NSNull null]];
    }
  }
  return self;
}

+ (instancetype) newWithService:(Service*)service {
  return [[ServiceNoiseController alloc] initWithService:service];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if ([self._service noiseArray].count > 0) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
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
  NSMutableAttributedString* typeAttributedString = [Library mutableAttributedStringWithString:(NSString*)[self._service typeArray][0] attributeDictionary:self._attributeDictionaryHeader28];
  NSInteger typeCount = [self._service typeArray].count;
  if (typeCount > 1) [typeAttributedString appendAttributedString:[Library attributedStringWithString:[Service andMoreTypes:typeCount - 1] attributeDictionary:self._attributeDictionaryHeader28]];
  UILabel* typeLabel = [Library labelWithAttributedString:typeAttributedString];
  [self._contentView addSubview:typeLabel];
  UILabel* titleLabel = [Library labelWithAttributedString:[Library attributedStringWithString:title attributeDictionary:self._attributeDictionaryHeader15]];
  [self._contentView addSubview:titleLabel];
  UILabel* hintLabel = [Library labelWithAttributedString:[Library attributedStringWithString:hint attributeDictionary:self._attributeDictionaryHint]];
  [self._contentView addSubview:hintLabel];
  self._noiseTableView = [Library tableView];
  self._noiseTableView.dataSource = self;
  self._noiseTableView.delegate = self;
  [self._contentView addSubview:self._noiseTableView];
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
    [Library constraintOfCenterXForView:typeLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:typeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:waitLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfCenterXForView:titleLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:typeLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeAquaSuper].height],
    [Library constraintOfCenterXForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfLeftMarginForView:hintLabel withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:hintLabel withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:hintLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfLeftMarginForView:self._noiseTableView withReferenceView:self._contentView],
    [Library constraintOfRightMarginForView:self._noiseTableView withReferenceView:self._contentView],
    [NSLayoutConstraint constraintWithItem:self._noiseTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
      toItem:hintLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:[Library sizeMini].height],
    [Library constraintOfBottomMarginForView:self._noiseTableView withReferenceView:self._contentView],
    nil]];
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self._noiseTableView flashScrollIndicators];
  NSInteger index = [self._service noiseIndexFirst];
  if (index != NSNotFound) [self._noiseTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void) viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self stopAudioPlayers];
  [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) stopAudioPlayers {
  for (NSInteger index = 0; index < self._audioPlayerArray.count; index++) {
    AVAudioPlayer* audioPlayer = (AVAudioPlayer*)self._audioPlayerArray[index];
    if (! [audioPlayer isEqual:[NSNull null]]) {
      if (audioPlayer.playing) {
        [Library stopAudioPlayer:audioPlayer];
        [((UIButton*)[self._noiseTableView viewWithTag:CellContentTagTypeAccessory + index]) setAttributedTitle:[Library attributedStringWithString:unicodeSpeaker attributeDictionary:self._attributeDictionaryButton1] forState:UIControlStateNormal];
      }
    }
  }
}

- (void) actionForSender:(id)sender {
  NSInteger tag = [sender tag];
  if (tag == TagTypeNext) ([self._service noiseArray].count > 0)?
    [self.navigationController pushViewController:[ServiceNoteController newWithService:self._service] animated:YES] :
    [self presentViewController:[Controller alertControllerWithTitle:alert handler:^(UIAlertAction* action) {[self._noiseTableView flashScrollIndicators];}] animated:YES completion:nil];
  else if (tag >= CellContentTagTypeAccessory) {
    UIButton* button = (UIButton*)[self._noiseTableView viewWithTag:tag];
    BOOL shouldPlay = ([[button attributedTitleForState:UIControlStateNormal].string isEqualToString:unicodeSpeaker]);
    [self stopAudioPlayers];
    if (shouldPlay) {
      [Library playAudioPlayer:(AVAudioPlayer*)self._audioPlayerArray[tag - CellContentTagTypeAccessory]];
      [button setAttributedTitle:[Library attributedStringWithString:unicodeSpeakerCancellation attributeDictionary:self._attributeDictionaryButton1] forState:UIControlStateNormal];
    }
  }
  else {
    NSInteger row = tag - CellContentTagTypeText;
    NSString* noise = (NSString*)[self._service noiseTable][row];
    if ([[self._service noiseArray] containsObject:(NSString*)[self._service noiseTable][row]]) {
      [self._service removeNoiseAtIndex:row];
      [Controller tableView:self._noiseTableView select:NO row:row withAttributedString:[Library attributedStringWithString:noise attributeDictionary:self._attributeDictionaryButton2]];
      if ([self._service noiseArray].count == 0) self.navigationItem.rightBarButtonItem.tintColor = [Library colorBaseBlack];
    }
    else {
      if (row == 0) {
        NSArray* unNoiseArray = [self._service noiseArray];
        for (NSInteger index = 0; index < unNoiseArray.count; index++) {
          NSString* unNoise = (NSString*)unNoiseArray[index];
          [Controller tableView:self._noiseTableView select:NO row:[[self._service noiseTable] indexOfObject:unNoise] withAttributedString:[Library attributedStringWithString:unNoise attributeDictionary:self._attributeDictionaryButton2]];
        }
      }
      else {
        NSString* NoUnusualNoises = (NSString*)[self._service noiseTable][0];
        if ([[self._service noiseArray] containsObject:NoUnusualNoises]) {
          [self._service removeNoiseAtIndex:0];
          [Controller tableView:self._noiseTableView select:NO row:0 withAttributedString:[Library attributedStringWithString:NoUnusualNoises attributeDictionary:self._attributeDictionaryButton2]];
        }
      }
      [self._service addNoiseAtIndex:row];
      [Controller tableView:self._noiseTableView select:YES row:row withAttributedString:[Library attributedStringWithString:noise attributeDictionary:self._attributeDictionarySelected2]];
      if (self.navigationItem.rightBarButtonItem.tintColor != [Library colorApplePrimaryAddGreen]) self.navigationItem.rightBarButtonItem.tintColor = [Library colorApplePrimaryAddGreen];
    }
  }
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self._service noiseTable].count;
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
  if (! cell) {
    cell = [Library tableViewCellWithIdentifier:[Library identifierWithDomain:identifier index:indexPath.row]];
    NSDictionary* attributeDictionary = self._attributeDictionaryButton2;
    BOOL checkLabelHidden = YES;
    NSString* noise = (NSString*)[self._service noiseTable][indexPath.row];
    if ([[self._service noiseArray] containsObject:noise]) {
      attributeDictionary = self._attributeDictionarySelected2;
      checkLabelHidden = NO;
    }
    UIButton* textButton = [Library buttonWithAttributedString:[Library attributedStringWithString:noise attributeDictionary:attributeDictionary]];
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
      [Library constraintOfLeftMarginForView:checkLabel withReferenceView:cell.contentView],
      [Library constraintOfCenterYForView:checkLabel withReferenceView:cell.contentView],
      nil]];
    if ((indexPath.row > 0) && (indexPath.row < [self._service noiseTable].count - 1)) {
      UIButton* accessoryButton = [Library buttonWithAttributedString:[Library attributedStringWithString:unicodeSpeaker attributeDictionary:self._attributeDictionaryButton1]];
      accessoryButton.tag = CellContentTagTypeAccessory + indexPath.row;
      [accessoryButton addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventTouchUpInside];
      [cell.contentView addSubview:accessoryButton];
      [cell.contentView addConstraints:[NSArray arrayWithObjects:
        [NSLayoutConstraint constraintWithItem:accessoryButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
          toItem:cell.contentView attribute:NSLayoutAttributeRightMargin multiplier:1.0f constant:0.0f],
        [Library constraintOfCenterYForView:accessoryButton withReferenceView:cell.contentView],
        nil]];
    }
  }
  return cell;
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer*)audioPlayer successfully:(BOOL)flag {
  NSInteger tag = CellContentTagTypeAccessory;
  for (NSInteger index = 0; index < self._audioPlayerArray.count; index++) {
    if ([audioPlayer isEqual:(AVAudioPlayer*)self._audioPlayerArray[index]]) {
      tag += index;
      break;
    }
  }
  [((UIButton*)[self._noiseTableView viewWithTag:tag]) setAttributedTitle:[Library attributedStringWithString:unicodeSpeaker attributeDictionary:self._attributeDictionaryButton1] forState:UIControlStateNormal];
}

@end
