//
//  HttpRequest.m
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import "HttpRequest.h"
#import "ASIFormDataRequest.h"

@implementation HttpRequest

/**
 *  Http Get 请求
 **/

+ (ASIHTTPRequest *)doGetRequest:(NSString *)urlString setRequestHeaders:(NSMutableDictionary *)requestHeaders responseBlock:(responseBlock)block{
    NSURL *url = [NSURL URLWithString:urlString];
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setTimeOutSeconds:20];
    
    if (requestHeaders != nil && requestHeaders.count > 0) {
        [request setRequestHeaders:requestHeaders];
    }
    
    [request setFailedBlock:^{
        NSLog(@"setFailedBlock http responseStatuCode: %d",request.responseStatusCode);
        
        NSData *responseData = request.responseData;
        
        //id result = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
        
        if (block != nil) {
            block(responseData);
        }
    }];
    
    [request setCompletionBlock:^{
         NSLog(@"http responseStatuCode: %d",request.responseStatusCode);
        
        NSData *responseData = request.responseData;
        
        //id result = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
              
        if (block != nil) {
            block(responseData);
        }
    }];
    
    [request startAsynchronous];
    
    return request;
}

/**
 * Http Post 请求
 **/

+ (ASIHTTPRequest *)doPostRequest:(NSString *)urlString params:(NSMutableDictionary *)paramsDict
                setRequestHeaders:(NSMutableDictionary *)requestHeaders
                    responseBlock:(responseBlock)block{
    NSURL *url = [NSURL URLWithString:urlString];
    
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    NSArray *keyArray = [paramsDict allKeys];
    
    for (NSString *key in keyArray) {
        id value = [paramsDict objectForKey:key];
        
        [request setPostValue:value forKey:key];
    }
    
    if (requestHeaders != nil && requestHeaders.count > 0) {
        [request setRequestHeaders:requestHeaders];
    }
    
    [request setTimeOutSeconds:20];
    
    [request setCompletionBlock:^{
        NSData *responseData = request.responseData;
        
        id result = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
        
        if (block != nil) {
            block(result);
        }
    }];
    
    [request startAsynchronous];
    
    return request;
}

@end
