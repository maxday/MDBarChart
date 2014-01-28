//
//  MDSectionHeaderInfo.m
//  MDBarChart
//
//  Created by got2bex on 1/27/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import "MDSectionHeaderInfo.h"

@implementation MDSectionHeaderInfo

@synthesize isOpened;
@synthesize rowHeights;

- (id) init {
	self = [super init];
	if (self) {
		rowHeights = [[NSMutableArray alloc] init];
	}
	return self;
}


@end
