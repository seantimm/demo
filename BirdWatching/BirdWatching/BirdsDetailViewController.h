//
//  BirdsDetailViewController.h
//  BirdWatching
//
//  Created by Sean Timm on 6/15/12.
//  Copyright (c) 2012 Sean Timm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BirdSighting;

@interface BirdsDetailViewController : UITableViewController
@property (nonatomic, strong) BirdSighting *sighting;
@property (nonatomic, weak) IBOutlet UILabel *birdNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@end
