//
//  MDGraphLegendDelegate.h
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDLegendHeaderView.h"

@protocol MDGraphLegendDelegate <NSObject>

@required
- (UITableView*) legendTableView;
- (UITableView*) graphTableView;
- (NSUInteger) openSectionIndex;
- (void)sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section;
- (void)sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section;
- (MDLegendHeaderView*) sectionHeaderAtIndex:(NSUInteger)index;


@end

