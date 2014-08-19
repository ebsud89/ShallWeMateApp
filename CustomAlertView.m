//
//  CustomAlertView.m
//  ShallWeMate
//
//  Created by 컴038 on 8/19/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void) show {
    [super show];
    
    for (UIView* view in self.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                [(UILabel*)view setTextColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
        }
    }
}

@end
