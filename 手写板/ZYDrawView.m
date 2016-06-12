//
//  ZYDrawView.m
//  手写板
//
//  Created by zy on 16/6/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYDrawView.h"
#import "ZYBezierPath.h"

@interface ZYDrawView ()

// 存放贝塞尔曲线的数组
@property (strong, nonatomic) NSMutableArray *allPaths;

@end

@implementation ZYDrawView

- (NSMutableArray *)allPaths
{
    if (!_allPaths) {
        _allPaths = [NSMutableArray array];
    }
    return _allPaths;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}

/**
 * 清除
 */
- (void)clearAll
{
    [self.allPaths removeAllObjects];
    
    [self setNeedsDisplay];
}

/**
 * 撤销
 */
- (void)revoke
{
    [self.allPaths removeLastObject];
    
    [self setNeedsDisplay];
}

// 添加手势
- (void)setUp
{
    // 设置默认属性
    self.lineWidth = 5.0;
}

#warning 根据手指的滑动速度决定线条的粗细

// 获取触摸点
// 初始化一个贝塞尔曲线,同时设计起始点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取手指触碰的点
    CGPoint point = [[touches anyObject] locationInView:self];
    // 初始化贝塞尔曲线
    ZYBezierPath *path = [ZYBezierPath bezierPath];
    // 添加线条的宽度
    path.lineWidth = self.lineWidth;
    // 设置起始点
    [path moveToPoint:point];
    // 添加进入数组
    [self.allPaths addObject:path];
}

// 取出对应的贝塞尔曲线,同时设置移动点,刷新绘图
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取手指触碰的点
    CGPoint point = [[touches anyObject] locationInView:self];

    // 去除对应的贝塞尔曲线
    UIBezierPath *path = [self.allPaths lastObject];
    // 添加移动的点
    [path addLineToPoint:point];
    // 刷新绘图
    [self setNeedsDisplay];
}

// 涂鸦绘图
- (void)drawRect:(CGRect)rect
{
    for (ZYBezierPath *path in self.allPaths) {
        [path stroke];
    }
}

@end
