//
//  ViewController.m
//  MDBarChart
//
//  Created by Maxime David on 2013-09-01.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import "MDSampleDataViewController.h"
#import "MDConstants.h"

@interface MDSampleDataViewController ()

@end

@implementation MDSampleDataViewController

@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        NSArray* arrayOfKeys = [[NSArray alloc] initWithObjects:kMDValueKey, kMDColorKey, kMDSerieNameKey, nil];
        
        NSArray* serie1 = [NSArray arrayWithObjects:
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50], nil];
        
        UIColor* color1 = [UIColor redColor];
        NSString* serieName1 = @"Apple";
        
        NSDictionary* serieDictionary1 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie1, color1, serieName1, nil] forKeys:arrayOfKeys];
        
        
        NSArray* serie2 = [NSArray arrayWithObjects:
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50], nil];
        
        UIColor* color2 = [UIColor blueColor];
        NSString* serieName2 = @"Banana";
        
        NSDictionary* serieDictionary2 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie2, color2, serieName2, nil] forKeys:arrayOfKeys];
        
        NSArray* serie3 = [NSArray arrayWithObjects:
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50], nil];
        
        UIColor* color3 = [UIColor yellowColor];
        NSString* serieName3 = @"Grapes";
        
        NSDictionary* serieDictionary3 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie3, color3, serieName3, nil] forKeys:arrayOfKeys];
        
        NSArray* serie4 = [NSArray arrayWithObjects:
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50], nil];
        
        UIColor* color4 = [UIColor greenColor];
        NSString* serieName4 = @"Apricot";
        
        NSDictionary* serieDictionary4 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie4, color4, serieName4, nil] forKeys:arrayOfKeys];
        
        NSArray* serie5 = [NSArray arrayWithObjects:
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50],
                           [self generateNumber:50], nil];
        
        UIColor* color5 = [UIColor purpleColor];
        NSString* serieName5 = @"Strawberry";
        
        NSDictionary* serieDictionary5 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:serie5, color5, serieName5, nil] forKeys:arrayOfKeys];
        

        NSArray* series = [NSArray arrayWithObjects:serieDictionary1, serieDictionary2, serieDictionary3, serieDictionary4, serieDictionary5, nil];
        NSArray* labels = [NSArray arrayWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
        
        data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:labels, series, nil] forKeys:[NSArray arrayWithObjects:kMDLabelKey, kMDSerieKey, nil]];
        
        NSLog(@"%@", data);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(NSNumber*)generateNumber:(NSUInteger) max {
    return [NSNumber numberWithInt:(arc4random()%max)+1];
}


@end
