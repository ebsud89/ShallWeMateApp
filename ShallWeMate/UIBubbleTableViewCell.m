//
//  UIBubbleTableViewCell.m
//
//  Created by Alex Barinov
//  Project home page: http://alexbarinov.github.com/UIBubbleTableView/
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import <QuartzCore/QuartzCore.h>
#import "UIBubbleTableViewCell.h"
#import "NSBubbleData.h"

@interface UIBubbleTableViewCell ()

@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *description;
@property (nonatomic, retain) UILabel *dateLabell;
@property (nonatomic, retain) UIView *customView;
@property (nonatomic, retain) UIImageView *bubbleImage;
@property (nonatomic, retain) UIImageView *avatarImage;

- (void) setupInternalData;

@end

@implementation UIBubbleTableViewCell

@synthesize data = _data;
@synthesize customView = _customView;
@synthesize bubbleImage = _bubbleImage;
@synthesize showAvatar = _showAvatar;
@synthesize avatarImage = _avatarImage;

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
	[self setupInternalData];
}

#if !__has_feature(objc_arc)
- (void) dealloc
{
    self.data = nil;
    self.customView = nil;
    self.bubbleImage = nil;
    self.avatarImage = nil;
    [super dealloc];
}
#endif

- (void)setDataInternal:(NSBubbleData *)value
{
	self.data = value;
	[self setupInternalData];
}

- (void) setupInternalData
{//
    NSString *name = @"고가빈"; // 상대 이름
    NSString *desc = @"음악을 좋아하는 사람들의 집"; //상대 하우스 설명
    //
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!self.bubbleImage)
    {
#if !__has_feature(objc_arc)
        self.bubbleImage = [[[UIImageView alloc] init] autorelease];
#else
        self.bubbleImage = [[UIImageView alloc] init];
#endif
        [self addSubview:self.bubbleImage];
    }
    //
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(65, -9, self.frame.size.width, 50.0)];
    self.name.text = name;
    self.name.font = [UIFont boldSystemFontOfSize:15];
    self.name.textAlignment = NSTextAlignmentLeft;
    self.name.shadowOffset = CGSizeMake(0, 1);
    self.name.shadowColor = [UIColor whiteColor];
    self.name.textColor = [UIColor darkGrayColor];
    self.name.backgroundColor = [UIColor clearColor];
    
    
    self.description = [[UILabel alloc] initWithFrame:CGRectMake(65, 9, self.frame.size.width, 50.0)];
    self.description.text = desc;
    self.description.font = [UIFont boldSystemFontOfSize:13];
    self.description.textAlignment = NSTextAlignmentLeft;
    self.description.shadowOffset = CGSizeMake(0, 1);
    self.description.shadowColor = [UIColor whiteColor];
    self.description.textColor = [UIColor grayColor];
    self.description.backgroundColor = [UIColor clearColor];
    
    //
    NSBubbleType type = self.data.type;
    
    CGFloat width = self.data.view.frame.size.width;
    CGFloat height = self.data.view.frame.size.height;
    
    CGFloat x = (type == BubbleTypeSomeoneElse) ? 0 : self.frame.size.width - width - self.data.insets.left - self.data.insets.right;
    CGFloat y = 0;
    
    //
    if (type == BubbleTypeSomeoneElse) {
        x += 54;
        y += 18;
    }
    if (type == BubbleTypeMine) {
        y -= 18;
        self.avatarImage.hidden = YES;}
    //
    
    
    
    [self.customView removeFromSuperview];
    self.customView = self.data.view;
    
    
    if (type == BubbleTypeSomeoneElse)
    {
        self.bubbleImage.image = [[UIImage imageNamed:@"m4.png"] stretchableImageWithLeftCapWidth:17 topCapHeight:18];
        
        //
        // Adjusting the x coordinate for avatar
        if (self.showAvatar)
        {
            [self.avatarImage removeFromSuperview];
#if !__has_feature(objc_arc)
            self.avatarImage = [[[UIImageView alloc] initWithImage:(self.data.avatar ? self.data.avatar : [UIImage imageNamed:@"missingAvatar.png"])] autorelease];
#else
            self.avatarImage = [[UIImageView alloc] initWithImage:(self.data.avatar ? self.data.avatar : [UIImage imageNamed:@"missingAvatar.png"])];
#endif
            self.avatarImage.layer.masksToBounds = YES;
            self.avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width / 2;
            self.avatarImage.clipsToBounds = YES;
            self.avatarImage.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
            self.avatarImage.layer.borderWidth = 1.0;
            
            CGFloat avatarX = (type == BubbleTypeSomeoneElse) ? 5 : self.frame.size.width - 52;
            CGFloat avatarY = self.frame.size.height - 50;
            
            self.avatarImage.frame = CGRectMake(avatarX, avatarY, 50, 50);
            [self addSubview:self.avatarImage];
            
            CGFloat delta = self.frame.size.height - (self.data.insets.top + self.data.insets.bottom + self.data.view.frame.size.height);
            if (delta > 0) y = delta;
            
        }
        
        
        [self addSubview:self.name];
        [self addSubview:self.description];
        self.customView.frame = CGRectMake(x + self.data.insets.left-1, y + self.data.insets.top + 32, width, height);
        
    }
    else {
        self.bubbleImage.image = [[UIImage imageNamed:@"m1.png"] stretchableImageWithLeftCapWidth:17 topCapHeight:12];
        self.customView.frame = CGRectMake(x + self.data.insets.left+4, y + self.data.insets.top + 30, width, height+5);
    }
    
    [self.contentView addSubview:self.customView];
    self.bubbleImage.frame = CGRectMake(x, y+30, width + self.data.insets.left + self.data.insets.right, height + self.data.insets.top + self.data.insets.bottom);
//    [self.textLabel setFont:[UIFont fontWithName:@"System" size:10]];
}

@end
