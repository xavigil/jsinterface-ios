//
//  ViewController.h
//  jsinterface
//
//  Created by Xavi on 14/09/15.
//  Copyright (c) 2015 Xavi Gil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSInterface.h"

@interface ViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic,weak) IBOutlet UIWebView *webView;

@end

