//
//  MDGraphLegendDelegate.h
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDLegendCell.h"

@protocol MDGraphLegendDelegate <NSObject>

@required
- (UITableView*) legendTableView;
- (NSUInteger) openSectionIndex;
- (void)sectionHeaderView:(MDLegendCell*)sectionHeaderView sectionOpened:(NSInteger)section;
- (void)sectionHeaderView:(MDLegendCell*)sectionHeaderView sectionClosed:(NSInteger)section;
- (MDLegendCell*) sectionHeaderAtIndex:(NSUInteger)index;


@end

