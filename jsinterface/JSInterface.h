//
//  JSInterface.h
//  jsinterface
//
//  Created by Xavi on 14/09/15.
//  Copyright (c) 2015 Xavi Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@interface JSInterface : NSObject

- (BOOL)interfaceCall:(NSString *)request webView:(UIWebView *)webView;

- (NSString *)wifiSSID;

@end
