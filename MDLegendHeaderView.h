//
//  MDLegendHeaderView.h
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionHeaderViewDelegate;
@interface MDLegendHeaderView : UITableViewHeaderFooterView

@property(nonatomic, retain) UIView* leftBorder;
@property(nonatomic, retain) UILabel* customLabel;

@property (nonatomic, retain) IBOutlet UIButton *disclosureButton;

@property (nonatomic, weak) IBOutlet id <SectionHeaderViewDelegate> delegate;
@property (nonatomic) NSInteger section;

-(void)toggleOpenWithUserAction:(BOOL)userAction;

@end


@protocol SectionHeaderViewDelegate <NSObject>

@optional
-(void)sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section;
-(void)sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section;

@end