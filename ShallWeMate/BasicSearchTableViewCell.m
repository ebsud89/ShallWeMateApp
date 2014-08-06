//
//  BasicSearchTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 2..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "BasicSearchTableViewCell.h"

@implementation BasicSearchTableViewCell

+ (BasicSearchTableViewCell*) basicSearchTableViewCell
{
    BasicSearchTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BasicSearchTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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

@end
