//
//  SWMImageScrollTableViewCell.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMImageScrollTableViewCell.h"

@implementation SWMImageScrollTableViewCell

+ (CGFloat) getHeight
{
    return 220.0f;
}

- (void)awakeFromNib
{
    // Initialization code
    
    // Create gesture recognizer
    UITapGestureRecognizer *oneFingerTwoTaps =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
    
    // Set required taps and number of touches
    [oneFingerTwoTaps setNumberOfTapsRequired:2];
    [oneFingerTwoTaps setNumberOfTouchesRequired:1];
    
    // Add the gesture to the view
    [self.imageScrollView addGestureRecognizer:oneFingerTwoTaps];

}
/*--------------------------------------------------------------
 * One finger, two taps
 *-------------------------------------------------------------*/
- (void)oneFingerTwoTaps
{
    NSLog(@"Action: One finger, two taps");
    NSLog(@"찜!!!");
}

- (void) initScrollView
{
//    self.houseImageScrollView.scrollsToTop = YES;
//    NSArray *subViews = [houseImageScrollView subviews];
//    if (subViews != nil) {
//        for (UIView *subView in subViews) {
//            [subView removeFromSuperview];
//        }
//    }
//    
//    
//    int count = (int) [self.assets count];
//    
//    
//    for (int i=0; i<count; i++) {
//        CGRect frame;
//        frame.origin.x = self.imageScrollView.frame.size.width*i;
//        frame.origin.y = 0;
//        frame.size = self.imageScrollView.frame.size;
//        
//        ALAsset *asset = [self.assets objectAtIndex:i];
//        
//        UIImage *myImage = [UIImage imageWithCGImage:asset.thumbnail];
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:myImage];
//        imageView.frame = frame;
//        [self.imageScrollView addSubview:imageView];
//    }
//    
//    self.addPhotoBtn.frame = CGRectMake(self.imageScrollView.frame.size.width*count + 160, self.imageScrollView.frame.size.height/2, self.addPhotoBtn.frame.size.width, self.addPhotoBtn.frame.size.height);
//    
//    [self.imageScrollView addSubview:self.addPhotoBtn];
//    
//    houseImageScrollView.contentSize = CGSizeMake(houseImageScrollView.frame.size.width * (self.assets.count+1), houseImageScrollView.frame.size.height);
//    
//    [self.houseImageScrollView reloadInputViews];
//    [self.houseImageScrollView setContentOffset:CGPointZero animated:YES];
}

- (void) refreshData
{
    
    if ([self.houseImageArray count] == 0) {
        self.houseImageArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"testImg1.jpg"],[UIImage imageNamed:@"testImg2.jpg"],[UIImage imageNamed:@"testImg3.jpg"],[UIImage imageNamed:@"testImg1.jpg"],[UIImage imageNamed:@"testImg2.jpg"],[UIImage imageNamed:@"testImg3.jpg"], nil];
    }
    
    
    int count = (int) [self.houseImageArray count];
    
    for (int i=0; i<count; i++) {
        CGRect frame;
        frame.origin.x = self.imageScrollView.frame.size.width*i;
        frame.origin.y = 0;
        frame.size = self.imageScrollView.frame.size;
        
        UIImage *myImage = [self.houseImageArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:myImage];
        
        imageView.frame = frame;
        [self.imageScrollView addSubview:imageView];
    }
    
    self.imageScrollView.contentSize = CGSizeMake(self.imageScrollView.frame.size.width * count, self.imageScrollView.frame.size.height);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
