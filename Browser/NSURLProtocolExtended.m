//
//  NSURLProtocolExtended.m
//  Browser
//
//  Created by Rolando Cruz on 4/24/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import "NSURLProtocolExtended.h"

@interface NSURLProtocolExtended () <NSURLConnectionDelegate>

@property (nonatomic, strong) NSURLConnection *connection;

@end

@implementation NSURLProtocolExtended

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    static NSUInteger requestCount = 0;
    NSLog(@"Request #%lu: URL = %@", (unsigned long)requestCount++, request.URL.absoluteString);
    if ([NSURLProtocol propertyForKey:@"NSURLProtocolExtendedKey" inRequest:request]){
        return NO;
    }
    return YES;
}

+ (NSURLRequest *) canonicalRequestForRequest:(NSURLRequest *)request{
    return request;
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b {
    return [super requestIsCacheEquivalent:a toRequest:b];
}

- (void)startLoading {
    NSMutableURLRequest *newRequest = [self.request mutableCopy];
    [NSURLProtocol setProperty:@YES forKey:@"NSURLProtocolExtendedKey" inRequest:newRequest];
    self.connection = [NSURLConnection connectionWithRequest:newRequest delegate:self];
}

- (void)stopLoading {
    [self.connection cancel];
    self.connection = nil;
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response {
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void) connection:(NSURLConnection*)connection didReceiveData:(nonnull NSData *)data {
    [self.client URLProtocol:self didLoadData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error{
    [self.client URLProtocol:self didFailWithError:error];
}

@end
