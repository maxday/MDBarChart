//
//  MDLegendCell.h
//  MDBarChart
//
//  Created by got2bex on 1/22/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDLegendCell : UITableViewCell

@property(nonatomic, retain) UIView* leftBorder;
@property(nonatomic, retain) UILabel* label;
@property(nonatomic, retain) UILabel* value;
@property(nonatomic, retain) UIImageView* pictureView;

-(void) setBorderColor:(UIColor *) color;

@end
