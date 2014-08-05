//
//  SWMMainTableViewCell.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMainTableViewCell.h"

@implementation SWMMainTableViewCell

@synthesize houseImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"뷰가 로드 됨, initwithsytle");
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    NSLog(@"뷰가 로드 되었습니다!~~~~");
}

-(void) setHouseImageArray:(NSArray *)houseImageArray
{
    
    int count = (int) [houseImageArray count];
    
    NSLog(@"이미지 수 : %d", count);
    for (int i=0; i<count; i++) {
        CGRect frame;
        frame.origin.x = self.houseScrollView.frame.size.width*i;
        frame.origin.y = 0;
        frame.size = self.houseScrollView.frame.size;
        
        UIImage *myImage = [houseImageArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:myImage];
        imageView.frame = frame;
        [self.houseScrollView addSubview:imageView];
    }
    
    self.houseScrollView.contentSize = CGSizeMake(self.houseScrollView.frame.size.width * houseImageArray.count, self.houseScrollView.frame.size.height);
    
    //    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];
    //    for (int i = 0; i < colors.count; i++) {
    //        CGRect frame;
    //        frame.origin.x = self.houseScrollView.frame.size.width * i;
    //        frame.origin.y = 0;
    //        frame.size = self.houseScrollView.frame.size;
    //
    //        UIView *subview = [[UIView alloc] initWithFrame:frame];
    //        subview.backgroundColor = [colors objectAtIndex:i];
    //        [self.houseScrollView addSubview:subview];
    //    }
    //
    //    self.houseScrollView.contentSize = CGSizeMake(self.houseScrollView.frame.size.width * colors.count, self.houseScrollView.frame.size.height);
    //
}


- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    NSLog(@"%f",CGRectGetHeight(view.frame));
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.titleLabel.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    //    CGRect imageRect = self.houseScrollView.frame;
    //    imageRect.origin.y = -(difference/2)+move;
    //    self.houseScrollView.frame = imageRect;
    
    CGRect titleRect = self.titleLabel.frame;
    titleRect.origin.y = -(difference/2) + move;
    self.titleLabel.frame = titleRect;
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
