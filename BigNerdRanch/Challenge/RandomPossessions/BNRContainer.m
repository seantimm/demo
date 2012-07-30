//
//  BNRContainer.m
//  RandomPossessions
//
//  Created by Sean Timm on 6/15/12.
//  Copyright (c) 2012 Sean Timm. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    if(self) {
        subItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addItem:(BNRItem *)item {
    [subItems addObject:item];
}

- (NSString*)description {
    int value = [self valueInDollars];
    for(BNRItem* item in subItems) {
        value += [item valueInDollars];
    }
    
    NSString *descriptionString = [[NSString alloc] initWithFormat:
                                   @"Container '%@' has a total value of $%d and contains the following items:\n",
                                   [self itemName],
                                   value];
    
    for(BNRItem* item in subItems) {
        descriptionString = [descriptionString stringByAppendingFormat:@"\t%@\n", item];
    }
    
    return descriptionString;
}

@end
