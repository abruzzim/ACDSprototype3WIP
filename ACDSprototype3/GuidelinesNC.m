//
//  GuidelinesNC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "GuidelinesNC.h"

@interface GuidelinesNC ()

@end

@implementation GuidelinesNC

- (void)viewDidLoad {
    NSLog(@"%%GuidelinesNC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    //self.title = @"Guidelines";
    //self.tabBarItem.image = [UIImage imageNamed:@"medical50"];
    self.toolbarHidden = NO;
    self.toolbar.translucent = YES;
    self.toolbar.barStyle = UIBarStyleDefault;
    
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%%GuidelinesNC-I-TRACE, -didReceiveMemoryWarning called.");
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
