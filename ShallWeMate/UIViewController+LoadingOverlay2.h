//
//  UIViewController+LoadingOverlay.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 20..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"

@interface UIViewController (LoadingOverlay2)

-(void)showLayer:(NSString *)message;
-(void)hideLayer;



@end
