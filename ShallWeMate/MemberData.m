//
//  MemberData.m
//  ShallWeMate
//
//  Created by 컴038 on 8/17/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "MemberData.h"

@implementation MemberData

-(id) init
{
    self = [super init];
    if (self)
    {
        // superclass successfully initialized, further
        // initialization happens here ...
        NSLog(@"memeber data init");
        
        self.enableLifeStyle = [[NSMutableArray alloc]init];
        for (int i = 0; i<15; i++) {
            [self.enableLifeStyle addObject:[NSNumber numberWithBool:NO]];
        }
        
        self.enableHouseRoles = [[NSMutableArray alloc]init];
        for (int i=0; i<5; i++) {
            [self.enableHouseRoles addObject:[NSNumber numberWithBool:NO]];
        }
        
    }
    return self;
    
}

- (NSString *) printArray:(NSMutableArray *)array
{
    NSString *myStr = @"|";
    for (NSNumber *n in array) {
        NSString *s = [NSString stringWithFormat:@"%@ ",n];
        myStr = [myStr stringByAppendingString:s];
    }
    
    return myStr;
}

-(void) printAll
{
    NSLog(@"***************************************************");
    NSLog(@"***************************************************");
    NSLog(@"이름 : %@",self.name);
    NSLog(@"나이 : %@", self.age);
    NSLog(@"성별 : %@", self.sex);
    NSLog(@"직업 : %@", self.job);
    
    NSLog(@"----------------------------------------------------");
//    NSLog(@"연락처 : %@", self.introHouse);
    NSLog(@"가까운 지하철 : %@", self.nearSubwayStation);
    NSLog(@"최대 월세 : %@", self.monthlyRentCost);
    NSLog(@"최대 보증금", self.securityCost);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"희망 메이트 평균 나이 : %@", self.avgAge);
    NSLog(@"메이트 성별제한 : %@", self.allowsex);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"선택한 라이프 스타일 : %@", [self printArray:self.enableLifeStyle]);
    
    NSLog(@"----------------------------------------------------");
    NSLog(@"선택한 하우스 룰 : %@", [self printArray:self.enableHouseRoles]);
}

@end
