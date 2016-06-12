//
//  ViewController.m
//  手写板
//
//  Created by zy on 16/6/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYDrawView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ZYDrawView *drawView;

@end

@implementation ViewController

// 清空
- (IBAction)clearAll:(id)sender {
    NSLog(@"清空");
    [self.drawView clearAll];
}

// 撤销
- (IBAction)revoke:(id)sender {
    NSLog(@"撤销");
    [self.drawView revoke];
}

// 改变字体大小
- (IBAction)changeFont:(UISlider *)sender {
    NSLog(@"改变字体大小");
    self.drawView.lineWidth = sender.value;
}


@end
