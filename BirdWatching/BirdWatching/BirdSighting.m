//
//  BirdSighting.m
//  BirdWatching
//
//  Created by Sean Timm on 6/15/12.
//  Copyright (c) 2012 Sean Timm. All rights reserved.
//

#import "BirdSighting.h"

@implementation BirdSighting
-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date {
    self = [super init];
    if(self) {
        _name = name;
        _location = location;
        _date = date;
        
        return self;
    }
    return nil;
}
@end
