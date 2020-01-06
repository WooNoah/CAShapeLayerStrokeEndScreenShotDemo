//
//  WDView.m
//  StrokeEndScreenShotDemo
//
//  Created by Noah on 2020/1/6.
//  Copyright © 2020 fx. All rights reserved.
//

#import "WDView.h"

@interface WDView()

@end

@implementation WDView

- (void)dealloc
{
    [self.testLayer removeObserver:self forKeyPath:@"strokeEnd"];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointZero];
        [path addLineToPoint:CGPointMake(100, 50)];
        [path addLineToPoint:CGPointMake(200, 0)];
        [path addLineToPoint:CGPointMake(200, 100)];
        [path addLineToPoint:CGPointMake(0, 100)];
        [path closePath];
        
        
        self.testLayer.frame = self.bounds;
        self.testLayer.path = path.CGPath;
        self.testLayer.fillColor = [UIColor whiteColor].CGColor;
        self.testLayer.strokeColor = [UIColor redColor].CGColor;
        self.testLayer.lineWidth = 5.f;
        [self.layer addSublayer:self.testLayer];
        
        [self.testLayer addObserver:self forKeyPath:@"strokeEnd" options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"strokeEnd"]) {
        NSLog(@"~~~~~~~%@",change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)startAnimation {
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animate.fromValue = @0;
    animate.toValue = @0.8;
    animate.duration = 2;
    animate.fillMode = kCAFillModeForwards;
    animate.removedOnCompletion = NO;
    [self.testLayer addAnimation:animate forKey:@"animate"];
    
    self.testLayer.strokeEnd = 0.8;
}


- (CAShapeLayer *)testLayer {
    if (!_testLayer) {
        _testLayer = [[CAShapeLayer alloc] init];
    }
    return _testLayer;
}

@end
