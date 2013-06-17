//
//  Control.h
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Control : NSObject{
    
}

/*
 * 绘制UILabel
 */
+ (UILabel *)drawLabel:(CGRect)_rect setTxt:(NSString *)txt setFont:(UIFont *)txtFont setTxtColor:(UIColor *)txtColor
          setAlignment:(UITextAlignment)txtAlignment
                setTag:(int)_tag;

/*
 * 绘制UITextField
 */
+ (UITextField *)drawField:(CGRect)_rect setTxt:(NSString *)txt setFont:(UIFont *)txtFont setTxtColor:(UIColor *)txtColor
              setAlignment:(UITextAlignment)txtAlignment
                    setTag:(int)_tag secureTextEntry:(BOOL)isSecure;
/*
 * 绘制UIBarButtonItem
 */
+ (UIBarButtonItem *)drawBarButtonItemWithCustomView:(UIButton *)btn;

/*
 * 绘制UIButton
 */
+ (UIButton *)drawButton:(CGRect)_rect
          setImgForNomal:(NSString *)imgNomal setImgForHighlight:(NSString *)imgHighlight setTitleForNomal:(NSString *)titleForNomal
              setBtnType:(UIButtonType)btnType
                  setTag:(int)btnTag setDelegate:(id)_delegate selector:(SEL)selector;
/*
 * 展示UIAlertView
 */
+ (void)showAlert:(NSString *)_title setMsg:(NSString *)msg setBtnTitle:(NSString *)btnTitle1 setBtnTitle:(NSString *)btnTitle2
      setDelegate:(id)_delegate
           setTag:(int)_tag;

/*
 * 绘制UIActionSheet
 */
+ (UIActionSheet *)drawActionSheetActionSheet:(NSString *)_title setDelegate:(id)_delegate btnArray:(NSMutableArray *)btnArray setTag:(int)_tag;


@end
