//
//  SWMRoom.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HouseData.h"

@interface SWMRoom : NSObject

@property int rid;
@property (strong, nonatomic) NSString *name;
@property int hostid;

@property int sid;
@property (strong, nonatomic) NSString *sname;
@property int rent;
@property int guaranty;
@property int management;

@property (strong, nonatomic) NSString *infos;
@property (strong, nonatomic) NSString *options;
@property (strong, nonatomic) NSString *styles;
@property (strong, nonatomic) NSString *rules;

@property int premium;

@property int total;
@property int available;
@property int wsex; //housedata 랑 안묶음...
@property int msex; //``

@property int time;
@property int way;

// 윤석 추가
@property (strong, nonatomic) NSString * subwayStationName;
@property (strong, nonatomic) NSString * subwayStationCode;
@property (strong, nonatomic) NSString * introHouse;

@property (strong, nonatomic) NSString * avgAge;
@property int existingMenNum;
@property int existingWomenNum;
@property int wantMenNum;
@property int wantWomenNum;


//added
@property int avaliable;
@property NSString *stationName;
@property float jaccard;
@property NSString *guarants;
@property NSString *stationCode;
@property int msexr;
@property int wsexr;
@property int premiumCode;


- (id) initWithDictionary : (NSDictionary *)inpDic;
- (NSString *) description;

-(id)exportToHouseData;
@end
