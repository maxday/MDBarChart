//
//  MDGraphTableViewController.m
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDGraphTableViewController.h"
#import "MDConstants.h"


@implementation MDGraphTableViewController

@synthesize data;
@synthesize max;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        max = NSNotFound;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(30,100,200,700)];
    
    [self.tableView setBackgroundColor:[UIColor brownColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setBounces:NO];
    self.tableView.backgroundColor = [UIColor redColor];
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
    return [[data objectForKey:kMDLabelKey] count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMDCellHeight;
}

- (MDCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int max_size_bar = 400;
    
    if(max == NSNotFound)
        max = [self computeMax];
    
    static NSString *CellIdentifier = @"Cell";
    
    NSArray* series = [data objectForKey:kMDSerieKey];
    
    MDCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MDCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setup:[series count]];
    }
    
    
    

    NSUInteger offset = 0;
    for(NSUInteger i=0; i<[series count]; ++i) {
        NSDictionary* current = [series objectAtIndex:i];
        NSUInteger value = [[[current objectForKey:kMDValueKey] objectAtIndex:indexPath.row] integerValue];
        NSUInteger scaledValue = max_size_bar*value/max;
        [cell setValue:scaledValue andColor:[current objectForKey:kMDColorKey] andOffset:offset forPoint:i];
        
        MDUIButton* currentView = [cell getButtonForPoint:i];
        [currentView setSerie:i andPoint:indexPath.row];
        [currentView addTarget:self action:@selector(clickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        offset += scaledValue;
    }
    
    
    [cell.title setText:[[data objectForKey:kMDLabelKey] objectAtIndex:indexPath.row]];

    NSLog(@"--- %@", cell.title.text);
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}

/*
-(NSUInteger) computeOffset:(NSUInteger) serie {
    NSUInteger computedOffset = 0;
    for(NSUInteger i=0; i<serie; ++i) {
        computedOffset+=[[[arrayOfSeries objectAtIndex:i] objectForKey:@"value"] integerValue];
    }
    return computedOffset;
}*/


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSelectRow:tableView andIndexPath:indexPath];
}





-(void) performSelectRow:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"SELECT = %d", indexPath.row);
    
    UITableView* tableLegendView = [self.delegate legendTableView];
    NSUInteger openSectionIndex = [self.delegate openSectionIndex];
    
    
    
    CGRect visibleRect = [tableLegendView convertRect:tableLegendView.bounds toView:self.view];
    
    [tableLegendView scrollRectToVisible:CGRectMake(0, kMDCellHeight*indexPath.row, 300, kMDCellHeight*5) animated:NO];
    
    if(openSectionIndex != indexPath.row)
        [self.delegate sectionHeaderView:[self.delegate sectionHeaderAtIndex:indexPath.row] sectionOpened:indexPath.row];
    else {
        
        [self.delegate sectionHeaderView:[self.delegate sectionHeaderAtIndex:indexPath.row] sectionClosed:indexPath.row];
        [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:NO];
    }
    
    
}

-(NSUInteger) computeMax {
    
    NSArray* series = [data objectForKey:kMDSerieKey];
    NSArray* labels = [data objectForKey:kMDLabelKey];
    
    NSUInteger currentMax = 0;
    NSUInteger realMax = 0;
    
    for(NSUInteger label=0; label<[labels count]; ++label) {
        currentMax = 0;
        for(NSUInteger serie=0; serie<[series count]; ++serie) {
            NSDictionary* current = [series objectAtIndex:serie];
            NSUInteger value = [[[current objectForKey:kMDValueKey] objectAtIndex:label] integerValue];
            currentMax += value;

        }
        if(currentMax > realMax) {
            realMax = currentMax;

        }
    }
    NSLog(@"REAL MAX = %d", realMax);
    return realMax;
}

-(void) clickHandler:(MDUIButton*) sender {
    NSLog(@"CLICK %d - %d", sender.serie, sender.point);

    NSIndexPath* builtIndexPath = [NSIndexPath indexPathForRow:sender.point inSection:0];
    
    MDCell* cellToSelect = (MDCell*) [self.tableView cellForRowAtIndexPath:builtIndexPath];
    NSLog(@"%@", cellToSelect.title.text);
    
    [cellToSelect setSelected:YES animated:YES];
   
    [self performSelectRow:self.tableView andIndexPath:builtIndexPath];

    
}




@end