//
//  HttpRequest.h
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

typedef void (^responseBlock)(id result);

@interface HttpRequest : NSObject{
    
}

/**
  *  Http Get 请求
 **/

+ (ASIHTTPRequest *)doGetRequest:(NSString *)urlString setRequestHeaders:(NSMutableDictionary *)requestHeaders responseBlock:(responseBlock)block;

/**
  * Http Post 请求
 **/

+ (ASIHTTPRequest *)doPostRequest:(NSString *)urlString params:(NSMutableDictionary *)paramsDict
                setRequestHeaders:(NSMutableDictionary *)requestHeaders
                    responseBlock:(responseBlock)block;
 

@end
