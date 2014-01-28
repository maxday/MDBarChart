//
//  MDMainController.m
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDMainController.h"
#import "MDSampleDataViewController.h"
#import "MDConstants.h"

@interface MDMainController ()


@end

@implementation MDMainController

@synthesize scrollHostView;
@synthesize scrollHostViewLegend;
@synthesize tableGraph;
@synthesize tableLegend;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
	
    
    
    
    
    
    tableGraph = [[MDGraphTableViewController alloc] init];
    
    MDSampleDataViewController* vc = [[MDSampleDataViewController alloc] init];
    
    
    [tableGraph setData:[vc data]];
    tableGraph.delegate = self;
    
    
    
    tableLegend = [[MDLegendTableViewController alloc] init];
    [tableLegend setValues:[vc data]];
    tableLegend.delegate = self;
    tableLegend.delegateGraphLegend = self;

    
    
    [self.view addSubview:tableGraph.tableView];
    [self.view addSubview:tableLegend.tableView];
    

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView*) legendTableView {
    return tableLegend.tableView;
}

- (UITableView*) graphTableView {
    return tableGraph.tableView;
}

- (NSUInteger) openSectionIndex {
    return tableLegend.openSectionIndex;
}

- (void) sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section {
    NSLog(@"%d", section);
    return [tableLegend sectionHeaderView:sectionHeaderView sectionOpened:section];
}

- (void) sectionHeaderView:(MDLegendHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section {
    return [tableLegend sectionHeaderView:sectionHeaderView sectionClosed:section];
}

- (MDLegendHeaderView*) sectionHeaderAtIndex:(NSUInteger)index {
    return [tableLegend.sectionInfoArray objectAtIndex:index];
}

@end
