//
//  SWMRootViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 7/31/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMRootViewController.h"
#import "SWMProviderMainDetailViewController.h"
#import "SWMMenuViewController.h"

@interface SWMRootViewController ()

@end

@implementation SWMRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *mainViewController = [storyboard instantiateInitialViewController];
        
        // Prepare side menu view controller
        _menuViewController = [[YSMenuViewController alloc] initWithCenterViewController:mainViewController];
        
        UIViewController * menu = [storyboard instantiateViewControllerWithIdentifier:@"menuViewController"];
        _menuViewController.leftViewController = menu;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"RootViewControll Start");
    
    // Add to view
    [self addChildViewController:_menuViewController];
    [self.view addSubview:_menuViewController.view];
    _menuViewController.view.frame = self.view.bounds;
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

@end
