//
//  MDMainController.h
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDGraphTableViewController.h"

@interface MDMainController : UIViewController


@property (nonatomic, retain) UIScrollView* scrollHostView;
@property (nonatomic, retain) MDGraphTableViewController* tableGraph;
@end
