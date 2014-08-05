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
        for (int i = 0; i<8; i++) {
            [self.enableRoomsMore addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableOptions = [[NSMutableArray alloc]init];
        for (int i = 0; i<24; i++) {
            [self.enableOptions addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableLifeStyle = [[NSMutableArray alloc]init];
        for (int i = 0; i<24; i++) {
            [self.enableLifeStyle addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableHouseRoles = [[NSMutableArray alloc]init];
        for (int i=0; i<5; i++) {
            [self.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
        }
        
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

@end
