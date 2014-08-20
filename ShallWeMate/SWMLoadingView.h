//
//  SWMLoadingView.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 20..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMLoadingView : UIView

@end
@interface UIViewController (OverlayView)

-(void)showLayer:(NSString *)message;
-(void)hideLayer;
@end