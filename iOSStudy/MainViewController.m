//
//  MainViewController.m
//  HelloWorld
//
//  Created by strive cheng on 2018/5/21.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "MainViewController.h"
#import "DiscoverViewController.h"
#import "MessageViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    UITabBar *tabBar=self.tabBarController.tabBar;
    tabBar.translucent = NO;
    
     [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor grayColor]}   forState:UIControlStateNormal];
    
     [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithRed:103/255.0 green:166/255.0 blue:77/255.0 alpha:1.0]}   forState:UIControlStateSelected];
    
    //2.创建相应的子控制器（viewcontroller）
    DiscoverViewController *discoverVC = [DiscoverViewController new];
    discoverVC.tabBarItem.title = @"发现";
    discoverVC.tabBarItem.image = [[UIImage imageNamed:@"discover_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    discoverVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"discover_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *discoverNC = [[UINavigationController alloc]initWithRootViewController:discoverVC];
    
    MessageViewController *messageVC = [MessageViewController new];
    messageVC.tabBarItem.title = @"消息";
    //可以根据需求设置标签的的图标
    messageVC.tabBarItem.image = [[UIImage imageNamed:@"wechat_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"wechat_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *messageNC = [[UINavigationController alloc]initWithRootViewController:messageVC];
    //3.添加到控制器
    NSArray *array = @[messageNC,discoverNC];
    
    self.viewControllers = array;

}

- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
            titleSize:(CGFloat)size
        titleFontName:(NSString *)fontName
        selectedImage:(NSString *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(NSString *)unselectedImage
     normalTitleColor:(UIColor *)unselectColor
{
    
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // S未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateSelected];
}

@end
