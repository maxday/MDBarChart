//
//  MDUIButton.h
//  MDBarChart
//
//  Created by got2bex on 12/23/2013.
//  Copyright (c) 2013 MD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDUIButton : UIButton

@property (nonatomic, readwrite) NSUInteger point;
@property (nonatomic, readwrite) NSUInteger serie;

-(void) setSerie:(NSUInteger) serie andPoint:(NSUInteger) point;
@end
