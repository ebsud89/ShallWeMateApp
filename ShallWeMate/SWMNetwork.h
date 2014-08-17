//
//  SWMNetwork.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMNetwork : NSObject

// Room
- (NSArray *) getAllRooms;

- (NSArray *) jsonToArray:(NSData *)inpData;
@end
