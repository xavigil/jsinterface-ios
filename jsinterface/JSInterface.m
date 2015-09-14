//
//  JSInterface.m
//  jsinterface
//
//  Created by Xavi on 14/09/15.
//  Copyright (c) 2015 Xavi Gil. All rights reserved.
//

#import "JSInterface.h"

NSString * const kJSInterfaceScheme = @"iosinterface://";

@implementation JSInterface

/**
 * Taking parameters into consideration is out of the scope of this sample
 * Accepted format:
 *   e.g. "iosInterface://<method_name>"
 */
- (BOOL)interfaceCall:(NSString *)request webView:(UIWebView *)webView
{
    if(![request hasPrefix:kJSInterfaceScheme]) return YES; // <-- Scheme not found, we load the url anyway.

    NSString *method = [request substringFromIndex:kJSInterfaceScheme.length];
    NSLog(@"method name: %@", method);
    if(!method) return NO;
    if(![self respondsToSelector:NSSelectorFromString(method)]) return NO;
    
    NSString *result = [self wifiSSID];
    if(!result)
        result = @"<i>Wifi SSID is unknown</i>";
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"callback('%@')", result]];
    return YES;
}

- (NSString *)wifiSSID
{
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    NSLog(@"Supported interfaces: %@", ifs);
    NSDictionary *info;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) { break; }
    }
    return [info objectForKey:@"SSID"];
}

@end
