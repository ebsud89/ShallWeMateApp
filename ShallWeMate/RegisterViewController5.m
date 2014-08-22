//
//  RegisterViewController5.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController5.h"
#import "SWMSummeryViewController.h"
#import "SWMRegisterSummeryViewController.h"

@implementation RegisterViewController5


- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)nextButtonClicked:(id)sender {
    SWMRegisterSummeryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"inMatching"];
    [self fillMemberData];
        vc.memberData = self.memberData;
    //        [self.view addSubview:vc.view];
    NSLog(@"r5=============%@", self.memberData.name);
    [self.memberData printAll];
    [self.navigationController pushViewController: vc animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSLog(@"check %@", _memberData.name);
    [_memberData printAll];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    [_inviteOk setTag:0];
    [_inviteOk setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_inviteOk setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_inviteOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_inviteNo setTag:1];
    [_inviteNo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_inviteNo setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_inviteNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_petOk setTag:2];
    [_petOk setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_petOk setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_petOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_petNo setTag:3];
    [_petNo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_petNo setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_petNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_privacyMore setTag:4];
    [_privacyMore setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_privacyMore setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_privacyMore addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_privacyLess setTag:5];
    [_privacyLess setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_privacyLess setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_privacyLess addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_smokeOk setTag:6];
    [_smokeOk setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_smokeOk setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_smokeOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_smokeNo setTag:7];
    [_smokeNo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_smokeNo setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_smokeNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_drinkOk setTag:8];
    [_drinkOk setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_drinkOk setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_drinkOk addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_drinkNo setTag:9];
    [_drinkNo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_drinkNo setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_drinkNo addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    

}

-(void)radiobuttonSelected:(id)sender{
    switch ([sender tag]) {
        case 0:
            if([_inviteOk isSelected]==YES)
            {
                [_inviteOk setSelected:NO];
            }
            else{
                if([_inviteNo isSelected]==YES)
                {
                    [_inviteOk setSelected:YES];
                    [_inviteNo setSelected:NO];
                } else {
                    [_inviteOk setSelected:YES];
                }
            }
            
            break;
        case 1:
            
            if([_inviteNo isSelected]==YES)
            {
                [_inviteNo setSelected:NO];
            }
            else{
                if([_inviteOk isSelected]==YES)
                {
                    [_inviteNo setSelected:YES];
                    [_inviteOk setSelected:NO];
                } else {
                    [_inviteNo setSelected:YES];
                }
            }
            
            break;
        case 2:
            
            if([_petOk isSelected]==YES)
            {
                [_petOk setSelected:NO];
            }
            else{
                if([_petNo isSelected]==YES)
                {
                    [_petOk setSelected:YES];
                    [_petNo setSelected:NO];
                } else {
                    [_petOk setSelected:YES];
                }
            }
            
            break;
        case 3:
            if([_petNo isSelected]==YES)
            {
                [_petNo setSelected:NO];
            }
            else{
                if([_petOk isSelected]==YES)
                {
                    [_petNo setSelected:YES];
                    [_petOk setSelected:NO];
                } else {
                    [_petNo setSelected:YES];
                }
            }
            
            break;
        case 4:
            if([_privacyMore isSelected]==YES)
            {
                [_privacyMore setSelected:NO];
            }
            else{
                if([_privacyLess isSelected]==YES)
                {
                    [_privacyMore setSelected:YES];
                    [_privacyLess setSelected:NO];
                } else {
                    [_privacyMore setSelected:YES];
                }
            }
            
            break;
        case 5:
            
            if([_privacyLess isSelected]==YES)
            {
                [_privacyLess setSelected:NO];
            }
            else{
                if([_privacyMore isSelected]==YES)
                {
                    [_privacyLess setSelected:YES];
                    [_privacyMore setSelected:NO];
                } else {
                    [_privacyLess setSelected:YES];
                }
            }
            
            break;
        case 6:
            if([_smokeOk isSelected]==YES)
            {
                [_smokeOk setSelected:NO];
            }
            else{
                if([_smokeNo isSelected]==YES)
                {
                    [_smokeOk setSelected:YES];
                    [_smokeNo setSelected:NO];
                } else {
                    [_smokeOk setSelected:YES];
                }
            }
            
            break;
        case 7:
            if([_smokeNo isSelected]==YES)
            {
                [_smokeNo setSelected:NO];
            }
            else{
                if([_smokeOk isSelected]==YES)
                {
                    [_smokeNo setSelected:YES];
                    [_smokeOk setSelected:NO];
                } else {
                    [_smokeNo setSelected:YES];
                }
            }
            
            break;
        case 8:
            
            if([_drinkOk isSelected]==YES)
            {
                [_drinkOk setSelected:NO];
            }
            else{
                if([_drinkNo isSelected]==YES)
                {
                    [_drinkOk setSelected:YES];
                    [_drinkNo setSelected:NO];
                } else {
                    [_drinkOk setSelected:YES];
                }
            }
            
            break;
        case 9:
            if([_drinkNo isSelected]==YES)
            {
                [_drinkNo setSelected:NO];
            }
            else{
                if([_drinkOk isSelected]==YES)
                {
                    [_drinkNo setSelected:YES];
                    [_drinkOk setSelected:NO];
                } else {
                    [_drinkNo setSelected:YES];
                }
            }
            
            break;
        default:
            break;

    }
    
}

//- (IBAction)doneButtonClicked:(id)sender {
//    //요약 페이지로 이동
//    SWMRegisterSummeryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SWMRegisterSummeryViewController"];
//    [self fillMemeberData];
//    /* 기입한 정보를 다음 뷰로 전달*/
//    
//    vc.memberData = self.memberData;
//    [self.view addSubview:vc.view];
//    
//    if((_inviteOk.isSelected == YES || _inviteNo.isSelected == YES) && (_petOk.isSelected == YES || _petNo.isSelected == YES) && (_privacyMore.isSelected == YES || _privacyLess.isSelected == YES) && (_smokeOk.isSelected == YES || _smokeNo.isSelected == YES) && (_drinkOk.isSelected == YES || _drinkNo.isSelected == YES)) {
//        
//        
//        /* 하우스 룰 정보 저장하기 */
//        
////        self.houseData.enableHouseRoles = [[NSMutableArray alloc]init];
////        
////        if (_inviteOk.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:YES]];
////        else if (_inviteNo.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
////        if (_petOk.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:YES]];
////        else if (_petNo.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
////        if (_privacyMore.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:YES]];
////        else if (_privacyLess.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
////        if (_smokeOk.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:YES]];
////        else if (_smokeNo.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
////        if (_drinkOk.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:YES]];
////        else if (_drinkNo.isSelected == 1)
////            [self.houseData.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
//
//        
////        //요약 페이지로 이동
////        SWMSummeryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SWMSummeryViewController"];
////        
////        vc.memberData = memberData;
////        [self.view addSubview:vc.view];
//    } else {
//        NSLog(@"che2");
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"모두 선택해주세요."
//                                                        message:@"~~"
//                                                       delegate:self
//                                              cancelButtonTitle:@"돌아가기"
//                                              otherButtonTitles:nil];
//        [alert show];
//    }
//    
//}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self viewDidLoad];
    //[[self] popViewControllerAnimated:YES];
    //[[self navigationController] popViewControllerAnimated:YES];
    
}

