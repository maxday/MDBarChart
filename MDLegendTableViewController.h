//
//  MDLegendTableViewController.h
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDLegendCell.h"

@interface MDLegendTableViewController : UITableViewController <SectionHeaderViewDelegate>

@property(nonatomic, retain) NSDictionary *values;
@property(nonatomic, retain) NSMutableIndexSet *expandedSections;
@property(nonatomic, readwrite) NSUInteger expandedSection;
@property(nonatomic, retain) UIViewController *stackViewController;
@property (nonatomic) NSMutableArray* sectionInfoArray;
@property (nonatomic) NSInteger openSectionIndex;
@property(nonatomic, retain) NSMutableArray *sectionsArray;
@property (nonatomic, weak) id delegate;

@property (nonatomic) IBOutlet MDLegendCell *sectionHeaderView;

@end

