//
//  SWMStartViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 17..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMStartViewController.h"

@interface SWMStartViewController ()

@end

@implementation SWMStartViewController

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
    FLAnimatedImage *loadingImg = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loadingImg" ofType:@"gif"]]];
    
//    FLAnimatedImage *loadingImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://vikrambahl.com/wp-content/uploads/2014/06/ajax_loader_blue_512.gif"]]];
    
    //Assign the FLAnimatedImage types to each of the FLAnimatedImageViews via the animatedImage property
    self.loadingImageView.animatedImage = loadingImg;

    
    
    //Add the FLAnimatedImage view objects as subviews
    [self.view addSubview:self.loadingImageView ];
    
    
//    [NSTimer scheduledTimerWithTimeInterval: 3.0
//                                     target: self
//                                   selector: @selector(startView)
//                                   userInfo: nil
//                                    repeats: NO];
}

- (void) startView
{

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
    
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}

- (void) popFacebookLogin
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
    
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
}

- (IBAction)notFacebookClicked:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
    
    [MENU_VIEW_CONTROLLER setProviderBool:YES]; //Provider Menu View
//    [MENU_VIEW_CONTROLLER setProviderBool:NO]; //Consumer Menu view
    
    [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
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
