//
//  MCTextView.h
//  MedicalCare
//
//  Created by mac2 on 2017/4/26.
//  Copyright © 2017年 zyts. All rights reserved.
//
//  自定义的textView 可以设置placeholder 最大字数

#import <UIKit/UIKit.h>

@interface MCTextView : UITextView

/*占位文字*/
@property (nonatomic, copy) NSString * placeholder;

/*最多字数*/
@property (nonatomic, assign) NSInteger maxLength;

@end
