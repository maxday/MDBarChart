//
//  MDGraphTableViewController.h
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDGraphLegendDelegate.h"
#import "MDCell.h"

@interface MDGraphTableViewController : UITableViewController

@property(nonatomic, retain) NSDictionary* data;
@property(nonatomic, readwrite) NSUInteger max;
@property(nonatomic, retain) MDCell* lastCellSelected;

@property(nonatomic, weak) id<MDGraphLegendDelegate> delegate;

@end
