//
//  SWMRequestViewController.h
//  ShallWeMate
//
//  Created by 컴038 on 8/6/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMRequestViewController : UIViewController
{
    BOOL checkbox1Selected;
    BOOL checkbox2Selected;
    BOOL checkbox3Selected;
    BOOL checkbox4Selected;
}

@property (weak, nonatomic) IBOutlet UIButton *ck1;
@property (weak, nonatomic) IBOutlet UIButton *ch2;
@property (weak, nonatomic) IBOutlet UIButton *ch3;
@property (weak, nonatomic) IBOutlet UIButton *ck4;

- (IBAction)ckeckbox1pressed:(id)sender;
- (IBAction)ckeckbox2pressed:(id)sender;
- (IBAction)ckeckbox3pressed:(id)sender;
- (IBAction)ckeckbox4pressed:(id)sender;
- (IBAction)allCheckPressed:(id)sender;
- (IBAction)doneButtonpressed:(id)sender;

@end
