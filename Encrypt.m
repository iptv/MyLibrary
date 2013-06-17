//
//  Encrypt.m
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import "Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Encrypt

#pragma mark MD5加密
+ (NSString *)md5ForString:(NSString *)str{
    const char *cStr = [str UTF8String];
    
    unsigned char result[16];
    
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    
    return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];

}

+ (NSString *)md5ForData:(NSData *)data{
    
    unsigned char result[16];
    
    CC_MD5( data.bytes, data.length, result ); // This is the md5 call
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    
}

#pragma mark RC4 加密
//RC  加密
+ (NSString*)encrypt:(NSString*)plaintext key:(NSString*)aKey{
    NSMutableArray *iS = [[NSMutableArray alloc] initWithCapacity:256];
    
    NSMutableArray *iK = [[NSMutableArray alloc] initWithCapacity:256];
    
    for (int i = 0; i < 256; i++) {
        [iS addObject:[NSNumber numberWithInt:i]];
    }
    
    int j = 1;
    
    for (short i = 0; i < 256; i++) {
        UniChar c = [aKey characterAtIndex:i%aKey.length];
    
        [iK addObject:[NSNumber numberWithChar:c]];
    }
    
    j = 0;
    
    for (int i=0; i<255; i++) {
        int is = [[iS objectAtIndex:i] intValue];
        
        UniChar ik = (UniChar)[[iK objectAtIndex:i] charValue];
        
        j = (j + is + ik)%256;
        
        NSNumber *temp = [iS objectAtIndex:i];
        
        [iS replaceObjectAtIndex:i withObject:[iS objectAtIndex:j]];
        
        [iS replaceObjectAtIndex:j withObject:temp];
    }
    
    int i = 0;
    
    j = 0;
    
    NSString *result = plaintext;
    
    for (short x=0; x<[plaintext length]; x++) {
        i = (i+1)%256;
    
        int is = [[iS objectAtIndex:i] intValue];
        
        j = (j+is)%256;
        
        int is_i = [[iS objectAtIndex:i] intValue];
        
        int is_j = [[iS objectAtIndex:j] intValue];
        
        int t = (is_i+is_j) % 256;
        
        int iY = [[iS objectAtIndex:t] intValue];
        
        UniChar ch = (UniChar)[plaintext characterAtIndex:x];
        
        UniChar ch_y = ch^iY;
        
        result = [result stringByReplacingCharactersInRange:NSMakeRange(x, 1)
                                                 withString:[NSString stringWithCharacters:&ch_y length:1]];
    }
    
    [iS release];
    
    [iK release];
    
    return result;
}

//RC  解密
+ (NSString*)decrypt:(NSString*)ciphertext key:(NSString*)aKey{
    NSMutableArray *iS = [[NSMutableArray alloc] initWithCapacity:256];
    
    NSMutableArray *iK = [[NSMutableArray alloc] initWithCapacity:256];
    
    for (int i = 0; i < 256; i++) {
        [iS addObject:[NSNumber numberWithInt:i]];
    }
    
    int j = 1;
    
    for (short i = 0; i < 256; i++) {
        UniChar c = [aKey characterAtIndex:i%aKey.length];
        
        [iK addObject:[NSNumber numberWithChar:c]];
    }
    
    j = 0;
    
    for (int i=0; i<255; i++) {
        int is = [[iS objectAtIndex:i] intValue];
        
        UniChar ik = (UniChar)[[iK objectAtIndex:i] charValue];
        
        j = (j + is + ik)%256;
        
        NSNumber *temp = [iS objectAtIndex:i];
        
        [iS replaceObjectAtIndex:i withObject:[iS objectAtIndex:j]];
        
        [iS replaceObjectAtIndex:j withObject:temp];
    }
    
    int i = 0;
    
    j = 0;
    
    NSString *result = ciphertext;
    
    for (short x = 0; x < [ciphertext length]; x++) {
        i = (i+1)%256;
    
        int is = [[iS objectAtIndex:i] intValue];
        
        j = (j+is)%256;
        
        int is_i = [[iS objectAtIndex:i] intValue];
        
        int is_j = [[iS objectAtIndex:j] intValue];
        
        int t = (is_i+is_j) % 256;
        
        int iY = [[iS objectAtIndex:t] intValue];
        
        UniChar ch = (UniChar)[ciphertext characterAtIndex:x];
        
        UniChar ch_y = ch^iY;
        
        result = [result stringByReplacingCharactersInRange:NSMakeRange(x, 1)
                                                 withString:[NSString stringWithCharacters:&ch_y length:1]];
    }
    
    [iS release];
    
    [iK release];
    
    return result;
}


@end
