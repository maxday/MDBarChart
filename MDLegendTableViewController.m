//
//  MDLegendTableViewController.m
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//

#import "MDLegendTableViewController.h"
#import "APLSectionInfo.h"

@interface MDLegendTableViewController ()

@end

@implementation MDLegendTableViewController

#define DEFAULT_ROW_HEIGHT 48
#define HEADER_HEIGHT 48
#define NB_LEGEND 2

@synthesize values;
@synthesize stackViewController;
@synthesize sectionsArray;
@synthesize sectionInfoArray;
@synthesize sectionHeaderView;

#pragma mark - Initialization and configuration


-(BOOL)canBecomeFirstResponder {
    return YES;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    
    sectionsArray = [[NSMutableArray alloc] init];
    
    //NSLog(@"du coup %@", [[[self.plays objectAtIndex:0] quotations] debugDescription]);
    
    // Add a pinch gesture recognizer to the table view
    
    // Set up default values.
    self.tableView.sectionHeaderHeight = HEADER_HEIGHT;

    self.openSectionIndex = NSNotFound;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setBounces:NO];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
	[super viewWillAppear:animated];
    
    
    /*
     Check whether the section info array has been created, and if so whether the section count still matches the current section count. In general, you need to keep the section info synchronized with the rows and section. If you support editing in the table view, you need to appropriately update the section info during editing operations.
     */
    
	if ((self.sectionInfoArray == nil) || ([self.sectionInfoArray count] != [self numberOfSectionsInTableView:self.tableView])) {
        
        // For each play, set up a corresponding SectionInfo object to contain the default height for each row.
		NSMutableArray *infoArray = [[NSMutableArray alloc] init];
        
        NSArray* allKeys;
        /*
        TBMGraphMultiStackedViewController* gMSVC = (TBMGraphMultiStackedViewController*) stackViewController;
        
        if(gMSVC.specificAlphaOrder) {
            allKeys = [NSArray arrayWithArray:[[values allKeys] sortedArrayUsingFunction:cpSort context:NULL]];
        }
        else
            allKeys = [NSArray arrayWithArray:[[values allKeys] sortedArrayUsingFunction:intSort context:NULL]];
        */
        allKeys = [values allKeys];
		for (NSString *titleValue in allKeys) {
			APLSectionInfo *sectionInfo = [[APLSectionInfo alloc] init];
			sectionInfo.title = titleValue;
			sectionInfo.open = NO;
            
            NSNumber *defaultRowHeight = @(DEFAULT_ROW_HEIGHT);
			NSInteger countOfQuotations = NB_LEGEND;
			for (NSInteger i = 0; i < countOfQuotations; i++) {
				[sectionInfo insertObject:defaultRowHeight inRowHeightsAtIndex:i];
			}
            
			[infoArray addObject:sectionInfo];
		}
        
		self.sectionInfoArray = infoArray;
	}
}


#pragma mark - Table view data source and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    NSLog(@"%d", [values count]);
    return [values count];
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
	APLSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
	NSInteger numStoriesInSection = NB_LEGEND;
    return 2;
    return sectionInfo.open ? numStoriesInSection : 0;
}


-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    static NSString *QuoteCellIdentifier = @"QuoteCellIdentifier";
    
    UITableViewCell* cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:QuoteCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:QuoteCellIdentifier] ;
    }
    
    cell.textLabel.text = @"label";
    
    return cell;
}

/*
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    
    TBMPieHeaderSectionCell *sectionHeaderView = [[TBMPieHeaderSectionCell alloc] initWithFrame:CGRectMake(0,0,300,48)];
    [sectionsArray addObject:sectionHeaderView];
    APLSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
    
    
    
    //TBMPieChartViewController* pCC = (TBMPieChartViewController*) pieChartController;
    
    
    //NSNumber* valueToDisplay = [NSNumber numberWithFloat:[pCC pieChart:pCC.pieChartGraph valueForSliceAtIndex:section]];
    //[pCC.numberFormat stringFromNumber:valueToDisplay];
    
    //sectionHeaderView.customLabel.text = sectionInfo.title;
    //sectionHeaderView.deValue.text = [pCC.numberFormat stringFromNumber:valueToDisplay];
    
    
    [sectionHeaderView.leftBorder setBackgroundColor:[TBMSingleton colorFromString:[self computeKeyFromIndex:section]]];
    
    [sectionHeaderView.contentView setBackgroundColor:[UIColor whiteColor]];
    
    sectionHeaderView.section = section;
    sectionHeaderView.delegate = self;
    sectionInfo.headerView = sectionHeaderView;
    return sectionHeaderView;
}*/

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    
	APLSectionInfo *sectionInfo = (self.sectionInfoArray)[indexPath.section];
    return [[sectionInfo objectInRowHeightsAtIndex:indexPath.row] floatValue];
    // Alternatively, return rowHeight.
}


-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Section header delegate

-(void)sectionHeaderView:(TBMPieHeaderSectionCell*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    /*
	APLSectionInfo *sectionInfo = (self.sectionInfoArray)[sectionOpened];
    
    if(sectionInfo.open) {
        [self sectionHeaderView:sectionHeaderView sectionClosed:sectionOpened];
        return;
    }
    
	sectionInfo.open = YES;
    
    [self.delegate notifyChange:sectionOpened];
    
    TBMPieChartViewController* pCC = (TBMPieChartViewController*) pieChartController;
     [pCC deselectAll];
     [pCC.pieChartGraph setSliceSelectedAtIndex:sectionOpened];
     [pCC setSliceReady:sectionOpened];*/
    //pCC willSe
    
    /*
     Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
     
    NSInteger countOfRowsToInsert = NB_LEGEND;
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }

    
     Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
     */
    
    /*
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
        
		APLSectionInfo *previousOpenSection = (self.sectionInfoArray)[previousOpenSectionIndex];
        previousOpenSection.open = NO;
        [previousOpenSection.headerView toggleOpenWithUserAction:NO];
        NSInteger countOfRowsToDelete = NB_LEGEND;
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
    }
    
    // Style the animation so that there's a smooth flow in either direction.
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    // Apply the updates.
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    self.openSectionIndex = sectionOpened;
    
    [self.tableView scrollRectToVisible:CGRectMake(0, 46*sectionOpened, 300, 46*5) animated:YES];
     
     */
}


-(void)sectionHeaderView:(TBMPieHeaderSectionCell*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
	//APLSectionInfo *sectionInfo = (self.sectionInfoArray)[sectionClosed];
    
    /*TBMPieChartViewController* pCC = (TBMPieChartViewController*) pieChartController;
     [pCC deselectAll];
     */
    
    /*
    if(!sectionInfo.open) {
        [self sectionHeaderView:sectionHeaderView sectionOpened:sectionClosed];
        return;
    }
    
    
    sectionInfo.open = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
     */
}


-(NSString*) computeKeyFromIndex:(NSUInteger) index {
   /* TBMGraphMultiStackedViewController* gMSVC = (TBMGraphMultiStackedViewController*) stackViewController;
    if(gMSVC.specificAlphaOrder) {
        NSArray* sortedKeys = [NSArray arrayWithArray:[[values allKeys] sortedArrayUsingFunction:cpSort context:NULL]];
        return [sortedKeys objectAtIndex:index];
    }
    NSArray* sortedKeys = [NSArray arrayWithArray:[[values allKeys] sortedArrayUsingFunction:intSort context:NULL]];
    return [sortedKeys objectAtIndex:index];
    */
    return @"okok";
}



@end
