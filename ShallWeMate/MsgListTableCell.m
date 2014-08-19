//
//  MessageTableViewCell.m
//  start
//
//  Created by 컴038 on 8/1/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "MsgListTableCell.h"

@implementation MsgListTableCell

UIImageView *imgView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}


- (void)awakeFromNib
{
    // Initialization code
    self.providerImage.layer.cornerRadius = self.providerImage.frame.size.width / 2;
    UIColor *borderColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0];
    [self.providerImage.layer setBorderColor:borderColor.CGColor];
    [self.providerImage.layer setBorderWidth:1.0];
    self.providerImage.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(UILabel*) textLabel {
    return nil; // or perhaps return nil
}


@end
