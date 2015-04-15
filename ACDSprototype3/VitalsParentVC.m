//
//  VitalsParentVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "VitalsParentVC.h"

@interface VitalsParentVC ()

@end

@implementation VitalsParentVC

- (void)viewDidLoad {
    NSLog(@"%%VitalsParentVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"Vitals";
    
    // Child 1 VC. -------------------------------------------------------------------------------------|
    //
    
    // Child 2 VC. -------------------------------------------------------------------------------------|
    //
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
