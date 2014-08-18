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
@synthesize textView;



- (void)viewDidLoad {
    
    textView.text = @"질문을 입력해주세요.";
    textView.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000];
    textView.delegate = self;
    
    //cursor coloer
    [[UITextView appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000]];
    //    [[[self navigationController] navigationBar] setBackgroundColor:[UIColor colorWithRed:174/255.0 green:70/255.0 blue:115/255.0 alpha:10000]];
    
    //줄간격
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.headIndent = 0; // <--- indention if you need it
    style.firstLineHeadIndent = 0;
    style.lineSpacing = 2;
    _label.attributedText = [[NSAttributedString alloc]
                             initWithString:@"하우스 매니저에게 궁금한 점을 질문해주세요.\n질문 및 답변은 모두에게 공개됩니다."
                               attributes:@{NSParagraphStyleAttributeName : style}];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    textView.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000];
    return YES;
}


//-(void) textViewDidChange:(UITextView *)textView
//{
//    
//    if(textView.text.length == 0){
//        textView.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000];
//        textView.text = @"";
//        [textView resignFirstResponder];
//    }
//}

- (IBAction)doneButtonPressed:(id)sender {
//    SWMMainDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainDetaileView"];
//    /*
//     이 부분에서 질문 데이터 처리 해야함
//     */
//    [self.view addSubview:vc.view];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
   
    
}

- (IBAction)registerButtonPressed:(id)sender {
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
