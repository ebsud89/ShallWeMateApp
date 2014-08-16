//
//  SWMHouse.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMHouse : NSObject

@property (strong, nonatomic) HouseData *housedata;

@property (strong, nonatomic) NSString *stationName;
// 인트로 바꿔...
@property int stationCode;
@property int rent;
@property int guaranty;
@property int management;

@property (strong, nonatomic) NSString *options;
@property (strong, nonatomic) NSString *infos;
@property (strong, nonatomic) NSString *rules;

@property int premium;
@property int total;
@property int avilable;

@end
