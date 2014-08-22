//
//  SWMStartViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 17..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMStartViewController.h"
#import "SWMAppDelegate.h"
#import "SWMLoginViewController.h"

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
    NSLog(@"startview");
    // Do any additional setup after loading the view.
    FLAnimatedImage *loadingImg = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logoGIF" ofType:@"gif"]]];
    
    //background image setting
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"page2_bg.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
//    FLAnimatedImage *loadingImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://vikrambahl.com/wp-content/uploads/2014/06/ajax_loader_blue_512.gif"]]];
    
    //Assign the FLAnimatedImage types to each of the FLAnimatedImageViews via the animatedImage property
    self.loadingImageView.animatedImage = loadingImg;

    
    
    //Add the FLAnimatedImage view objects as subviews
    [self.view addSubview:self.loadingImageView ];
    
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = loadingImg;
    imageView.frame = CGRectMake(20, 100, 304, 250);
    [self.view addSubview:imageView];
    
    
//    [NSTimer scheduledTimerWithTimeInterval: 3.0
//                                     target: self
//                                   selector: @selector(startView)
//                                   userInfo: nil
//                                    repeats: NO];
    
    //facebook session check
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // session 확인
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            
            [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                             FBSessionState status,
                                                             NSError *error) {
                
                NSLog(@"                    session exist");
                [self notFacebookClicked];

            }];
        } else {
            NSLog(@"              no session");
            [self performSegueWithIdentifier:@"facebookLogin" sender:nil];
        }
        
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

    
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(goNext) userInfo:nil repeats:NO];
}

-(void) goNext
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSNumber *mode = [defaults objectForKey:@"AppMode"];
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %b", mode);
    
    if (mode != nil) {
        if ([mode boolValue]) { //수요자
            UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
            
            [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
        }
        else // 공급자
        {
            UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"pMainDetailViewNav00"];
            
            [MENU_VIEW_CONTROLLER presentCenterViewController:vc animated:YES];
        }
    }
    else
    {
        [self performSegueWithIdentifier:@"facebookLogin" sender:self];
    }
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

- (IBAction)notFacebookClicked{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTableViewControllerNav"];
    
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
