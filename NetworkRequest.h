//
//  NetworkRequest.h
//  AFNetworkExsample
//
//  Created by ibokan on 15/7/21.
//  Copyright (c) 2015年 spoil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NetworkRequest : NSObject

@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *httpMethod;
@property(nonatomic, strong) NSString *syncOrAsync;
@property(nonatomic, weak) id<NSURLConnectionDataDelegate>delegate;


+ (NetworkRequest *)requestWithURL:(NSString *)url HTTPMethod:(NSString *)method delegate:(id)delegate syncOrAsync:(NSString *)syncOrAsync;

@end
