//
//  SWMImageScrollTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWMTableViewCell.h"

@interface SWMImageScrollTableViewCell : SWMTableViewCell

@property (strong, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) NSMutableArray *houseImageArray;

- (void) initScrollView;
- (void) refreshData;
+ (CGFloat) getHeight;
@end
