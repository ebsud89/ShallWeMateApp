//
//  UIBubbleHeaderTableViewCell.m
//  UIBubbleTableViewExample
//
//  Created by Александр Баринов on 10/7/12.
//  Copyright (c) 2012 Stex Group. All rights reserved.
//

#import "UIBubbleHeaderTableViewCell.h"

@interface UIBubbleHeaderTableViewCell ()

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *description;

@end

@implementation UIBubbleHeaderTableViewCell

@synthesize label = _label;
@synthesize date = _date;
@synthesize name = _name;
@synthesize description = _description;

+ (CGFloat)height
{
    return 60.0;
}

- (void)setDate:(NSDate *)value
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *text = [dateFormatter stringFromDate:value]; //메세지 내용
    NSString *name = @"koh gabin"; // 상대 이름
    NSString *desc = @"house description"; //상대 하우스 설명
#if !__has_feature(objc_arc)
    [dateFormatter release];
#endif
    
    if (self.label)
    {
        self.label.text = text;
        self.name.text = name;
        self.description.text = desc;
        return;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [UIBubbleHeaderTableViewCell height])];
    self.label.text = text;
    self.label.font = [UIFont boldSystemFontOfSize:12];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.shadowOffset = CGSizeMake(0, 1);
    self.label.shadowColor = [UIColor whiteColor];
    self.label.textColor = [UIColor darkGrayColor];
    self.label.backgroundColor = [UIColor clearColor];
    [self addSubview:self.label];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, [UIBubbleHeaderTableViewCell height])];
    self.name.text = name;
    self.name.font = [UIFont boldSystemFontOfSize:12];
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.shadowOffset = CGSizeMake(0, 1);
    self.name.shadowColor = [UIColor whiteColor];
    self.name.textColor = [UIColor darkGrayColor];
    self.name.backgroundColor = [UIColor clearColor];
    [self addSubview:self.name];
    
    self.description = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, [UIBubbleHeaderTableViewCell height])];
    self.description.text = desc;
    self.description.font = [UIFont boldSystemFontOfSize:12];
    self.description.textAlignment = NSTextAlignmentCenter;
    self.description.shadowOffset = CGSizeMake(0, 1);
    self.description.shadowColor = [UIColor whiteColor];
    self.description.textColor = [UIColor darkGrayColor];
    self.description.backgroundColor = [UIColor clearColor];
    [self addSubview:self.description];
}



@end
