//
//  MDLegendCell.m
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import "MDLegendCell.h"

@implementation MDLegendCell

@synthesize leftBorder;
@synthesize customLabel;
@synthesize disclosureButton;
@synthesize deValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        leftBorder = [[UIView alloc] initWithFrame:CGRectMake(0,2,10,48)];
        customLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,5,300,35)];
        
        
        deValue = [[UILabel alloc] initWithFrame:CGRectMake(320,5,90,35)];
        [deValue setTextAlignment:NSTextAlignmentRight];
        [deValue setTextColor:[UIColor blueColor]];
        [deValue setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
        
        disclosureButton = [[UIButton alloc] initWithFrame:CGRectMake(200,0,10,10)];
        
        [self.disclosureButton setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];
        
        [self addSubview:leftBorder];
        [self addSubview:customLabel];
        [self addSubview:deValue];
        
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

-(IBAction)toggleOpen:(id)sender {
    [self toggleOpenWithUserAction:YES];
}


-(void)toggleOpenWithUserAction:(BOOL)userAction {
    
    // Toggle the disclosure button state.
    
    self.disclosureButton.selected = !self.disclosureButton.selected;
    
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (self.disclosureButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
