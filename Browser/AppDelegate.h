//
//  AppDelegate.h
//  Browser
//
//  Created by Rolando Cruz on 4/17/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

