//
//  BirdsMasterViewController.h
//  BirdWatching
//
//  Created by Sean Timm on 6/15/12.
//  Copyright (c) 2012 Sean Timm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BirdSightingDataController;

@interface BirdsMasterViewController : UITableViewController
@property (nonatomic, strong) BirdSightingDataController *dataController;
@end
