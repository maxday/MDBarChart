//
//  MDCell.h
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDUIButton.h"

@interface MDCell : UITableViewCell

@property(nonatomic, retain) UILabel* title;
@property(nonatomic, retain) UIImageView* arrow;

@property(nonatomic, readwrite) NSUInteger numberOfSeries;
@property(nonatomic, retain) NSArray* arrayOfSeries;


-(void) setup:(NSUInteger) number;
-(void) setValue:(NSUInteger) value andColor:(UIColor*) color andOffset:(NSUInteger) offset forPoint:(NSUInteger) point;
-(MDUIButton*) getButtonForPoint:(NSUInteger) point;

@end
