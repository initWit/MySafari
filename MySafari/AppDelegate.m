//
//  AppDelegate.m
//  MySafari
//
//  Created by Robert Figueras on 5/14/14.
//  Copyright (c) 2014 AppSpaceship. All rights reserved.
//

#import "AppDelegate.h"
#import <CheckMate/CheckMate.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [CheckMate initializeFramework:@[@"0c6c0421323770989d12d5ef695da768",@"d3006ae1b0e73d5213da0c7ca54c0af5"]];



    return YES;
}
							


@end
