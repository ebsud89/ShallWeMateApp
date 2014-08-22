//
//  SWMHouseImageScrollView.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMHouseImageScrollView.h"

@implementation SWMHouseImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.dragging)
        [self.superview touchesCancelled: touches withEvent:event];
    else
        [super touchesCancelled: touches withEvent: event];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.dragging)
        [self.superview touchesMoved: touches withEvent:event];
    else
        [super touchesMoved: touches withEvent: event];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.dragging)
        [self.superview touchesBegan: touches withEvent:event];
    else
        [super touchesBegan: touches withEvent: event];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.dragging)
        [self.superview touchesEnded: touches withEvent:event];
    else
        [super touchesEnded: touches withEvent: event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
