//
//  WDView.h
//  StrokeEndScreenShotDemo
//
//  Created by Noah on 2020/1/6.
//  Copyright © 2020 fx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDView : UIView

@property (nonatomic, strong) CAShapeLayer *testLayer;

- (void)startAnimation;

@end

NS_ASSUME_NONNULL_END
