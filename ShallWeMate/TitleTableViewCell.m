//
//  TitleTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell


+ (TitleTableViewCell*) titleTableViewCell
{
    
//    TitleTableViewCell *cells = [[[NSBundle mainBundle] loadNibNamed:@"titleTableViewCell" owner:self options:nil]objectAtIndex:0];
    TitleTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"TitleTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void) setTitle:(NSString *)title
{
    if ([title isEqualToString:@""]) {
        title = @"제목 입력 안함";
    }
    self.titleLabel.text = title;
}

- (void) setContent:(NSString *)content
{
    if ([content isEqualToString:@""]) {
        content = @"내용 입력 안함";
    }
    self.contentLabel.text = content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    NSLog(@"aa");
}

@end
