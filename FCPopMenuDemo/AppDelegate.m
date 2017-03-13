//
//  AppDelegate.m
//  FCPopMenuDemo
//
//  Created by xgf on 17/3/13.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.rootViewController=[[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    return YES;
}


@end
