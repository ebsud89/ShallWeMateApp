//
//  HouseData.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWMRoom.h"

@interface HouseData : NSObject

{
    NSString *str;
}
@property (retain) NSMutableArray *houseImageArray;

@property (retain) NSString *title;//
@property (retain) NSString *nearSubwayStation;
@property (strong, nonatomic) NSDictionary *subwayDic;
@property (retain) NSString *transportation;
@property (retain) NSString *transportationMinutes;
@property (retain) NSString *introHouse;
@property (retain) NSString *premium; // to int

@property (retain) NSString *monthlyRentCost;
@property (retain) NSString *securityCost;
@property (retain) NSString *managementCost;
@property (retain) NSMutableArray *enableManagementStates;

@property (retain) NSString *roomAll;
@property (retain) NSString *roomEmpty;
@property (retain) NSMutableArray *enableRoomsMore;

@property (retain) NSMutableArray *enableOptions;

@property (retain) NSString *avgAge;
@property (retain) NSString *existingMenNum;
@property (retain) NSString *existingWomenNum;
@property (retain) NSString *wantMenNum;
@property (retain) NSString *wantWomenNum;

@property (retain) NSMutableArray *enableLifeStyle;//

@property (retain) NSMutableArray *enableHouseRoles;//

@property (strong, nonatomic) NSNumber *likeIt;

////////////////////////////////////////////////////////////////
@property (retain) NSString *subTitle;
@property NSInteger livePeople;
@property NSInteger price;

-(void) makeRandomImages;

-(void) printAll;

- (NSString *) mergeArray:(NSMutableArray *)array;

- (SWMRoom *)exportToSWMRoom;

@end
