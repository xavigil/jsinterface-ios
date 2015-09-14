//
//  ViewController.m
//  jsinterface
//
//  Created by Xavi on 14/09/15.
//  Copyright (c) 2015 Xavi Gil. All rights reserved.
//

#import "ViewController.h"

NSString * const kAssetName = @"wifissid";
NSString * const kAssetExtension = @"html";



@interface ViewController ()
{
    JSInterface *_jsInterface;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _jsInterface = [[JSInterface alloc] init];
    [self setupWebView];
    [self loadAsset];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Private methods

- (void)setupWebView
{
    self.webView.delegate = self;
}

- (void)loadAsset
{
    NSString *assetPath = [[NSBundle mainBundle] pathForResource:kAssetName ofType:kAssetExtension];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:assetPath isDirectory:NO]]];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *strRequest = [[request URL]absoluteString];
    NSLog(@"request: %@", strRequest);
    return [_jsInterface interfaceCall:strRequest webView:webView];
}

@end
