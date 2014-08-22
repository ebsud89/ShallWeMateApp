
//
//  UIViewController+LoadingOverlay.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 20..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "UIViewController+LoadingOverlay2.h"


@implementation UIViewController (LoadingOverlay2)

-(void)showLayer:(NSString *)message;
{
    UIView *layer = [[UIView alloc] initWithFrame:self.view.bounds];
    // layer.alpha = 0.5;
    layer.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.0f];
    
    //    /* Create Label */
    //    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    ////    label.textAlignment = UITextAlignmentCenter;
    //    label.lineBreakMode = YES; // 개행 설정.
    //    label.numberOfLines = 0; // 개행 숫자에 제한을 두지 않음.
    //    label.backgroundColor = [UIColor clearColor];
    //    label.textColor = [UIColor whiteColor];
    //    label.text = message;
    //    [layer addSubview:label];
    
    /* Add LayerView */
    [self.view addSubview:layer];
    
    FLAnimatedImage *myLoadingImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loadingImg" ofType:@"gif"]]];
    
    FLAnimatedImageView *myImageView = [[FLAnimatedImageView alloc]initWithFrame:CGRectMake(0, 200, 320, 180)];
    
    myImageView.animatedImage = myLoadingImage;
    myImageView.alpha = 0.0f;
    
    [UIView animateWithDuration:0.2f animations:^{
        myImageView.alpha = 1.0f;
        layer.backgroundColor = [[UIColor clearColor]colorWithAlphaComponent:0.5f];
        
    }];
    [self.view addSubview:myImageView];
}

-(void)hideLayer
{
    NSArray *subViews = [self.view subviews];
    UIView *layer = [subViews lastObject];
    [layer removeFromSuperview];
}

@end
