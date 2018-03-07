//
//  AppDelegate.m
//  iOSPro
//
//  Created by Tom on 2018/2/26.
//  Copyright © 2018年 Tom. All rights reserved.
//

#import "LMJAppDelegate.h"
#import "MainTabbarController.h"
#import "AddPlusBtn.h"
#import "CYLTabBarControllerConfig.h"

@interface LMJAppDelegate ()<UITabBarControllerDelegate,CYLTabBarControllerDelegate>

@end

@implementation LMJAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [AddPlusBtn registerPlusButton];
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    tabBarController.delegate = self;
    tabBarController.tabBarHeight = 49;
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
   
   
   
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control
{
    UIView *animate;
    if ([control cyl_isTabButton]) {
        animate = [control cyl_tabImageView];
    }
    if ([self cyl_tabBarController].selectedIndex%2==0) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"transform.scale";
        animation.values = @[@1.0,@1.3,@0.95,@1.25,@0.9,@1.0];
        animation.duration = 1.0;
        animation.repeatCount = 1.0;
        animation.calculationMode = kCAAnimationCubic;
        [animate.layer addAnimation:animation forKey:nil];
    }else{
        [UIView animateWithDuration:0.32 animations:^{
            animate.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    animate.layer.transform = CATransform3DMakeRotation(2*M_PI, 0, 1, 0);
                } completion:nil];
            });
        }];
    }
    
}









- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
