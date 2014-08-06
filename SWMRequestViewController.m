//
//  SWMRequestViewController.m
//  ShallWeMate
//
//  Created by 컴038 on 8/6/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "SWMRequestViewController.h"

@implementation SWMRequestViewController

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
    [self.ck1 setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    [self.ck1 setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateSelected];
    [self.ck1 addTarget:self action:@selector(ckeckbox1pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.ch2 setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    [self.ch2 setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateSelected];
    [self.ch2 addTarget:self action:@selector(ckeckbox2pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.ch3 setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    [self.ch3 setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateSelected];
    [self.ch3 addTarget:self action:@selector(ckeckbox3pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.ck4 setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    [self.ck4 setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateSelected];
    [self.ck4 addTarget:self action:@selector(ckeckbox4pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    checkbox1Selected = 0;
    checkbox2Selected = 0;
    checkbox3Selected = 0;
    checkbox4Selected = 0;
    
    [self.view addSubview:self.ck1];
    [self.view addSubview:self.ch2];
    [self.view addSubview:self.ch3];
    [self.view addSubview:self.ck4];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([[segue identifier] isEqualToString:@"goNext"])
//    {
////        PSummeryViewController *vc = [segue destinationViewController];
////        vc.houseData = self.houseData;
//    }
//}

- (IBAction)ckeckbox1pressed:(id)sender {
    if (checkbox1Selected == 0){
		[self.ck1 setSelected:YES];
		checkbox1Selected = 1;
	} else {
		[self.ck1 setSelected:NO];
		checkbox1Selected = 0;
	}
}

- (IBAction)ckeckbox2pressed:(id)sender {
    if (checkbox2Selected == 0){
		[self.ch2 setSelected:YES];
		checkbox2Selected = 1;
	} else {
		[self.ch2 setSelected:NO];
		checkbox2Selected = 0;
	}
}

- (IBAction)ckeckbox3pressed:(id)sender {
    if (checkbox3Selected == 0){
		[self.ch3 setSelected:YES];
		checkbox3Selected = 1;
	} else {
		[self.ch3 setSelected:NO];
		checkbox3Selected = 0;
	}
}

- (IBAction)ckeckbox4pressed:(id)sender {
    if (checkbox4Selected == 0){
		[self.ck4 setSelected:YES];
		checkbox4Selected = 1;
	} else {
		[self.ck4 setSelected:NO];
		checkbox4Selected = 0;
	}
}

- (IBAction)allCheckPressed:(id)sender {
    
    [self.ck1 setSelected:YES];
    [self.ch2 setSelected:YES];
    [self.ch3 setSelected:YES];
    [self.ck4 setSelected:YES];
    checkbox1Selected = 1;
    checkbox2Selected = 1;
    checkbox3Selected = 1;
    checkbox4Selected = 1;
}
@end