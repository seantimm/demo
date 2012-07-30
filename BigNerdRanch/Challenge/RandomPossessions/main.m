//
//  main.m
//  RandomPossessions
//
//  Created by Sean Timm on 6/15/12.
//  Copyright (c) 2012 Sean Timm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        BNRContainer *container = [[BNRContainer alloc] initWithItemName:@"My Container" valueInDollars:20 serialNumber:@"None"];
        for (int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            [container addItem:p];
        }
        
        [container addItem:[[BNRContainer alloc] initWithItemName:@"Another One" valueInDollars:40 serialNumber:@"None"]];
        
        NSLog(@"%@", container);
        
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}

