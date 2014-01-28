//
//  MDSectionHeaderInfo.h
//  MDBarChart
//
//  Created by got2bex on 1/27/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDLegendHeaderView;

@interface MDSectionHeaderInfo : NSObject

@property (nonatomic, readwrite)    BOOL isOpened;
@property (nonatomic, retain)       NSString* serieName;
@property (nonatomic, retain)       MDLegendHeaderView* legendHeaderView;
@property (nonatomic, retain)       NSMutableArray *rowHeights;


@end
