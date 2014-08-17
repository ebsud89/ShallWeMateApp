//
//  SWMCodeList.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMCodeList : NSObject

- (NSDictionary *) retStyles;
- (NSDictionary *) retInfos;
- (NSDictionary *) retOptions;
- (NSDictionary *) retGuarants;

- (id) initWithDictionary : (NSDictionary *) inpDic;
- (NSString *) description;

@end
