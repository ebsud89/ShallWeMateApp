//
//  SWMCollectionViewCell.m
//  ShallWeMate
//
//  Created by 컴038 on 8/22/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "SWMCollectionViewCell.h"

@implementation SWMCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"SWMCollectionViewCell4TableViewCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

@end
