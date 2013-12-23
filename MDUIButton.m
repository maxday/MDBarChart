//
//  MDUIButton.m
//  MDBarChart
//
//  Created by got2bex on 12/23/2013.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDUIButton.h"

@implementation MDUIButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setSerie:(NSUInteger) serie andPoint:(NSUInteger) point {
    self.serie = serie;
    self.point = point;
}

@end
