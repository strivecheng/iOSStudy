//
//  AppDelegate.m
//  HelloWorld
//
//  Created by strive cheng on 2018/4/4.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color
#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
@interface AppDelegate ()

@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}
//应用程序加载完成
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    
    // 创建窗口对象并设置其大小为屏幕大小
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 设置窗口的背景色
    self.window.backgroundColor = [UIColor whiteColor];
    // 设置窗口对象为主窗口并且可
    [self.window makeKeyAndVisible];
    

    
    LoginViewController *window = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    self.window.rootViewController = window;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    // 应用即将置于后台
    NSLog( @"%s","applicationWillResignActive");

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    // 应用已经置于后台
    NSLog( @"%s","applicationDidEnterBackground");

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    // 应用即将置于前台
    NSLog( @"%s","applicationWillEnterForeground");

    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // 应用已经进入前台
    NSLog( @"%s","applicationDidBecomeActive");

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    //应用即将终止
    NSLog( @"%s","applicationWillTerminate");

}


@end
