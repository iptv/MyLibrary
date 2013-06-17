//
//  GlobalSetting.h
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#ifdef DEBUG

#define DLog(...) NSLog(__VA_ARGS__)

#else

#define DLog(...) {}

#endif

#define Device_Height  [UIScreen mainScreen].applicationFrame.size.height

#define Open_Url(urlString) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];

#define SystemVersion [[UIDevice currentDevice].systemVersion intValue]

#define COLOR(RED, GREEN, BLUE)  [UIColor colorWithRed:((RED)/(255.0)) green:((GREEN)/(255.0)) blue:((BLUE)/(255.0)) alpha:1.0]
