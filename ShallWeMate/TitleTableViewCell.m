//
//  TitleTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell

+ (CGFloat) getHeight
{
    return 130.0f;
}

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
    
    
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.contentView];
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];

    
    [animator removeAllBehaviors];
    
    
    behavior1 = [[UIAttachmentBehavior alloc]initWithItem:self.titleLabel attachedToAnchor:CGPointMake(160.0f, 50.0f - (lastY -  rectInSuperview.origin.y)* 10)];
    
//    UIAttachmentBehavior * behavior1 = [[UIAttachmentBehavior alloc]initWithItem:self.titleLabel attachedToAnchor:CGPointMake(160.0f, -(difference/2) + move)];
//        behavior1 = [[UIAttachmentBehavior alloc]initWithItem:self.titleLabel attachedToAnchor:CGPointMake(160.0f, 100.0f)];
    
    behavior1.length = 2.0;
    behavior1.damping = 0.9;
    behavior1.frequency = 2.0;
    
    [animator addBehavior:behavior1];
    
    //    lastY = titleRect.origin;
    //    temp = 0.0f;
    //    lastYPos = titleRect.origin.y;
        lastY = rectInSuperview.origin.y;
}

- (void) setTitle:(NSString *)title
{
    if ([title isEqualToString:@""]) {
        title = @"제목 입력 안함";
    }
    self.titleLabel.text = title;
}

-(void) setIntroHouse:(NSString *) text
{
    self.contentLabel.text = text;
}

- (void) setContent:(NSString *)content
{
    if ([content isEqualToString:@""]) {
        content = @"함께 여행계획도 세우고 무용담도 나눌 수 있는 특별한 공간";
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
