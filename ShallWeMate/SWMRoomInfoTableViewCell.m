//
//  SWMRoomInfoTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMRoomInfoTableViewCell.h"

@implementation SWMRoomInfoTableViewCell
+ (CGFloat) getHeight
{
    return 90.0f;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) setWantN:(NSString *)wantN :(NSString*)allN
{
    NSString *want = wantN;
    self.wantN.text = want;
    
    NSString *str = allN;
    self.allN.text = str;
    
}
- (void) setAllN:(NSString *)allN
{
    NSString *str = allN;
    self.allN.text = str;
    
}

- (void) setMemN:(UILabel *)memN {
    NSString *want = memN;
    self.memN.text = want;
}
-(void) setWomenN:(UILabel *)womenN {
    NSString *want = womenN;
    self.womenN.text = want;
}
@end
