//
//  MDCell.m
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDCell.h"


@implementation MDCell

@synthesize title;
@synthesize arrow;
@synthesize arrayOfSeries;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setBackgroundColor:[UIColor grayColor]];
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 160, 46)];
        title.numberOfLines = 2;
        [title setBackgroundColor:[UIColor clearColor]];
        [title setFont:[UIFont fontWithName:@"Arial" size:16]];
        title.textAlignment = NSTextAlignmentLeft;

        arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"carat"]];
        [arrow setCenter:CGPointMake(2,23)];
        [arrow setHidden:YES];
        [self addSubview:arrow];
        
        [self addSubview:title];
        
        
    }
    return self;
}

-(void) setup:(NSUInteger) number {

    
    NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithCapacity:number];
    for(NSUInteger i=0; i<number; ++i) {
        
        UIView* singleSerieView = [[UIView alloc] init];
        NSNumber* singleSerieValue = [NSNumber numberWithInteger:0];
        
        NSMutableDictionary* singleSerieDictionary = [[NSMutableDictionary alloc] init];
        
        [singleSerieDictionary setObject:singleSerieView forKey:@"view"];
        [singleSerieDictionary setObject:singleSerieValue forKey:@"value"];
        
        [tmpArray addObject:singleSerieDictionary];
        [self addSubview:singleSerieView];
    }

    arrayOfSeries = [NSArray arrayWithArray:tmpArray];
    
}


-(NSUInteger) computeOffset:(NSUInteger) serie {
    NSUInteger computedOffset = 0;
    for(NSUInteger i=0; i<serie; ++i) {
        computedOffset+=[[[arrayOfSeries objectAtIndex:i] objectForKey:@"value"] integerValue];
    }
    return computedOffset;
}


-(void) setValue:(NSUInteger) value andColor:(UIColor*) color forSerie:(NSUInteger) serie {
    
    float max = 50;
    
    NSMutableDictionary* currentDictionary = [arrayOfSeries objectAtIndex:serie];
    UIView* currentView = [currentDictionary objectForKey:@"view"];
    NSNumber* currentValue = [NSNumber numberWithInteger:value];
    [currentDictionary setObject:currentValue forKey:@"value"];
    
    [currentView setBackgroundColor:color];
    [currentView setFrame:CGRectMake(100+[self computeOffset:serie],3, (max/value), 40)];
    
    
    NSLog(@"frame %f %f %f %f", currentView.frame.origin.x, currentView.frame.origin.y, currentView.frame.size.width, currentView.frame.size.height);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    [arrow setHidden:!selected];
    
    // Configure the view for the selected state
}

@end
