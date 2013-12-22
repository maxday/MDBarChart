//
//  MDGraphTableViewController.m
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDGraphTableViewController.h"
#import "MDCell.h"

@implementation MDGraphTableViewController


- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0,0,700,700)];
    
    [self.tableView setBackgroundColor:[UIColor brownColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setBounces:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46;
}

- (MDCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    int numberOfSeries = 5;
    NSArray* colorsArray = [NSArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor greenColor], [UIColor purpleColor], nil];
    
    static NSString *CellIdentifier = @"Cell";
    MDCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MDCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setNumberOfSeries:numberOfSeries];
    }
    
    
    cell.title.text = @"coucou";
    
    for(NSUInteger i=0; i<numberOfSeries; ++i) {
        [cell setValue:(i+1)*40 andColor:[colorsArray objectAtIndex:i] forSerie:i];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
    
    [tableViewLegend.tableView scrollRectToVisible:CGRectMake(0, 46*indexPath.row, 300, 46*5) animated:NO];
    
    if(tableViewLegend.openSectionIndex != indexPath.row)
    [tableViewLegend sectionHeaderView:[tableViewLegend.sectionInfoArray objectAtIndex:indexPath.row] sectionOpened:indexPath.row];
    else {
        [tableViewLegend sectionHeaderView:[tableViewLegend.sectionInfoArray objectAtIndex:indexPath.row] sectionClosed:indexPath.row];
    }
    */
    
}



@end