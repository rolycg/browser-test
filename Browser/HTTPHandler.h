//
//  HTTPHandler.h
//  Browser
//
//  Created by Rolando Cruz on 4/17/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HTTPHandler : NSObject

+ (NSString*)getContent:(NSString*)urlString;

@end
