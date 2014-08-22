//
//  SWMTransportTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 16..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMTransportTableViewCell.h"

@implementation SWMTransportTableViewCell
+ (CGFloat) getHeight
{
    return 65.0f;
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

- (void) setSubwayStationCode:(NSString *)str
{
    self.subwayStationName.text = str;
    
}

- (void) setHow:(NSString *)how
{
    NSString *str = how;
    self.how.text = str;
    
}
- (void) setMinutes:(NSString *)minutes
{
    NSString *str = minutes;
    self.minutes.text = str;
    
}
@end
