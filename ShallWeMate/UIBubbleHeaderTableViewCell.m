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
@property (nonatomic, retain) UIImageView *avatarImage;
@property (nonatomic, retain) UIImage *avatar;

@end

@implementation UIBubbleHeaderTableViewCell

@synthesize label = _label;
@synthesize date = _date;
@synthesize name = _name;
@synthesize description = _description;
@synthesize avatarImage = _avatarImage;
@synthesize avatar = _avatar;

+ (CGFloat)height
{
    return 0.0;//60.0;
}

- (void)setDate:(NSDate *)value
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
//    NSString *text = [dateFormatter stringFromDate:value]; //메세지 내용
//    NSString *name = @"koh gabin"; // 상대 이름
//    NSString *desc = @"house description"; //상대 하우스 설명
//#if !__has_feature(objc_arc)
//    [dateFormatter release];
//#endif
//    
//    if (self.label)
//    {
//        self.label.text = text;
////        self.name.text = name;
////        self.description.text = desc;
//        return;
//    }
//    
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(55, -20, self.frame.size.width, [UIBubbleHeaderTableViewCell height])];
//    self.label.text = text;
//    self.label.font = [UIFont boldSystemFontOfSize:12];
//    self.label.textAlignment = NSTextAlignmentLeft;
//    self.label.shadowOffset = CGSizeMake(0, 1);
//    self.label.shadowColor = [UIColor whiteColor];
//    self.label.textColor = [UIColor darkGrayColor];
//    self.label.backgroundColor = [UIColor clearColor];
//    [self addSubview:self.label];
//    
//    self.name = [[UILabel alloc] initWithFrame:CGRectMake(55, -10, self.frame.size.width, [UIBubbleHeaderTableViewCell height])];
//    self.name.text = name;
//    self.name.font = [UIFont boldSystemFontOfSize:12];
//    self.name.textAlignment = NSTextAlignmentLeft;
//    self.name.shadowOffset = CGSizeMake(0, 1);
//    self.name.shadowColor = [UIColor whiteColor];
//    self.name.textColor = [UIColor darkGrayColor];
//    self.name.backgroundColor = [UIColor clearColor];
////    [self addSubview:self.name];
//    
//    self.description = [[UILabel alloc] initWithFrame:CGRectMake(55,      0, self.frame.size.width, [UIBubbleHeaderTableViewCell height])];
//    self.description.text = desc;
//    self.description.font = [UIFont boldSystemFontOfSize:12];
//    self.description.textAlignment = NSTextAlignmentLeft;
//    self.description.shadowOffset = CGSizeMake(0, 1);
//    self.description.shadowColor = [UIColor whiteColor];
//    self.description.textColor = [UIColor darkGrayColor];
//    self.description.backgroundColor = [UIColor clearColor];
////    [self addSubview:self.description];
//    
//    ///////////test
//    
//    
//    NSBubbleType type = self.data.type;
//    NSLog(@"5555");
//    
//    CGFloat avatarX = 0.0;
//    CGFloat avatarY = 0.0;
//    
//    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
////    fbProfilePictureView.profileID =appDelegate.fbUserId;
////    userName.text = appDelegate.fbUserName;
//    
//    if (type == BubbleTypeSomeoneElse) {
//
//    // Adjusting the x coordinate for avatar
////    if (self.showAvatar)
////    {
//        [self.avatarImage removeFromSuperview];
//#if !__has_feature(objc_arc)
//        self.avatarImage = [[[UIImageView alloc] initWithImage:(self/*.data*/.avatar ? self/*.data*/.avatar : [UIImage imageNamed:@"missingAvatar.png"])] autorelease];
//#else
//        self.avatarImage = [[UIImageView alloc] initWithImage:(self/*.data*/.avatar ? self/*.data*/.avatar : [UIImage imageNamed:@"missingAvatar.png"])];
//#endif
//        self.avatarImage.layer.cornerRadius = 9.0;
//        self.avatarImage.layer.masksToBounds = YES;
//        self.avatarImage.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
//        self.avatarImage.layer.borderWidth = 1.0;
//        
//         avatarX =2;
//     avatarY = 5;//self.frame.size.height - 50;
//        
////        self.avatarImage.frame = CGRectMake(avatarX, avatarY, 50, 50);
////        [self addSubview:self.avatarImage];
//        
//    }
//    if (type == BubbleTypeMine) {
//        [self.avatarImage removeFromSuperview];
//#if !__has_feature(objc_arc)
//        self.avatarImage = [[[UIImageView alloc] initWithImage:(self/*.data*/.avatar ? self/*.data*/.avatar : [UIImage imageNamed:@"face_test.png"])] autorelease];
//#else
//        self.avatarImage = [[UIImageView alloc] initWithImage:(self/*.data*/.avatar ? self/*.data*/.avatar : [UIImage imageNamed:@"face_test.png"])];
//#endif
//        self.avatarImage.layer.cornerRadius = 9.0;
//        self.avatarImage.layer.masksToBounds = YES;
//        self.avatarImage.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
//        self.avatarImage.layer.borderWidth = 1.0;
//        
//         avatarX =2;
//         avatarY = 5;//self.frame.size.height - 50;
//        
//        
//    }
//    
//    
//    self.avatarImage.frame = CGRectMake(avatarX, avatarY, 50, 50);
//    [self addSubview:self.avatarImage];
}




@end
