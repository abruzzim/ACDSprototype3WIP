//
//  FormularyParentVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "FormularyParentVC.h"

@interface FormularyParentVC ()

@end

@implementation FormularyParentVC

- (void)viewDidLoad {
    NSLog(@"%%FormularyParentVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"Formulary Information";
    
    // Child 1 VC. -------------------------------------------------------------------------------------|
    //
    
    // Child 2 VC. -------------------------------------------------------------------------------------|
    //
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
