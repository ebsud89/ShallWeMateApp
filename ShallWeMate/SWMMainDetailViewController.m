//
//  SWMMainDetailViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMainDetailViewController.h"

@interface SWMMainDetailViewController ()

@end

@implementation SWMMainDetailViewController

@synthesize myTitle;
@synthesize shareView;
@synthesize detailView;
@synthesize leftView, rightView;
@synthesize houseImageScrollView;
@synthesize houseImageArray;
@synthesize doorView;

const int inervalValue = 60;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int count = (int) [houseImageArray count];
    
    NSLog(@"뷰 로드에서 이미지 개수 : %d", count);
    for (int i=0; i<count; i++) {
        CGRect frame;
        frame.origin.x = houseImageScrollView.frame.size.width*i;
        frame.origin.y = 0;
        frame.size = houseImageScrollView.frame.size;
        
        UIImage *myImage = [houseImageArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:myImage];
        imageView.frame = frame;
        [houseImageScrollView addSubview:imageView];
    }
    
    houseImageScrollView.contentSize = CGSizeMake(houseImageScrollView.frame.size.width * houseImageArray.count, houseImageScrollView.frame.size.height);
    
    
    self.titleLabel.text = myTitle;
    
    // share 페이지 애니메이션
    shareMode = NO;
    
    [self.view bringSubviewToFront:detailView];
    
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}


-(void) setHouseImageArray:(NSArray *)houseImageArrays
{
    houseImageArray = [[NSArray alloc]initWithArray:houseImageArrays];
}



// 애니메이션

-(void) startShareViewAni
{
    //Determine how far the doors need to move for them to disappear from view
    
    //    float adjust = (CGRectGetWidth(self.view.frame) > CGRectGetHeight(self.view.frame)) ? CGRectGetWidth(self.view.frame) : CGRectGetHeight(self.view.frame);
    
    UIImageView *myImgView = [self createImg:self.navigationController.view];
    UIImageView *myImgView2 = [self createImageViewLeft:myImgView];
    UIImageView *myImgView3 = [self createimageViewRight:myImgView];
    
    self.leftView = myImgView2;
    self.rightView = myImgView3;
    
    [doorView addSubview:self.leftView];
    [doorView addSubview:self.rightView];
    [doorView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
    
    shareView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    [self.view bringSubviewToFront:shareView];
    [self.view bringSubviewToFront:doorView];
    
    //Retrieve the original frame and then adjust the X position accordingly
    CGRect leftFrame = self.leftView.frame;
	CGRect rightFrame = self.rightView.frame;
    
    NSLog(@"%f, %f", leftFrame.origin.x, rightFrame.origin.x);
    
    leftFrame.origin.x = - self.view.bounds.size.width/2;
    rightFrame.origin.x = self.view.bounds.size.width;
    
    [self.navigationController.navigationBar setHidden:YES];
    
    [UIView animateWithDuration:0.5
     
                     animations:^{
                         shareView.transform = CGAffineTransformMakeScale(1, 1);
                         NSLog(@"%f", leftFrame.origin.x);
                         self.leftView.frame = leftFrame;
                         self.rightView.frame = rightFrame;
                     }
                     completion:^(BOOL finished){
                         [self.view bringSubviewToFront:shareView];
                     }
     ];
    
    
}

-(void) endShareViewAni
{
    
    CGRect leftFrame = self.leftView.frame;
	CGRect rightFrame = self.rightView.frame;
    
    leftFrame.origin.x = 0;
    rightFrame.origin.x = self.view.bounds.size.width/2;
    
    [self.view bringSubviewToFront:doorView];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.leftView.frame = leftFrame;
                         self.rightView.frame = rightFrame;
                     }
                     completion:^(BOOL finished){
                         [self.navigationController.navigationBar setHidden:NO];
                         [self.leftView removeFromSuperview];
                         [self.rightView removeFromSuperview];
                         
                         self.leftView.image = nil;
                         self.rightView.image = nil;
                         
                         [self.view bringSubviewToFront:detailView];
                     }
     ];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PinchGestureRec:(id)sender {
    NSLog(@"Pinch Gesture... ");
    
    if (shareMode == NO) {
        NSLog(@"문열음");
        
        
        
        [NSTimer scheduledTimerWithTimeInterval: 0.1
                                         target: self
                                       selector: @selector(startShareViewAni)
                                       userInfo: nil
                                        repeats: NO];
        
        shareMode = YES;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Began");
    
    if (shareMode == YES) {
        NSLog(@"문 닫음");
        
        
        
        [NSTimer scheduledTimerWithTimeInterval: 0.1
                                         target: self
                                       selector: @selector(endShareViewAni)
                                       userInfo: nil
                                        repeats: NO];
        shareMode = NO;
    }
}

- (UIImageView*) createImageViewLeft:(UIImageView*)view
{
    CGSize snapSize = CGSizeMake(view.frame.size.width/2, view.frame.size.height);
    UIGraphicsBeginImageContext(snapSize);
    
    [view.image drawAtPoint:CGRectMake(0, 0, view.frame.size.width/2, view.frame.size.height).origin];
    
    UIImage *aboveViewSnapShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *aboveSnapView = [[UIImageView alloc]initWithImage:aboveViewSnapShot];
    //    aboveSnapView.contentMode = UIViewContentModeScaleToFill;
    aboveSnapView.contentMode = UIViewContentModeRight;
    [aboveSnapView setFrame:CGRectMake(0, 0, view.frame.size.width/2, view.frame.size.height)];
    return aboveSnapView;
}

- (UIImageView*) createimageViewRight:(UIImageView*)view
{
    CGSize snapSize = CGSizeMake(view.frame.size.width/2, view.frame.size.height);
    UIGraphicsBeginImageContext(snapSize);
    
    [view.image drawAtPoint:CGRectMake(-view.frame.size.width/2, 0, view.frame.size.width, view.frame.size.height).origin];
    
    UIImage *aboveViewSnapShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *aboveSnapView = [[UIImageView alloc]initWithImage:aboveViewSnapShot];
    aboveSnapView.contentMode = UIViewContentModeScaleToFill;
    //    aboveSnapView.contentMode = UIViewContentModeRight;
    [aboveSnapView setFrame:CGRectMake(view.frame.size.width/2, 0, view.frame.size.width/2, view.frame.size.height)];
    return aboveSnapView;
}


-(UIImageView *)createImg:(UIView*)view
{
    
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewSnapShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [[UIImageView alloc]initWithImage:viewSnapShot];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
