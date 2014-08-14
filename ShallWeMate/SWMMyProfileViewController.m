//
//  SWMMyProfileViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMMyProfileViewController.h"

@interface SWMMyProfileViewController ()

@end

@implementation SWMMyProfileViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)menuClicked:(id)sender {
    
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
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
