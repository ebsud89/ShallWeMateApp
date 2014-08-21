//
//  SWMRoomInfoTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMRoomInfoTableViewCell : UITableViewCell
+ (CGFloat) getHeight;
@property (weak, nonatomic) IBOutlet UILabel *wantN;
@property (weak, nonatomic) IBOutlet UILabel *allN;
@property (weak, nonatomic) IBOutlet UILabel *memN;
@property (weak, nonatomic) IBOutlet UILabel *womenN;
@end
