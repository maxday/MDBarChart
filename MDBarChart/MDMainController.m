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
@synthesize tableGraph;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        ViewController* vc = [[ViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
	
    
    scrollHostView = [[UIScrollView alloc] initWithFrame:CGRectMake(30,30,500,500)];
    [scrollHostView setContentSize:CGSizeMake(500, 1000)];
    
    
    tableGraph = [[MDGraphTableViewController alloc] init];
    [self.scrollHostView addSubview:tableGraph.view];
    
    [self.view addSubview:scrollHostView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
