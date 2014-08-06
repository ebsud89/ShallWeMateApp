//
//  SWMAskViewController.m
//  ShallWeMate
//
//  Created by 컴038 on 8/6/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "SWMAskViewController.h"
#import "SWMMainDetailViewController.h"


@implementation SWMAskViewController

- (IBAction)doneButtonPressed:(id)sender {
    SWMMainDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainDetaileView"];
    /*
     이 부분에서 질문 데이터 처리 해야함
     */
    [self.view addSubview:vc.view];
    
    
}

- (IBAction)registerButtonPressed:(id)sender {
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
