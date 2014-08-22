//
//  SWMRoom.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMRoom.h"

@implementation SWMRoom

- (id) initWithDictionary : (NSDictionary *)inpDic {

    self = [self init];
    
    if (self != nil) {
        if (inpDic) {
            [self setValuesForKeysWithDictionary:inpDic];
        }
    }
    
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key

{
    
    NSLog(@"undefined key : %@",key);
    
    return  nil;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key

{
    
    NSLog(@"undefined key : %@",key);
    
}


- (NSString *) description {
    return [NSString stringWithFormat:@"{\"rid\":\"%d\", \"name\":\"%@\", \"rent\":\"%d\", \"guaranty\":\"%d\", \"guarants\":\"%@\", \"management\":\"%d\", \"infos\":\"%@\", \"options\":\"%@\", \"styles\":\"%@\", \"rules\":\"%@\", \"premium\":\"%d\", \"total\":\"%d\", \"available\":\"%d\", \"time\":\"%d\", \"way\":\"%d\", \"station\":\"%@\", \"subwayStationCode\":\"%@\", \"intro\":\"%@\", \"avgAge\":\"%d\", \"msex\":\"%d\", \"wsex\":\"%d\", \"msexr\":\"%d\", \"wsexr\":\"%d\"} ", _rid, _name, _rent, _guaranty, _guarants, _management, _infos, _options, _styles, _rules, _premium, _total, _available, _time, _way, _subwayStationName, _subwayStationCode, _introHouse, _avgAge, _msex, _wsex, _msexr, _wsexr];
}


- (HouseData *)exportToHouseData
{
    
    HouseData *houseData = [[HouseData alloc]init];
    
    
    houseData.title = self.name;
    
//    room.rent = [self.monthlyRentCost intValue];
    houseData.monthlyRentCost = [NSString stringWithFormat:@"%d",self.rent];
//    room.guaranty = [self.securityCost intValue];
    houseData.securityCost = [NSString stringWithFormat:@"%d", self.guaranty];
//    room.management = [self.managementCost intValue];
    houseData.managementCost = [NSString stringWithFormat:@"%d", self.management];
    
    
//    room.infos = [self mergeArray:self.enableRoomsMore];
    NSArray *itemArray = [self.infos componentsSeparatedByString:@"|"];
    houseData.enableRoomsMore = [[NSMutableArray alloc]initWithArray:itemArray];
//    room.options = [self mergeArray:self.enableOptions];
    itemArray = [self.options componentsSeparatedByString:@"|"];
    houseData.enableOptions = [[NSMutableArray alloc]initWithArray:itemArray];
//    room.styles = [self mergeArray:self.enableLifeStyle];
    itemArray = [self.styles componentsSeparatedByString:@"|"];
    houseData.enableLifeStyle = [[NSMutableArray alloc]initWithArray:itemArray];
//    room.rules = [self mergeArray:self.enableHouseRoles];
    itemArray = [self.styles componentsSeparatedByString:@"|"];
    houseData.enableHouseRoles = [[NSMutableArray alloc]initWithArray:itemArray];
    
    
//    room.premium = [self.premium intValue];
    houseData.premium = [NSString stringWithFormat:@"%d",self.premium];
    
    
//    room.total = [self.roomAll intValue];
    houseData.roomAll = [NSString stringWithFormat:@"%d",self.total];
    
//    room.available = [self.roomEmpty intValue];
    houseData.roomEmpty = [NSString stringWithFormat:@"%d", self.available];
    //    room.wsex;
    //
    //    room.msex;
    
    
    
//    room.time = [self.transportationMinutes intValue];
    houseData.transportationMinutes = [NSString stringWithFormat:@"%d", self.time];
//    room.way = [self.transportation intValue];
    houseData.transportation = [NSString stringWithFormat:@"%d", self.way];
//    room.subwayStationName = [self.subwayDic objectForKey:@"전철역명"];
    houseData.subwayDic = [[NSMutableDictionary alloc]init];
    [houseData.subwayDic setValue:self.subwayStationName forKey:@"전철역명"];
//    room.subwayStationCode = [self.subwayDic objectForKey:@"전철역코드"];
    [houseData.subwayDic setValue:self.subwayStationCode forKey:@"전철역코드"];
//    room.introHouse = self.introHouse;
    houseData.introHouse = self.introHouse;
//    room.avgAge = [self.avgAge intValue];
    houseData.avgAge = [NSString stringWithFormat:@"%d",self.avgAge];
//    room.existingMenNum = [self.existingMenNum intValue];
    houseData.existingMenNum = [NSString stringWithFormat:@"%d", self.existingMenNum];
//    room.existingWomenNum = [self.existingWomenNum intValue];
    houseData.existingWomenNum = [NSString stringWithFormat:@"%d",self.existingWomenNum];
//    room.wantMenNum = [self.wantMenNum intValue];
    houseData.wantMenNum = [NSString stringWithFormat:@"%d",self.wantMenNum];
//    room.wantWomenNum = [self.wantWomenNum intValue];
    houseData.wantWomenNum = [NSString stringWithFormat:@"%d", self.wantWomenNum];
    houseData.premium = [NSString stringWithFormat:@"%d", self.premium];
    return houseData;
}

//
//-(NSString *)description
//
//{
//    
//    NSString *desc = @"";
//    
//    for (NSString *key in [PropertyUtil propertyNames:[self class]]) {
//        
//        desc = [desc stringByAppendingFormat:@"%@ : %@ ,",key,[self valueForKey:key]];
//        
//    }
//    
//    return desc;
//    
//}
//
//+ (NSArray *) propertyNames: (Class) class
//
//{
//    
//    NSMutableArray *propertyNames = [[NSMutableArray alloc] init];
//    
//    unsigned int propertyCount = 0;
//    
//    objc_property_t *properties = class_copyPropertyList(class, &propertyCount);
//    
//    
//    
//    for (unsigned int i = 0; i < propertyCount; ++i) {
//        
//        objc_property_t property = properties[i];
//        
//        const char * name = property_getName(property);
//        
//        [propertyNames addObject:[NSString stringWithUTF8String:name]];
//        
//    }
//    
//    
//    
//    return [propertyNames copy];
//    
//}

@end
