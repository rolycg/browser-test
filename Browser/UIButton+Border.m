//
//  NSObject+UIButton_Border.m
//  Browser
//
//  Created by Rolando Cruz on 4/18/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import "UIButton+Border.h"
#import <objc/runtime.h>

@implementation UIButton(Border)

- (id)swizzled_initWithFrame:(CGRect)frame
{
    id result = [self swizzled_initWithFrame:frame];
    
    if ([result respondsToSelector:@selector(layer)]) {
        CALayer *layer = [result layer];
        layer.borderWidth = 2;
        layer.borderColor = [[UIColor redColor] CGColor];
    }
    
    return result;
}

- (id)swizzled_initWithCoder:(NSCoder *)aDecoder
{
    id result = [self swizzled_initWithCoder:aDecoder];
    
    if ([result respondsToSelector:@selector(layer)]) {
        CALayer *layer = [result layer];
        layer.borderWidth = 2;
        layer.borderColor = [[UIColor blueColor] CGColor];
    }
    
    return result;
}

+ (void)load
{
    // The "+ load" method is called once, very early in the application life-cycle.
    // It's called even before the "main" function is called. Beware: there's no
    // autorelease pool at this point, so avoid Objective-C calls.
//    Method original, swizzle;
    
//    original = class_getInstanceMethod(self, @selector(initWithFrame:));
//    swizzle = class_getInstanceMethod(self, @selector(swizzled_initWithFrame:));
//    method_exchangeImplementations(original, swizzle);
//    
//    original = class_getInstanceMethod(self, @selector(initWithCoder:));
//    swizzle = class_getInstanceMethod(self, @selector(swizzled_initWithCoder:));
//    method_exchangeImplementations(original, swizzle);
}

@end
