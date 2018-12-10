// SocialController.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "SocialController.h"

#ifndef ControllerExtension_h
#import "ControllerExtension.h"
#endif

static NSString* const Facebook = @"Facebook";
static NSString* const domainFacebook = @"facebook.com";
static NSString* const urlFacebook = @"https://www.facebook.com/pjwauto?v=wall&ref=search";
static NSString* const Twitter = @"Twitter";
static NSString* const domainTwitter = @"twitter.com";
static NSString* const urlTwitter = @"https://mobile.twitter.com/pjwauto";
static NSString* const alertNavigation = @"The navigation couldn't be completed.";

typedef NS_ENUM(NSInteger, DomainType) {
  DomainTypeFacebook,
  DomainTypeTwitter
};

@interface SocialController ()
@property (nonatomic) UISegmentedControl* _segmentedControl;
@property (nonatomic) WKWebView* _webView;
@property (nonatomic) UIProgressView* _progressView;
@property (nonatomic) UIBarButtonItem* _backBarButton;
@property (nonatomic) UIBarButtonItem* _forwardBarButton;
@property (nonatomic) NSURL* _facebookURL;
@property (nonatomic) NSURL* _twitterURL;
@property (nonatomic) NSString* _domain;
@end

@implementation SocialController

- (instancetype) init {
  if (self = [super init]) {
    self._segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:Facebook, Twitter, nil]];
    self._segmentedControl.selectedSegmentIndex = 0;
    self._segmentedControl.tag = TagTypeSegmented;
    [self._segmentedControl addTarget:self action:@selector(actionForSender:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self._segmentedControl;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:Done style:UIBarButtonItemStyleDone target:self action:@selector(actionForSender:)];
    self.navigationItem.leftBarButtonItem.tag = TagTypeDone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionForSender:)];
    self.navigationItem.rightBarButtonItem.tag = TagTypeRefresh;
    UIBarButtonItem* space = [Library barButtonItemFlexibleSpace];
    self._backBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Back"] style:UIBarButtonItemStylePlain target:self action:@selector(actionForSender:)];
    self._backBarButton.tag = TagTypeBack;
    self._backBarButton.enabled = NO;
    self._backBarButton.tintColor = [Library colorBaseBlack];
    self._forwardBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Forward"] style:UIBarButtonItemStylePlain target:self action:@selector(actionForSender:)];
    self._forwardBarButton.tag = TagTypeForward;
    self._forwardBarButton.enabled = NO;
    self._forwardBarButton.tintColor = [Library colorBaseBlack];
    self.toolbarItems = [NSArray arrayWithObjects:space, self._backBarButton, space, self._forwardBarButton, space, nil];
    self._facebookURL = [NSURL URLWithString:urlFacebook];
    self._twitterURL = [NSURL URLWithString:urlTwitter];
    self._domain = domainFacebook;
  }
  return self;
}

- (void) loadView {
  [super loadView];
  self._webView = [Library webView];
  self._webView.navigationDelegate = self;
  [self._contentView addSubview:self._webView];
  [self._contentView addConstraints:[Library constraintArrayForSubview:self._webView withContentView:self._contentView]];
  self._progressView = [Library progressView];
  self._progressView.trackTintColor = [Library colorBaseBlack];
  self._progressView.progressTintColor = [Library colorBaseBackground];
  [self._contentView addSubview:self._progressView];
  [self._contentView addConstraints:[Library constraintArrayOfCenterXLeftRightTopForView:self._progressView withReferenceView:self._contentView]];
  [self loadRequestWithDomainType:DomainTypeFacebook];
}

- (void) loadRequestWithDomainType:(DomainType)domainType {
  NSURL* url = nil;
  switch (domainType) {
    case DomainTypeFacebook: {
      url = self._facebookURL;
      self._domain = domainFacebook;
      break;
    }
    case DomainTypeTwitter: {
      url = self._twitterURL;
      self._domain = domainTwitter;
      break;
    }
  }
  [self._webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void) refreshWithDomainType:(DomainType)domainType {
  NSURL* url = nil;
  switch (domainType) {
    case DomainTypeFacebook: url = self._facebookURL; break;
    case DomainTypeTwitter: url = self._twitterURL; break;
  }
  [self._webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void) contentSizeCategoryDidChangeForNotification:(NSNotification*)notification {}

- (void) actionForSender:(id)sender {
  switch ([sender tag]) {
    case TagTypeDone: [self.delegate dismissViewController]; break;
    case TagTypeSegmented: [self loadRequestWithDomainType:self._segmentedControl.selectedSegmentIndex]; break;
    case TagTypeRefresh: [self refreshWithDomainType:self._segmentedControl.selectedSegmentIndex]; break;
    case TagTypeBack: if (self._webView.canGoBack) [self._webView goBack]; break;
    case TagTypeForward: if (self._webView.canGoForward) [self._webView goForward]; break;
  }
}

- (void) setEnabled:(BOOL)enabled {
  if (enabled) {
    self.navigationItem.rightBarButtonItem.enabled = YES;
    if (([self._webView.URL isEqual:self._facebookURL]) || ([self._webView.URL isEqual:self._twitterURL])) {
      self._backBarButton.enabled = NO;
      self._forwardBarButton.enabled = NO;
    }
    else {
      WKBackForwardList* backForwardList = self._webView.backForwardList;
      self._backBarButton.enabled = (([backForwardList.backItem.URL.host hasSuffix:self._domain]))? self._webView.canGoBack : NO;
      self._forwardBarButton.enabled = (([backForwardList.forwardItem.URL.host hasSuffix:self._domain]))? self._webView.canGoForward : NO;
    }
  }
  else {
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self._backBarButton.enabled = NO;
    self._forwardBarButton.enabled = NO;
  }
}

- (void) setProgress {
  [self._progressView setProgress:self._webView.estimatedProgress animated:YES];
}

- (void) webView:(WKWebView*)webView decidePolicyForNavigationAction:(WKNavigationAction*)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
  WKNavigationActionPolicy policy = ([navigationAction.request.URL.host.lowercaseString hasSuffix:self._domain])? WKNavigationActionPolicyAllow : WKNavigationActionPolicyCancel;
  decisionHandler(policy);
}

- (void) webView:(WKWebView*)webView didStartProvisionalNavigation:(WKNavigation*)navigation {
  [self setEnabled:NO];
  [self setProgress];
}

- (void) webView:(WKWebView*)webView didFailProvisionalNavigation:(WKNavigation*)navigation withError:(NSError*)error {
  UIAlertController* controller = [UIAlertController alertControllerWithTitle:alertNavigation message:nil preferredStyle:UIAlertControllerStyleAlert];
  [controller addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleDefault handler:^(UIAlertAction* alertAction) {}]];
  [self presentViewController:controller animated:YES completion:nil];
}

- (void) webView:(WKWebView*)webView didCommitNavigation:(WKNavigation*)navigation {
  [self setProgress];
}

- (void) webView:(WKWebView*)webView didFinishNavigation:(WKNavigation*)navigation {
  [self setProgress];
  [self setEnabled:YES];
}

@end
