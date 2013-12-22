//
//  ViewController.m
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        
        NSArray* serie1 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:10],
         [NSNumber numberWithInteger:15],
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:30], nil];
        
        NSArray* serie2 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:10],
         [NSNumber numberWithInteger:50],
         [NSNumber numberWithInteger:5], nil];
        
        NSArray* serie3 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:25],
         [NSNumber numberWithInteger:5],
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:5], nil];
        
        NSArray* serie4 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:30],
         [NSNumber numberWithInteger:40],
         [NSNumber numberWithInteger:5],
         [NSNumber numberWithInteger:10], nil];
        
        NSArray* serie5 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:5],
         [NSNumber numberWithInteger:25],
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:50], nil];
        
        NSArray* serieNames = [NSArray arrayWithObjects:@"serie1", @"serie2", @"serie3", @"serie4", @"serie5", nil];
        NSArray* serieValues = [NSArray arrayWithObjects:serie1, serie2, serie3, serie4, serie5, nil];
       
        data = [NSDictionary dictionaryWithObjects:serieValues forKeys:serieNames];
        
        NSLog(@"%@", data);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}



@end
