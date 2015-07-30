//
//  URLRequest.m
//  NewTableView
//
//  Created by yan on 15/7/21.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "URLRequest.h"

@implementation URLRequest


- (NSData *)requestWithURL:(NSString *)URLString requestMethod:(NSString *)method requestBody:(NSString *)body {
    NSURL *url = [NSURL URLWithString:URLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:100];
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    
    if ([method isEqualToString:@"POST"]) {
        [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPMethod:@"POST"];
    }
    
     NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@"error = %@",error);
    }
    return data;
}


- (void)requestWithURL:(NSString *)URLString requestMethod:(NSString *)method requestBody:(NSString *)body andBlock:(myBlock)block{
    NSURL *url = [NSURL URLWithString:URLString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:100];
    if ([method isEqualToString:@"POST"]) {
        [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPMethod:@"POST"];
        postConnetion = [NSURLConnection connectionWithRequest:request delegate:self];
        postBlock = block;
        return;
    }
    getConnetion = [NSURLConnection connectionWithRequest:request delegate:self];
    getBlock = block;
}

#pragma mark -----NSURLConnectionDataDelegate
//- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
//    
//}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"相应");
    if (connection == postConnetion) {
        postData = [[NSMutableData alloc] init];
    }else if (connection == getConnetion){
        getData = [[NSMutableData alloc] init];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"接受数据");
    if (connection == postConnetion) {
        [postData appendData:data];
    }else if (connection == getConnetion){
        [getData appendData:data];
    }

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"加载结束");
    if (connection == postConnetion) {
        postBlock(postData);
    }else if (connection == getConnetion){
        getBlock(getData);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"请求错误");
}

//- (NSInputStream *)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request {
//    
//}

//- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
// totalBytesWritten:(NSInteger)totalBytesWritten
//totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
//    
//}

//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
//    
//}




@end
