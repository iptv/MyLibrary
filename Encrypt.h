//
//  Encrypt.h
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt : NSObject{
    
}

/*
 * md5 加密
 */
+ (NSString *)md5ForString:(NSString *)str;

+ (NSString *)md5ForData:(NSData *)data;

/*
 * RC4加密(对称加密算法)
 */

+ (NSString*)encrypt:(NSString*)plaintext key:(NSString*)aKey;   //RC  加密

+ (NSString*)decrypt:(NSString*)ciphertext key:(NSString*)aKey;   //RC  解密

@end
