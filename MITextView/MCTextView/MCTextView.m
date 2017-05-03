//
//  MCTextView.m
//  MedicalCare
//
//  Created by mac2 on 2017/4/26.
//  Copyright © 2017年 zyts. All rights reserved.
//

#import "MCTextView.h"

@interface MCTextView ()<UITextViewDelegate>

@property (nonatomic, strong) UILabel * aPlaceholderLabel;

@end

@implementation MCTextView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initViews];
    
    self.delegate = self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        
        self.delegate = self;
    }
    return self;
}

- (void)initViews
{
    UIEdgeInsets contentInset = self.contentInset;
    
    _aPlaceholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(contentInset.left, contentInset.top, self.bounds.size.width - contentInset.left - contentInset.right, 40)];
    _aPlaceholderLabel.textColor = [UIColor colorWithRed:204./255 green:204./255 blue:204./255 alpha:1.];
    _aPlaceholderLabel.numberOfLines = 0;
    [self addSubview:_aPlaceholderLabel];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    _aPlaceholderLabel.text = placeholder;
    
    if (self.font)
    {
        _aPlaceholderLabel.font = self.font;
        
        UIEdgeInsets textsInset = self.textContainerInset;
        UIEdgeInsets layoutMargin = self.layoutMargins;
        CGSize placeholderSize = [self calculateStringRectWithString:placeholder
                                                                rowWidth:self.bounds.size.width - layoutMargin.left - layoutMargin.right
                                                                    font:self.font];
        CGFloat labelHeight = placeholderSize.height;
        _aPlaceholderLabel.frame = CGRectMake(layoutMargin.left,
                                              textsInset.top,
                                              self.bounds.size.width - layoutMargin.left - layoutMargin.right,
                                              labelHeight);
    }
    else
    {
        UIFont * defaultFont = [UIFont systemFontOfSize:12];
        _aPlaceholderLabel.font = defaultFont;
        
        UIEdgeInsets textsInset = self.textContainerInset;
        UIEdgeInsets layoutMargin = self.layoutMargins;
        CGSize placeholderSize = [self calculateStringRectWithString:placeholder
                                                                rowWidth:self.bounds.size.width - layoutMargin.left - layoutMargin.right
                                                                    font:defaultFont];
        CGFloat labelHeight = placeholderSize.height;
        _aPlaceholderLabel.frame = CGRectMake(layoutMargin.left,
                                              textsInset.top,
                                              self.bounds.size.width - layoutMargin.left - layoutMargin.right,
                                              labelHeight);
    }
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    if (_placeholder) {
        _aPlaceholderLabel.font = font;
        
        UIEdgeInsets textsInset = self.textContainerInset;
        UIEdgeInsets layoutMargin = self.layoutMargins;
        CGSize placeholderSize = [self calculateStringRectWithString:_placeholder
                                                                rowWidth:self.bounds.size.width - layoutMargin.left - layoutMargin.right
                                                                    font:self.font];
        CGFloat labelHeight = placeholderSize.height;
        _aPlaceholderLabel.frame = CGRectMake(layoutMargin.left,
                                              textsInset.top,
                                              self.bounds.size.width - layoutMargin.left - layoutMargin.right,
                                              labelHeight);
    }
}

- (void)setMaxLength:(NSInteger)maxLength
{
    _maxLength = maxLength;
}


#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (text.length > 0) {
        _aPlaceholderLabel.hidden = YES;
    }
    else if ((text.length == 0 || text == nil) && range.location == 0) {
        _aPlaceholderLabel.hidden = NO;
    }
    if (_maxLength > 0) {
        if (range.location < _maxLength) {
            return YES;
        }
        else {
            return NO;
        }
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (_maxLength > 0) {
        if (textView.text.length > _maxLength) {
            textView.text = [textView.text substringToIndex:_maxLength];
        }
    }
}


- (CGSize)calculateStringRectWithString:(NSString *)string rowWidth:(CGFloat)rowWidth font:(UIFont *)font
{
    CGRect stringRect = [string boundingRectWithSize:CGSizeMake(rowWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    return stringRect.size;
}


@end

















