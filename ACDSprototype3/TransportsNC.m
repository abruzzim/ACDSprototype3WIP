//
//  TransportsNC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "TransportsNC.h"

@interface TransportsNC ()

@end

@implementation TransportsNC

- (void)viewDidLoad {
    NSLog(@"%%TransportsNC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    //self.title = @"Transports";
    //self.tabBarItem.image = [UIImage imageNamed:@"medical52"];
    self.toolbarHidden = NO;
    self.toolbar.translucent = YES;
    self.toolbar.barStyle = UIBarStyleDefault;
    
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%%TransportsNC-I-TRACE, -didReceiveMemoryWarning called.");
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
