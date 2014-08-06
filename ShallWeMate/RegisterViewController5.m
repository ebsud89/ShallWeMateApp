//
//  RegisterViewController5.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController5.h"

@implementation RegisterViewController5
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_inviteOk setTag:0];
    [_inviteOk setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_inviteOk setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_inviteOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_inviteNo setTag:1];
    [_inviteNo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_inviteNo setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_inviteNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_petOk setTag:2];
    [_petOk setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_petOk setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_petOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_petNo setTag:3];
    [_petNo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_petNo setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_petNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_privacyMore setTag:4];
    [_privacyMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_privacyMore setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_privacyMore addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_privacyLess setTag:5];
    [_privacyLess setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_privacyLess setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_privacyLess addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_smokeOk setTag:6];
    [_smokeOk setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_smokeOk setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_smokeOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_smokeNo setTag:7];
    [_smokeNo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_smokeNo setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_smokeNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_drinkOk setTag:8];
    [_drinkOk setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_drinkOk setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_drinkOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_drinkNo setTag:9];
    [_drinkNo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_drinkNo setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
    [_drinkNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)radiobuttonSelected:(id)sender{
    switch ([sender tag]) {
        case 0:
            if([_inviteOk isSelected]==YES)
            {
                [_inviteOk setSelected:NO];
                [_inviteNo setSelected:YES];
            }
            else{
                [_inviteOk setSelected:YES];
                [_inviteNo setSelected:NO];
            }
            
            break;
        case 1:
            if([_inviteNo isSelected]==YES)
            {
                [_inviteNo setSelected:NO];
                [_inviteOk setSelected:YES];
            }
            else{
                [_inviteNo setSelected:YES];
                [_inviteOk setSelected:NO];
            }
            
            break;
        case 2:
            if([_petOk isSelected]==YES)
            {
                [_petOk setSelected:NO];
                [_petNo setSelected:YES];
            }
            else{
                [_petOk setSelected:YES];
                [_petNo setSelected:NO];
            }
            
            break;
        case 3:
            if([_petNo isSelected]==YES)
            {
                [_petNo setSelected:NO];
                [_petOk setSelected:YES];
            }
            else{
                [_petNo setSelected:YES];
                [_petOk setSelected:NO];
            }
            
            break;
        case 4:
            if([_privacyMore isSelected]==YES)
            {
                [_privacyMore setSelected:NO];
                [_privacyLess setSelected:YES];
            }
            else{
                [_privacyMore setSelected:YES];
                [_privacyLess setSelected:NO];
            }
            
            break;
        case 5:
            if([_privacyLess isSelected]==YES)
            {
                [_privacyLess setSelected:NO];
                [_privacyMore setSelected:YES];
            }
            else{
                [_privacyLess setSelected:YES];
                [_privacyMore setSelected:NO];
            }
            
            break;
        case 6:
            if([_smokeOk isSelected]==YES)
            {
                [_smokeOk setSelected:NO];
                [_smokeNo setSelected:YES];
            }
            else{
                [_smokeOk setSelected:YES];
                [_smokeNo setSelected:NO];
            }
            
            break;
        case 7:
            if([_smokeNo isSelected]==YES)
            {
                [_smokeNo setSelected:NO];
                [_smokeOk setSelected:YES];
            }
            else{
                [_smokeNo setSelected:YES];
                [_smokeOk setSelected:NO];
            }
            
            break;
        case 8:
            if([_drinkOk isSelected]==YES)
            {
                [_drinkOk setSelected:NO];
                [_drinkNo setSelected:YES];
            }
            else{
                [_drinkOk setSelected:YES];
                [_drinkNo setSelected:NO];
            }
            
            break;
        case 9:
            if([_drinkNo isSelected]==YES)
            {
                [_drinkNo setSelected:NO];
                [_drinkOk setSelected:YES];
            }
            else{
                [_drinkNo setSelected:YES];
                [_drinkOk setSelected:NO];
            }
            
            break;
        default:
            break;
    }
    
}

@end
