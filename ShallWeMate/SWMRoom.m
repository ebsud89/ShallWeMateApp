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
    return [NSString stringWithFormat:@"{\"rid\":\"%d\", \"name\":\"%@\", \"rent\":\"%d\", \"guaranty\":\"%d\", \"management\":\"%d\", \"infos\":\"%@\", \"options\":\"%@\", \"styles\":\"%@\", \"rules\":\"%@\", \"premium\":\"%d\", \"total\":\"%d\", \"available\":\"%d\" , \"wsex\":\"%d\", \"msex\":\"%d\", \"time\":\"%d\", \"way\":\"%d\" ", _rid, _name, _rent, _guaranty, _management, _infos, _options, _styles, _rules, _premium, _total, _available, _wsex, _msex, _time, _way];
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
