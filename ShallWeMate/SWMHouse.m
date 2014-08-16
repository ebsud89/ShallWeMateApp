//
//  SWMHouse.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMHouse.h"

@implementation SWMHouse

- (void)setHousedata:(HouseData *)housedata
{
    NSMutableArray *optionArry = housedata.enableOptions;
    
    NSString *optionStr = @"";
    for (NSNumber *n in optionArry) {
        NSString *s = [NSString stringWithFormat:@"%@|",n];
        optionStr = [optionStr stringByAppendingString:s];
    }
    self.options = optionStr;
    
    NSMutableArray *rulesArr = housedata.enableHouseRoles;
    NSString *rulesStr = @"";
    for (NSNumber *n in rulesArr) {
        NSString *s = [NSString stringWithFormat:@"%@|",n];
        rulesStr = [rulesStr stringByAppendingString:s];
    }
    self.rules = rulesStr;
    
    NSMutableArray *infosArr = housedata.enableRoomsMore;
    NSString *infosStr = @"";
    for (NSNumber *n in infosArr) {
        NSString *s = [NSString stringWithFormat:@"%@|",n];
        infosStr = [infosStr stringByAppendingString:s];
    }
    self.infos = infosStr;
    
    self.rent = [housedata.monthlyRentCost intValue];
    self.guaranty = [housedata.securityCost intValue];
    self.management = [housedata.managementCost intValue];
    
    //    전철역코드,전철역명,호선,외부코드
    NSDictionary *subDic = housedata.subwayDic;
    self.stationName = [subDic objectForKey:@"전철역명"];
    self.stationCode = [[subDic objectForKey:@"전철역코드"] intValue];
    
//    self.stationCode
//    self.premium =
    self.total = [housedata.roomAll intValue];
    self.avilable = [housedata.roomEmpty intValue];
    
    
}

- (int)getStationCode
{
    return self.stationCode;
}

- (int)getRent
{
    return self.rent;
}

- (int)getGuaranty
{
    return self.guaranty;
}

- (int)getManagement
{
    return self.management;
}

- (int)getPremium
{
    return self.premium;
}

- (int)getTotal
{
    return self.total;
}

- (int)getAvilable
{
    return self.avilable;
}
@end
