//
//  ViewController.m
//  StrokeEndScreenShotDemo
//
//  Created by Noah on 2020/1/6.
//  Copyright © 2020 fx. All rights reserved.
//

#import "ViewController.h"
#import "WDView.h"

@interface ViewController ()

@property (nonatomic, strong) WDView *wsyView;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WDView *v = [[WDView alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    self.wsyView = v;
    v.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:v];
    
}

- (UIImage *)screenLongShotWithView:(UIView *)view withAnimatingView:(BOOL)saveAnimate {
    UIImage* image = nil;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    //在当前上下文中渲染出collectionView
    CALayer *layer;
    if (saveAnimate) {
        layer = [view.layer presentationLayer];
    }else {
        layer = view.layer;
    }
    [layer renderInContext: UIGraphicsGetCurrentContext()];
    //截取当前上下文生成Image
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }else {
        return nil;
    }
}

- (IBAction)buttonClick:(id)sender {
    [self.wsyView startAnimation];
}

- (IBAction)screenShotAction:(id)sender {
    UIImage *image = [self screenLongShotWithView:self.wsyView withAnimatingView:NO];
    
    self.showImageView.image = image;
}

@end
