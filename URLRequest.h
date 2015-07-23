//
//  URLRequest.h
//  NewTableView
//
//  Created by yan on 15/7/21.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^myBlock) (NSData *data);

@interface URLRequest : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>

{
    NSURLConnection *postConnetion;
    NSURLConnection *getConnetion;
    
    NSMutableData *getData;
    NSMutableData *postData;
    
    myBlock getBlock;
    myBlock postBlock;
}

- (NSData *)requestWithURL:(NSString *)URLString requestMethod:(NSString *)method requestBody:(NSString *)body;
- (void)requestWithURL:(NSString *)URLString requestMethod:(NSString *)method requestBody:(NSString *)body andBlock:(myBlock)block;


@end
