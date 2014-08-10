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
    
//    [[_textView layer] setBorderColor:[[UIColor blackColor] CGColor]];
//    [[self view] addSubview:_textView];
    _textView.layer.borderColor = [[UIColor grayColor] CGColor];
    _textView.layer.borderWidth = 1.0;
    _textView.layer.cornerRadius = 8;
    
    //TextView
//    UITextView *textview =   [[UITextView alloc] initWithFrame:CGRectMake   (10, 40, 300, 160)];
    [_textView setBackgroundColor:[UIColor blackColor]];
    [_textView setFont:[UIFont boldSystemFontOfSize:14.0]];
    [_textView setTextAlignment:UITextAlignmentLeft];
    // For the border and rounded corners
    [[_textView layer] setBorderColor:[[UIColor colorWithRed:48/256.0 green:134/256.0 blue:174/256.0 alpha:1.0] CGColor]];
    [[_textView layer] setBorderWidth:2.3];
    [[_textView layer] setCornerRadius:10];
    [_textView setClipsToBounds: YES];
    [_textView setEditable:YES];
    
    //add Textview to the View
    [[self view] addSubview:_textView];
    
}

- (IBAction)registerButtonPressed:(id)sender {
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
