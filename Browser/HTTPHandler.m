//
//  HTTPHandler.m
//  Browser
//
//  Created by Rolando Cruz on 4/17/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPHandler.h"


@implementation HTTPHandler

+ (NSString*)getContent:(NSString*)urlString {
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setHTTPMethod:@"GET"];
    
    __block BOOL done = NO;
    __block NSMutableString *result = [NSMutableString stringWithCapacity:1000];;
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"Response: %@",response);
//        NSLog(@"Data: %@",data);
//        NSLog(@"Error: %@",error);
        NSString* temp = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        [result appendString:temp];
        done = YES;
    }];
    [dataTask resume];
    
    while (!done) {
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0.1];
        [[NSRunLoop currentRunLoop] runUntilDate:date];
    }
    return result;
}
@end
