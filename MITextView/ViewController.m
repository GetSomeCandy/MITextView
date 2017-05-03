//
//  ViewController.m
//  MITextView
//
//  Created by mac2 on 2017/5/3.
//  Copyright © 2017年 mac2. All rights reserved.
//

#import "ViewController.h"
#import "MCTextView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MCTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.layer.borderColor = [[UIColor blackColor] CGColor];
    _textView.layer.borderWidth = 1.f;
    _textView.placeholder = @"hello~~~~~";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
