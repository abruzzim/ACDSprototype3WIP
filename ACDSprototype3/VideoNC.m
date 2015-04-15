//
//  VideoNC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "VideoNC.h"

@interface VideoNC ()

@end

@implementation VideoNC

- (void)viewDidLoad {
    NSLog(@"%%VideoNC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    //self.title = @"Video";
    //self.tabBarItem.image = [UIImage imageNamed:@""];
    self.toolbarHidden = NO;
    self.toolbar.translucent = YES;
    self.toolbar.barStyle = UIBarStyleDefault;
    
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%%VideoNC-I-TRACE, -didReceiveMemoryWarning called.");
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
