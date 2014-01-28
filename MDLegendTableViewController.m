//
//  MDLegendTableViewController.m
//  MDBarChart
//
//  Created by got2bex on 1/12/2014.
//  Copyright (c) 2014 MD. All rights reserved.
//  Inspired by https://developer.apple.com/library/ios/samplecode/TableViewUpdates/Introduction/Intro.html
//


#import "MDLegendTableViewController.h"
#import "MDConstants.h"
#import "MDLegendCell.h"
#import "MDSectionHeaderInfo.h"

@interface MDLegendTableViewController ()

@end

@implementation MDLegendTableViewController

@synthesize values;
@synthesize sectionsArray;
@synthesize sectionInfoArray;


#pragma mark - Initialization and configuration


-(BOOL)canBecomeFirstResponder {
    return YES;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [self.view setFrame:CGRectMake(530,100,200,700)];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    
    sectionsArray = [[NSMutableArray alloc] init];
    self.tableView.sectionHeaderHeight = kMDCellHeight;

    self.openSectionIndex = NSNotFound;
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setBounces:NO];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
	[super viewWillAppear:animated];

	if ((self.sectionInfoArray == nil) || ([self.sectionInfoArray count] != [self numberOfSectionsInTableView:self.tableView])) {
        
		NSMutableArray *infoArray = [[NSMutableArray alloc] init];

        NSArray* allKeys = [values objectForKey:kMDLabelKey];
        
		for (NSString *titleValue in allKeys) {
			MDSectionHeaderInfo *sectionInfo = [[MDSectionHeaderInfo alloc] init];
			sectionInfo.serieName = titleValue;
			sectionInfo.isOpened = NO;
            
            NSNumber *defaultRowHeight = [NSNumber numberWithInt:kMDCellHeight];
			for (NSInteger i = 0; i < [self numberOfRows]; i++) {
                [[sectionInfo rowHeights] insertObject:defaultRowHeight atIndex:i];
			}
            
			[infoArray addObject:sectionInfo];
		}
        
		self.sectionInfoArray = infoArray;
        
        NSLog(@"%@", [infoArray debugDescription]);
	}
    
    
    //self.tableView.backgroundColor = [UIColor redColor];
    
}


#pragma mark - Table view data source and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return [[values objectForKey:kMDLabelKey] count];
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
	MDSectionHeaderInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:section];

    if(sectionInfo.isOpened) {
        return [self numberOfRows];
    }
    return 0;
    
}


-(MDLegendCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    static NSString *serieIdentifier = @"SerieIdentifier";
    
    MDLegendCell* cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:serieIdentifier];
    if (cell == nil) {
        cell = [[MDLegendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:serieIdentifier] ;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %d", [[[values objectForKey:kMDSerieKey] objectAtIndex:indexPath.row] objectForKey:kMDSerieNameKey], [[[[[values objectForKey:kMDSerieKey] objectAtIndex:indexPath.row] objectForKey:kMDValueKey] objectAtIndex:indexPath.section] integerValue]];
    
    [cell setBorderColor:[[[values objectForKey:kMDSerieKey] objectAtIndex:indexPath.row] objectForKey:kMDColorKey]];
    
    return cell;
}


-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    
    MDLegendHeaderView *legendHeaderView = [[MDLegendHeaderView alloc] initWithFrame:CGRectMake(0, 0, 300, kMDCellHeight)];
    [sectionsArray addObject:legendHeaderView];
    
    MDSectionHeaderInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:section];
    
    legendHeaderView.customLabel.text = sectionInfo.serieName;
    
    legendHeaderView.section = section;
    legendHeaderView.delegate = self;
    sectionInfo.legendHeaderView = legendHeaderView;
    
    return legendHeaderView;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    return kMDCellHeight;
}


-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Section header delegate
//  Inspired by https://developer.apple.com/library/ios/samplecode/TableViewUpdates/Introduction/Intro.html
-(void)sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    
    NSLog(@"OPEN %d", sectionOpened);
    
	MDSectionHeaderInfo *sectionInfo = (self.sectionInfoArray)[sectionOpened];
    
    //enable arrow
    UITableViewCell* currentCell = [[self.delegateGraphLegend graphTableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sectionOpened inSection:0]];
    [currentCell setSelected:!sectionInfo.isOpened animated:YES];
    
    if(sectionInfo.isOpened) {
        [self sectionHeaderView:sectionHeaderView sectionClosed:sectionOpened];
        return;
    }
    
	sectionInfo.isOpened = YES;
    

    NSInteger countOfRowsToInsert = [self numberOfRows];
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }


    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
		MDSectionHeaderInfo *previousOpenSection = (self.sectionInfoArray)[previousOpenSectionIndex];
        previousOpenSection.isOpened = NO;
        NSInteger countOfRowsToDelete = [self numberOfRows];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
    }
    
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

    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    
    // Make sure the old arrow will disapear
    currentCell = [[self.delegateGraphLegend graphTableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.openSectionIndex inSection:0]];
    [currentCell setSelected:NO animated:YES];
    
    self.openSectionIndex = sectionOpened;
    
    [self.tableView scrollRectToVisible:CGRectMake(0, kMDCellHeight*sectionOpened, 300, kMDCellHeight*6) animated:YES];
    
}

//  Inspired by https://developer.apple.com/library/ios/samplecode/TableViewUpdates/Introduction/Intro.html
-(void)sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    
    NSLog(@"CLOSED %d", sectionClosed);

	MDSectionHeaderInfo *sectionInfo = (self.sectionInfoArray)[sectionClosed];

    //disable arrow
    UITableViewCell* currentCell = [[self.delegateGraphLegend graphTableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sectionClosed inSection:0]];
    [currentCell setSelected:!sectionInfo.isOpened animated:YES];
    
    if(!sectionInfo.isOpened) {
        [self sectionHeaderView:sectionHeaderView sectionOpened:sectionClosed];
        return;
    }
    
    
    sectionInfo.isOpened = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
    
}

-(NSUInteger) numberOfRows {
    return [[values objectForKey:kMDSerieKey] count];
}


@end
