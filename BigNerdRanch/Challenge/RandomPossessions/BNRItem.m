//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Sean Timm on 6/15/12.
//  Copyright (c) 2012 Sean Timm. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (id)randomItem {
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
}

- (id)init {
    return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
}

- (void)dealloc {
    NSLog(@"Destroyed: %@", self);
}

- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    self = [super init];
    
    if (self) {
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (id)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber {
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (void)setItemName:(NSString *)str {
    itemName = str;
}

- (NSString *)itemName {
    return itemName;
}

- (void)setSerialNumber:(NSString *)str {
    serialNumber = str;
}

- (NSString *)serialNumber {
    return serialNumber;
}

- (void)setValueInDollars:(int)i {
    valueInDollars = i;
}

- (int)valueInDollars {
    return valueInDollars;
}

- (NSDate *)dateCreated {
    return dateCreated;
}

- (NSString *)description {
    NSString *descriptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
         itemName, serialNumber, valueInDollars, dateCreated];
    return descriptionString;
}

@end
