//
//  MDLegendCell.m
//  MDBarChart
//
//  Created by got2bex on 1/22/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import "MDLegendCell.h"
#import "MDConstants.h"

@implementation MDLegendCell

@synthesize leftBorder;
@synthesize label;
@synthesize value;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        leftBorder = [[UIView alloc] initWithFrame:CGRectMake(0,1,10,kMDCellHeight-2)];
    
        label = [[UILabel alloc] initWithFrame:CGRectMake(20,5,300,kMDCellHeight-2*5)];
        //  [customLabel setBackgroundColor:[UIColor greenColor]];
        
     
        
        
        value = [[UILabel alloc] initWithFrame:CGRectMake(320,5,90,35)];
        [value setTextAlignment:NSTextAlignmentRight];
        [value setTextColor:[UIColor blueColor]];
        [value setFont:[UIFont fontWithName:kMDFontName size:kMDFontSize]];
        [value setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:leftBorder];
        [self addSubview:label];
        [self addSubview:value];
        
        //self.tintColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void) setBorderColor:(UIColor *) color {
    [leftBorder setBackgroundColor:color];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
