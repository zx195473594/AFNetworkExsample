//
//  MyViewController.m
//  AFNetworkExsample
//
//  Created by ibokan on 15/7/21.
//  Copyright (c) 2015年 spoil. All rights reserved.
//

#import "MyViewController.h"
#import <AFNetworking.h>

@interface MyViewController ()<NSURLConnectionDataDelegate>
{
    double totleLength;
    double currentLength;
}

@property(nonatomic ,strong) UIButton *button;
@property(nonatomic, strong) UIProgressView *myProgressV;
@property(nonatomic, strong) NSMutableData *myData;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myProgressV = [[UIProgressView alloc] initWithFrame:CGRectMake(80, 80, 200, 5)];
    _myProgressV.progress = 0;
    [self.view addSubview:_myProgressV];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    _button.frame = CGRectMake(100, 150, 60, 30);
    _button.backgroundColor = [UIColor orangeColor];
    [_button addTarget:self action:@selector(downloadAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _button];
}

- (void)downloadAction:(UIButton *)button {
    totleLength = 0;
    currentLength = 0;
    _myData = [NSMutableData dataWithCapacity:100];
    
    NSURL *url = [NSURL URLWithString:@"https://github.com/hightower/HTHorizontalSelectionList.git"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark ------NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    totleLength = [response expectedContentLength];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_myData appendData:data];
    currentLength += data.length;
    _myProgressV.progress = (double)currentLength / totleLength;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
}



@end
