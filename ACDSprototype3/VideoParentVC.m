//
//  VideoParentVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "VideoParentVC.h"

@interface VideoParentVC ()

@end

@implementation VideoParentVC

- (void)viewDidLoad {
    NSLog(@"%%VideoParentVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"Video Conference";
    
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
