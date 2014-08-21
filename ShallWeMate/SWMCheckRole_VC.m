//
//  SWMCheckRole_VC.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 7/31/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMCheckRole_VC.h"

@interface SWMCheckRole_VC ()

@end

@implementation SWMCheckRole_VC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        viewDidLoaded = NO;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    //navigation bar hidden
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    //background image setting
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"page2_bg.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (viewDidLoaded) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        viewDidLoaded = YES;
    }
    
    NSLog(@"뷰 어피어");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goMainPage:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
    
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
