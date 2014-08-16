//
//  SWMMenuViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMenuViewController.h"

@interface SWMMenuViewController ()

@end

@implementation SWMMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.consumerView removeFromSuperview];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"View Load menu");
//    [self.consumerView removeFromSuperview];
//    [self.providerView becomeFirstResponder];
//    [self.consumerView bringSubviewToFront:self.providerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setProviderMenu
{
    [self.consumerView removeFromSuperview];
    [self.providerView removeFromSuperview];
}

- (void) setConsumerMenu
{
//    [self.providerView removeFromSuperview];
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

// User funtions
// Consumer Buttons
- (IBAction)likeItListClicked:(id)sender {
    NSLog(@"소비자 - 찜 리스트 클릭");
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LikeItListViewController"];
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}

- (IBAction)messageClicked:(id)sender {
    NSLog(@"소비자 - 메세지 클릭");
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"messageViewController"];
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}

- (IBAction)myHouseProfileClicked:(id)sender {
    NSLog(@"소비자 - 나의 하우스 프로필 클릭");
    
}

- (IBAction)myProfileClicked:(id)sender {
    NSLog(@"소비자 - 나의 프로필 클릭");
//    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"srchUserInfo"];
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"myProfileViewControllerNav"];
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
    
}

- (IBAction)alarmClicked:(id)sender {
    NSLog(@"소비자 - 알람 클릭");
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"alarmViewController"];
    
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}
- (IBAction)homeClicked:(id)sender {
    NSLog(@"소비자 - 홈 클릭");
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
    
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}


// Provider Buttons
- (IBAction)pMyHouseProfileClicked:(id)sender {
    NSLog(@"공급자 - 하우스 정보 수정 클릭");
}
- (IBAction)pMessageClicked:(id)sender {
    NSLog(@"공금자 - 메세지 클릭");
}
- (IBAction)pAlarmClicked:(id)sender {
    NSLog(@"공급자 - 알림 클릭");
}


-(void)openMenu
{
    NSLog(@"openMenuasdfasdfasfasfasdfafasf");
    //    self.myInfoBtn.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMidY(self.view.bounds)/2);
    //    self.houseInfoBtn.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMidY(self.view.bounds)/2);
    //    self.settingBtn.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMidY(self.view.bounds)/2);
    //    NSLog(@"open됨~~~~~~");
    
    
    // 여기서 글씨 따라 내려오는거 했었지만... 안예뻐서...
    
    //    // 메인 뷰 내려가는 duration -> 0.25f
    //    [UIView animateWithDuration:0.4f delay:0.1f options:UIViewAnimationOptionCurveEaseOut animations:^{
    //        {
    //            //                self.myInfoBtn.transform = CGAffineTransformMakeTranslation(0, 10);
    //            self.myInfoBtn.transform = CGAffineTransformMakeTranslation(0, 0);
    //            self.houseInfoBtn.transform = CGAffineTransformMakeTranslation(0, 0);
    //            self.settingBtn.transform = CGAffineTransformMakeTranslation(0, 0);
    //        }
    //    } completion:^(BOOL finished) {
    //        NSLog(@"끝");
    //    }];
    
    
    
    
    
    
    
    //    [UIView animateWithDuration:0.25f animations:^{
    //        {
    ////                self.myInfoBtn.transform = CGAffineTransformMakeTranslation(0, 10);
    //            self.myInfoBtn.transform = CGAffineTransformMakeTranslation(0, 0);
    //            self.houseInfoBtn.transform = CGAffineTransformMakeTranslation(0, 0);
    //            self.settingBtn.transform = CGAffineTransformMakeTranslation(0, 0);
    //        }
    //    }];
    //
    //
}

-(void)moveLayer:(CALayer*)layer to:(CGPoint)point{
    /*
     kCAMediaTimingFunctionLinear : 일정한 속도로 재생
     kCAMediaTimingFunctionEaseIn : 처음에 천천히 시작
     kCAMediaTimingFunctionEaseOut : 마지막에 천천히 종료
     kCAMediaTimingFunctionEaseInEaseOut : 천천히 시작하고 마지막에 다시 천천히 종료
     */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //    animation.fromValue = [layer valueForKey:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //    animation.fromValue = [NSValue valueWithCGPoint:layer.position];
    animation.toValue = [NSValue valueWithCGPoint:point];
    layer.position = point;
    animation.duration = 1;
    [layer addAnimation:animation forKey:@"position"];
}

@end