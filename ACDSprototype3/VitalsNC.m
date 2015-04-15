//
//  VitalsNC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "VitalsNC.h"

@interface VitalsNC ()

@end

@implementation VitalsNC

- (void)viewDidLoad {
    NSLog(@"%%VitalsNC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    //self.title = @"Vitals";
    //self.tabBarItem.image = [UIImage imageNamed:@""];
    self.toolbarHidden = NO;
    self.toolbar.translucent = YES;
    self.toolbar.barStyle = UIBarStyleDefault;
    
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%%VitalsNC-I-TRACE, -didReceiveMemoryWarning called.");
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
