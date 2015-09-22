//
//  AppDelegate.m
//  经典UI框架
//
//  Created by binglogo on 15/9/10.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "AppDelegate.h"
#import "BYOneViewController.h"
#import "BYTwoViewController.h"
#import "BYThreeViewController.h"
#import "BYFourViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Custom Methods

- (void)loadMainFrame {
    BYOneViewController *oneViewController = [[BYOneViewController alloc] init];
    UINavigationController *oneNavigationController = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    oneNavigationController.tabBarItem.title = @"One";
    oneNavigationController.tabBarItem.image = [UIImage imageNamed:@"TabBar_HomeBar"];
    
    BYTwoViewController *twoViewController = [[BYTwoViewController alloc] init];
    UINavigationController *twoNavigationController = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    twoNavigationController.tabBarItem.title = @"Two";
    twoNavigationController.tabBarItem.image = [UIImage imageNamed:@"TabBar_Discovery"];
    
    BYThreeViewController *threeViewController = [[BYThreeViewController alloc] init];
    UINavigationController *threeNavigationController = [[UINavigationController alloc] initWithRootViewController:threeViewController];
    threeNavigationController.tabBarItem.title = @"Three";
    threeNavigationController.tabBarItem.image = [UIImage imageNamed:@"TabBar_PublicService"];
    
    BYFourViewController *fourViewController = [[BYFourViewController alloc] init];
    UINavigationController *fourNavigationController = [[UINavigationController alloc] initWithRootViewController:fourViewController];
    fourNavigationController.tabBarItem.title = @"Four";
    fourNavigationController.tabBarItem.image = [UIImage imageNamed:@"TabBar_Assets"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[oneNavigationController,
                                           twoNavigationController,
                                           threeNavigationController,
                                           fourNavigationController]];
    
    self.window.rootViewController = tabBarController;
}

#pragma mark - Application LifeCycle Metheds

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self loadMainFrame];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
