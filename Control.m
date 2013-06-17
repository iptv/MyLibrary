//
//  Control.m
//  OCUnitProject
//
//  Created by Kevin Zhang on 13-5-29.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import "Control.h"

@implementation Control

#pragma mark 绘制 UILabel
+ (UILabel *)drawLabel:(CGRect)_rect setTxt:(NSString *)txt setFont:(UIFont *)txtFont setTxtColor:(UIColor *)txtColor
          setAlignment:(UITextAlignment)txtAlignment
                setTag:(int)_tag{
    UILabel *label = [[UILabel alloc]initWithFrame:_rect];
    
    label.backgroundColor = [UIColor clearColor];
    
    label.text = txt;
    
    label.font = txtFont;
    
    label.textColor = txtColor;
    
    label.textAlignment = txtAlignment;
    
    label.tag = _tag;
    
    return [label autorelease];
}

#pragma mark 绘制 UITextField
+ (UITextField *)drawField:(CGRect)_rect setTxt:(NSString *)txt setFont:(UIFont *)txtFont setTxtColor:(UIColor *)txtColor
              setAlignment:(UITextAlignment)txtAlignment
                    setTag:(int)_tag secureTextEntry:(BOOL)isSecure{
    UITextField *txtField = [[UITextField alloc]initWithFrame:_rect];
    
    txtField.borderStyle = UITextBorderStyleRoundedRect;
    
    txtField.textAlignment = txtAlignment;
    
    txtField.tag = _tag;
    
    txtField.secureTextEntry = isSecure;
    
    txtField.textColor = txtColor;
    
    txtField.text = txt;
    
    txtField.font = txtFont;
    
    return [txtField autorelease];
}

#pragma mark 绘制UIBarButtonItem
+ (UIBarButtonItem *)drawBarButtonItemWithCustomView:(UIButton *)btn{
    UIBarButtonItem *barBtnItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    
    return barBtnItem;
}

#pragma mark 绘制UIButton
+ (UIImage *)allocImage:(NSString *)img{
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:img ofType:@"png"];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
    
    return image;
}

+ (UIButton *)drawButton:(CGRect)_rect
        setImgForNomal:(NSString *)imgNomal setImgForHighlight:(NSString *)imgHighlight setTitleForNomal:(NSString *)titleForNomal
            setBtnType:(UIButtonType)btnType
                setTag:(int)btnTag setDelegate:(id)_delegate selector:(SEL)selector{
    UIButton *btn = [UIButton buttonWithType:btnType];
    
    btn.frame = _rect;
    
    if (imgNomal) {
        [btn setBackgroundImage:[self allocImage:imgNomal] forState:UIControlStateNormal];
    }
    
    if (imgHighlight) {
        [btn setBackgroundImage:[self allocImage:imgHighlight] forState:UIControlStateHighlighted];
    }
    
    [btn setTitle:titleForNomal forState:UIControlStateNormal];
    
    [btn addTarget:_delegate action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTag:btnTag];
    
    return btn;
}


#pragma mark 展示UIAlertView
+ (void)showAlert:(NSString *)_title setMsg:(NSString *)msg setBtnTitle:(NSString *)btnTitle1 setBtnTitle:(NSString *)btnTitle2
      setDelegate:(id)_delegate
           setTag:(int)_tag{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:_title message:msg delegate:_delegate cancelButtonTitle:btnTitle1
                                         otherButtonTitles:btnTitle2, nil];
    alert.tag = _tag;
    
    [alert show];
    
    [alert release];
}

#pragma mark 绘制 UIActionSheet
+ (UIActionSheet *)drawActionSheet:(NSString *)_title setDelegate:(id)_delegate btnArray:(NSMutableArray *)btnArray setTag:(int)_tag{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:_title delegate:_delegate cancelButtonTitle:nil
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:nil, nil];
    if (btnArray != nil && btnArray.count > 0) {
        for (int i = 0; i < btnArray.count; i++) {
            NSString *temp = [btnArray objectAtIndex:i];
            
            if (temp != nil && temp.length > 0) {
                [actionSheet addButtonWithTitle:temp];
            }
        }
    }
    
    [actionSheet setTag:_tag];
    
    return [actionSheet autorelease];
}

@end
