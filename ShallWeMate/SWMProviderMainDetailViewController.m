//
//  SWMProviderMainDetailViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMProviderMainDetailViewController.h"

@interface SWMProviderMainDetailViewController ()

@end

@implementation SWMProviderMainDetailViewController

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
    NSLog(@"DetailViewControll Start");
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 400, 100)];
    lb.text = @"Detail View Controller";
    [self.view addSubview:lb];
    // Force refresh UI
    [self refreshUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Setup right view controller
    //    MENU_CONTROLLER.rightViewController = [[RightViewController alloc] init];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)refreshUI
{
    // Update label
    //    _numberLabel.text = [NSString stringWithFormat:@"%d", _number];
}

#pragma mark - UI Actions
- (IBAction)menuBtnTouch:(id)sender
{
    
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"number"] && [self isViewLoaded])
    {
        [self refreshUI];
    }
}

#pragma mark - PZSideMenuProtocol methods
- (void)viewWillReduceFromLeft:(NSNumber *)fromLeft
{
    //    if ([fromLeft boolValue])
    //        MENU_CONTROLLER.rightViewController = nil;
}

- (void)viewDidGrow
{
    //    if (!_rightViewController)
    //        _rightViewController = [[RightViewController alloc] init];
    
    //    MENU_CONTROLLER.rightViewController = [[RightViewController alloc] init];
}


@end
