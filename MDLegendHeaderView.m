//
//  MDLegendHeaderView.m
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import "MDLegendHeaderView.h"
#import "MDConstants.h"

@implementation MDLegendHeaderView

@synthesize leftBorder;
@synthesize customLabel;
@synthesize disclosureButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        leftBorder = [[UIView alloc] initWithFrame:CGRectMake(0,1,10,kMDCellHeight-2)];
        [leftBorder setBackgroundColor:[UIColor blackColor]];
        customLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,5,300,kMDCellHeight-2*5)];
      //  [customLabel setBackgroundColor:[UIColor greenColor]];
        
  
        disclosureButton = [[UIButton alloc] initWithFrame:CGRectMake(200,0,10,10)];
        
        [self.disclosureButton setImage:[UIImage imageNamed:@"arrow-down"] forState:UIControlStateSelected];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];
        
        [self addSubview:leftBorder];
        [self addSubview:customLabel];
    
        
        //self.tintColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
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
