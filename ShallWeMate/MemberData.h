//
//  MemberData.h
//  ShallWeMate
//
//  Created by 컴038 on 8/17/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWMMember.h"

@interface MemberData : NSObject
{
    NSString *str;
}

@property (retain) NSString *name;
@property (retain) NSString *age;
@property (retain) NSString *sex;//남자는 0 여자는 1
@property (retain) NSString *job;

//@property (retain) NSString *email;대
//@property (retain) NSString *phone ;//??

@property (retain) NSString *nearSubwayStation;
@property (strong, nonatomic) NSDictionary *subwayDic;
@property (retain) NSString *monthlyRentCost;
@property (retain) NSString *securityCost;
//@property (retain) NSString *managementCost;
//@property (retain) NSMutableArray *enableManagementStates;

//@property (retain) NSString *roomAll;
//@property (retain) NSString *roomEmpty;
//@property (retain) NSMutableArray *enableRoomsMore;

//@property (retain) NSMutableArray *enableOptions;

@property (retain) NSString *avgAge;
@property (retain) NSString *allowsex; //to int? 동성만0 혼성1

@property (retain) NSMutableArray *enableLifeStyle;

@property (retain) NSMutableArray *enableHouseRoles;

////////////////////////////////////////////////////////////////
//@property (retain) NSString *subTitle;
//@property NSInteger livePeople;
//@property NSInteger price;

//-(void) makeRandomImages;

-(void) printAll;

@end
