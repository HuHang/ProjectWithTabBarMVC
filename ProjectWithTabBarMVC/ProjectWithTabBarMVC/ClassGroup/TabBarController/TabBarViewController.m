//
//  TabBarViewController.m
//  ProjectWithTabBarMVC
//
//  Created by Charlot on 2017/4/20.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initViewAppearance];
//    [self CreateTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)initViewAppearance{
//    UIView *bgView = [[UIView alloc]initWithFrame:self.tabBar.bounds];
//    bgView.backgroundColor = [UIColor whiteColor];
//    [self.tabBar insertSubview:bgView atIndex:0];
//    self.tabBar.opaque = YES;
//    self.tabBar.tintColor = WTSBlueColor;
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:12.0],NSFontAttributeName, nil] forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:WTSBlueColor,NSForegroundColorAttributeName,[UIFont systemFontOfSize:12.0],NSFontAttributeName, nil] forState:UIControlStateSelected];
//}
//
//- (void)CreateTabBar{
//    MainListViewController *transportController = [[MainListViewController alloc] init];
//    ReceiveMainListViewController *receiveController = [[ReceiveMainListViewController alloc] init];
//    TransferGetInTableViewController *transferGetController = [[TransferGetInTableViewController alloc] init];
//    TransferSendTableViewController *transferSendController = [[TransferSendTableViewController alloc] init];
//    UserInfoTableViewController *userInfoController = [[UserInfoTableViewController alloc] init];
//    
//    
//    NSArray *navigationArry = @[transportController,receiveController,transferGetController,transferSendController,userInfoController];
//    NSArray *navigationTitleArry = @[@"任务",@"接收",@"入仓",@"发运",@"我的"];
//    for (int i = 0; i < [navigationArry count]; i ++) {
//        NavigationController *navc = [[NavigationController alloc] initWithRootViewController:navigationArry[i]];
//        
//        [navc.tabBarItem setTitle:navigationTitleArry[i]];
//        [navc.tabBarItem setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_tabBar%d",i]]];
//        //[navc.tabBarItem setSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabBarSelectedIcon%d",i]]];
//        [self addChildViewController:navc];
//    }
//}

@end
