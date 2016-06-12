//
//  ZYDrawView.h
//  手写板
//
//  Created by zy on 16/6/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYDrawView : UIView

/**
 * 涂鸦线的宽度
 */
@property (assign, nonatomic) CGFloat lineWidth;

- (void)clearAll;

- (void)revoke;

@end
