//
//  MakeDumpData.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "MakeDumpData.h"

@implementation MakeDumpData

-(NSMutableArray *)getHouseDataArray
{
    NSLog(@"Making Dump Data....");
    int count = 10;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i<count; i++) {
        HouseData *myHouseData = [[HouseData alloc]init];
        NSString *title = [[NSString alloc]initWithFormat:@"서울 쉐어하우스"];
        myHouseData.title = title;
        myHouseData.subTitle = @"쉐어하우스에 오신 것을 환영합니다!";
        myHouseData.price = i*10;
        [myHouseData makeRandomImages];
        [array addObject:myHouseData];
    }
    return array;
}

@end
