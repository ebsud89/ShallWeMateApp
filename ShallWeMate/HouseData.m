//
//  HouseData.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "HouseData.h"

@implementation HouseData

@synthesize houseImageArray;

-(id) init
{
    self = [super init];
    if (self)
    {
        // superclass successfully initialized, further
        // initialization happens here ...
        NSLog(@"housedata init");
        
        self.enableManagementStates = [[NSMutableArray alloc]init];
        for (int i=0; i<8; i++) {
            [self.enableManagementStates addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableRoomsMore = [[NSMutableArray alloc]init];
        for (int i = 0; i<9; i++) {
            [self.enableRoomsMore addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableOptions = [[NSMutableArray alloc]init];
        for (int i = 0; i<12; i++) {
            [self.enableOptions addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableLifeStyle = [[NSMutableArray alloc]init];
        for (int i = 0; i<15; i++) {
            [self.enableLifeStyle addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableHouseRoles = [[NSMutableArray alloc]init];
        for (int i=0; i<5; i++) {
            [self.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.likeIt = [NSNumber numberWithDouble:NO];
        
    }
    return self;
    
}

-(void) printAll
{
    NSLog(@"***************************************************");
    NSLog(@"***************************************************");
    NSLog(@"제목 : %@",self.title);
    NSLog(@"가까운 지하철 역 : %@", self.nearSubwayStation);
    NSLog(@"걸어서 or 버스로 : %@", self.transportation);
    NSLog(@"지하철에서 내려서 몇분 : %@", self.transportationMinutes);
    NSLog(@"하우스 소개 : %@", self.introHouse);
    NSString *brand;
    if ([self.premium isEqual:@"1"]) {
        brand = @" ";
    } else if ([self.premium isEqual:@"2"]) {
        brand = @"WOOZOO";
    } else if ([self.premium isEqual:@"3"]) {
        brand = @"ZIBOONG";
    } else if ([self.premium isEqual:@"4"]) {
        brand = @"통의동집";
    } else if ([self.premium isEqual:@"5"]) {
        brand = @"한울";
    } else if ([self.premium isEqual:@"6"]) {
        brand = @"함께";
    } else if ([self.premium isEqual:@"7"]) {
        brand = @"언니네하우스";
    } else if ([self.premium isEqual:@"8"]) {
        brand = @"0ZONE";
    } else if ([self.premium isEqual:@"9"]) {
        brand = @"SUN&HOUSE";
    } else if ([self.premium isEqual:@"10"]) {
        brand = @"HABIZAE";
    }
    NSLog(@"프리미엄 브랜드 : %@", brand);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"월세 : %@", self.monthlyRentCost);
    NSLog(@"선택한 관리 물품 : %@", [self printArray:self.enableManagementStates]);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"전체 방 / 빈 방 : %@ / %@", self.roomAll, self.roomEmpty);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"평균 나이 : %@", self.avgAge);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"선택한 라이프 스타일 : %@", [self printArray:self.enableLifeStyle]);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"선택한 하우스 룰 : %@", [self printArray:self.enableHouseRoles]);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"남자, 여자: %@, %@", self.existingMenNum, self.existingWomenNum);
}

- (NSString *) printArray:(NSMutableArray *)array
{
    NSString *myStr = @" ";
    for (NSNumber *n in array) {
        NSString *s = [NSString stringWithFormat:@"%@ ",n];
        myStr = [myStr stringByAppendingString:s];
    }
    
    return myStr;
}

- (NSString *) mergeArray:(NSMutableArray *)array
{
    NSNumber *num = [array objectAtIndex:0];
    NSString *myStr = [NSString stringWithFormat:@"%@",num];
    
    for (int i = 1; i< [array count]; i++) {
        NSNumber *n = [array objectAtIndex:i];
        NSString *s = [NSString stringWithFormat:@"|%@",n];
        myStr = [myStr stringByAppendingString:s];
    }
    
    return myStr;
}

-(void) makeRandomImages
{
    houseImageArray = [[NSArray alloc]initWithObjects:
                       [UIImage imageNamed:@"testImg3.jpg"],
                       [UIImage imageNamed:@"testImg1.jpg"],
                       [UIImage imageNamed:@"testImg2.jpg"],
                       [UIImage imageNamed:@"testImg3.jpg"],
                       [UIImage imageNamed:@"testImg1.jpg"],
                       [UIImage imageNamed:@"testImg2.jpg"],
                       [UIImage imageNamed:@"testImg3.jpg"],
                       [UIImage imageNamed:@"testImg1.jpg"],
                       [UIImage imageNamed:@"testImg2.jpg"],nil];
    
    int count = (int)[houseImageArray count];
    NSLog(@"개수개수개수 : %d", count);
}

- (SWMRoom *)exportToSWMRoom
{
    
    SWMRoom *room = [[SWMRoom alloc]init];
    
    
//    room.rid;
    
    room.name = self.title;
    
//    room.hostid;
    
    
    
//    room.sid;
    
//    room.sname;
    
    room.rent = [self.monthlyRentCost intValue];
    
    room.guaranty = [self.securityCost intValue];
    
    room.management = [self.managementCost intValue];
    
    room.guarants =[self mergeArray:self.enableManagementStates];
    
    
    room.infos = [self mergeArray:self.enableRoomsMore];
    
    room.options = [self mergeArray:self.enableOptions];
    
    room.styles = [self mergeArray:self.enableLifeStyle];
    
    room.rules = [self mergeArray:self.enableHouseRoles];
    
    
    
    room.premium = [self.premium intValue];
    
    
    
    room.total = [self.roomAll intValue];
    
    room.available = [self.roomEmpty intValue];
    
//    room.wsex;
//    
//    room.msex;
    
    
    
    room.time = [self.transportationMinutes intValue];
    
    room.way = [self.transportation intValue];
    
    room.subwayStationName = [self.subwayDic objectForKey:@"전철역명"];
    
    room.subwayStationCode = [self.subwayDic objectForKey:@"전철역코드"];
    
    room.introHouse = self.introHouse;
    
    room.avgAge = [self.avgAge intValue];
    
    room.msex = [self.existingMenNum intValue];
    
    room.wsex = [self.existingWomenNum intValue];
    
    room.msexr = [self.wantMenNum intValue];
    
    room.wsexr = [self.wantWomenNum intValue];
    

    return room;
}

@end