- (void)fillMemberData
{
    NSNumber *num =[NSNumber numberWithBool:[self.inviteOk isSelected]];
    [self.memberData.enableHouseRoles replaceObjectAtIndex:0 withObject:num];
    
    NSNumber *num2 =[NSNumber numberWithBool:[self.petOk isSelected]];
    [self.memberData.enableHouseRoles replaceObjectAtIndex:1 withObject:num2];
    
    NSNumber *num3 =[NSNumber numberWithBool:[self.privacyMore isSelected]];
    [self.memberData.enableHouseRoles replaceObjectAtIndex:2 withObject:num3];
    
    NSNumber *num4 =[NSNumber numberWithBool:[self.smokeOk isSelected]];
    [self.memberData.enableHouseRoles replaceObjectAtIndex:3 withObject:num4];
    
    NSNumber *num5 =[NSNumber numberWithBool:[self.drinkOk isSelected]];
    [self.memberData.enableHouseRoles replaceObjectAtIndex:4 withObject:num5];
    
}

#pragma mark - Navigation


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        SWMRegisterSummeryViewController *vc = [segue destinationViewController];
        
        [self fillMemberData];
        /* 기입한 정보를 다음 뷰로 전달*/
        
        vc.memberData = _memberData;
        
        
    }
}

@end
