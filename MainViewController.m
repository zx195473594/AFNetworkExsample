//
//  MainViewController.m
//  AFNetworkExsample
//
//  Created by ibokan on 15/7/21.
//  Copyright (c) 2015年 spoil. All rights reserved.
//

#import "MainViewController.h"
#import "MyAlertView.h"
#import <AFNetworking.h>


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"Two button" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor orangeColor];
    [btn1 addTarget:self action:@selector(twoBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(120, 100, 120, 50);
    [self.view addSubview:btn1];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://www.quanjingke.com/qj.php?key=asd&page=1" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"fdfdffd = %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"shibai ");
    }];
    
}

- (void)twoBtnClicked:(id)sender
{
    MyAlertView *alert = [[MyAlertView alloc] initWithTitle:@"提示" contentText:@"哈哈" leftButtonTitle:@"确定" rightButtonTitle:@"取消"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"right button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}


@end
