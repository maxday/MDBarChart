//
//  MDMainController.m
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDMainController.h"
#import "ViewController.h"

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
    
    
	
    
    scrollHostView = [[UIScrollView alloc] initWithFrame:CGRectMake(30,30,500,500)];
    [scrollHostView setContentSize:CGSizeMake(500, 1000)];
    
    
    scrollHostViewLegend = [[UIScrollView alloc] initWithFrame:CGRectMake(530,30,500,500)];
    [scrollHostViewLegend setContentSize:CGSizeMake(500, 1000)];
    
    
    
    tableGraph = [[MDGraphTableViewController alloc] init];
    
    ViewController* vc = [[ViewController alloc] init];
    
    [tableGraph setData:[vc data]];
    
    [self.scrollHostView addSubview:tableGraph.view];
    
    [self.view addSubview:scrollHostView];

    [self.view addSubview:scrollHostViewLegend];

    
    tableLegend = [[MDLegendTableViewController alloc] init];
    [tableLegend setValues:[vc data]];

    
    tableLegend.delegate = self;

    [self.scrollHostViewLegend addSubview:tableLegend.tableView];
    
    
    tableGraph.delegate = self;
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView*) legendTableView {
    return tableLegend.tableView;
}

- (NSUInteger) openSectionIndex {
    return tableLegend.openSectionIndex;
}

- (void) sectionHeaderView:(MDLegendCell*)sectionHeaderView sectionOpened:(NSInteger)section {
    NSLog(@"%d", section);
    return [tableLegend sectionHeaderView:sectionHeaderView sectionOpened:section];
}

- (void) sectionHeaderView:(MDLegendCell*)sectionHeaderView sectionClosed:(NSInteger)section {
    return [tableLegend sectionHeaderView:sectionHeaderView sectionClosed:section];
}

- (MDLegendCell*) sectionHeaderAtIndex:(NSUInteger)index {
    return [tableLegend.sectionInfoArray objectAtIndex:index];
}

@end
