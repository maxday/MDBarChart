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
    
        NSArray* arrayOfKeys = [[NSArray alloc] initWithObjects:@"value", @"color", nil];
        
        NSArray* serie1 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:10],
         [NSNumber numberWithInteger:15],
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:30], nil];
        
        UIColor* color1 = [UIColor redColor];
        
        NSDictionary* serieDictionary1 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie1, color1, nil] forKeys:arrayOfKeys];
        
        
        NSArray* serie2 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:10],
         [NSNumber numberWithInteger:50],
         [NSNumber numberWithInteger:5], nil];
        
        UIColor* color2 = [UIColor blueColor];
        
        NSDictionary* serieDictionary2 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie2, color2, nil] forKeys:arrayOfKeys];
        
        NSArray* serie3 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:25],
         [NSNumber numberWithInteger:5],
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:5], nil];
        
        UIColor* color3 = [UIColor yellowColor];
        
        NSDictionary* serieDictionary3 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie3, color3, nil] forKeys:arrayOfKeys];
        
        NSArray* serie4 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:30],
         [NSNumber numberWithInteger:40],
         [NSNumber numberWithInteger:5],
         [NSNumber numberWithInteger:10], nil];
        
        UIColor* color4 = [UIColor greenColor];
        
        NSDictionary* serieDictionary4 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie4, color4, nil] forKeys:arrayOfKeys];
        
        NSArray* serie5 = [NSArray arrayWithObjects:
         [NSNumber numberWithInteger:5],
         [NSNumber numberWithInteger:25],
         [NSNumber numberWithInteger:20],
         [NSNumber numberWithInteger:50], nil];
        
        UIColor* color5 = [UIColor purpleColor];
        
        NSDictionary* serieDictionary5 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie5, color5, nil] forKeys:arrayOfKeys];
        

        NSArray* series = [NSArray arrayWithObjects:serieDictionary1, serieDictionary2, serieDictionary3, serieDictionary4, serieDictionary5, nil];
        NSArray* labels = [NSArray arrayWithObjects:@"Spring", @"Summer", @"Fall", @"Winter", nil];
        
        data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:labels, series, nil] forKeys:[NSArray arrayWithObjects:@"labels", @"series", nil]];
        
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
