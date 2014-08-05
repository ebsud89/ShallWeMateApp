//
//  HouseData.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseData : NSObject

{
    NSString *str;
}
@property (retain) NSArray *houseImageArray;

@property (retain) NSString *title;
@property (retain) NSString *nearSubwayStation;
@property (retain) NSString *transportation;
@property (retain) NSString *transportationMinutes;
@property (retain) NSString *introHouse;
@property (retain) NSString *premium;

@property (retain) NSString *monthlyRentCost;
@property (retain) NSString *securityCost;
@property (retain) NSString *managementCost;
@property (retain) NSMutableArray *enableManagementStates;

@property (retain) NSString *roomAll;
@property (retain) NSString *roomEmpty;
@property (retain) NSMutableArray *enableRoomsMore;

@property (retain) NSMutableArray *enableOptions;

@property (retain) NSString *avgAge;
@property (readwrite) BOOL *enableDifferentGender;

@property (retain) NSMutableArray *enableLifeStyle;

@property (retain) NSMutableArray *enableHouseRoles;

////////////////////////////////////////////////////////////////
@property (retain) NSString *subTitle;
@property NSInteger livePeople;
@property NSInteger price;

-(void) makeRandomImages;

-(void) printAll;

@end
