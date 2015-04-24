//
//  TransportsParentVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "TransportsParentVC.h"
#import "TransportsMasterTVC.h"
#import "TransportDetailTVC.h"

#define CHILD1_WIDTH_FACTOR (1.0/3.0)
#define CHILD1_HEIGHT_FACTOR (1.0/1.0)
#define CHILD2_WIDTH_FACTOR (2.0/3.0)
#define CHILD2_HEIGHT_FACTOR (1.0/1.0)

#define UIColorFromHex(hexValue) \
[UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((hexValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface TransportsParentVC ()

@property CGFloat statusBarFrameSizeHeight;
@property CGFloat navBarFrameSizeHeight;
@property CGFloat toolBarFrameSizeHeight;
@property CGFloat tabBarFrameSizeHeight;
@property CGFloat totalUnusableWidth;
@property CGFloat totalUnusableHeight;
@property CGFloat topOffset;

@property (strong, nonatomic) TransportsMasterTVC *childVC1;
@property BOOL isChild1Visible;
@property (strong, nonatomic) TransportDetailTVC *childVC2;
@property BOOL isChild2Visible;

@end

@implementation TransportsParentVC

- (void)viewDidLoad {
    NSLog(@"%%TransportsParentVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHex(0xE2D2BF);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"Medical Transports";
    [self addToolbarItems];
    [self getFrameSizeHeights];
    [self getTopOffset];
    [self getUnusableDimensions];
    
    // Child 1 VC. -------------------------------------------------------------------------------------|
    //
    self.childVC1 = [[TransportsMasterTVC alloc] init];
    self.childVC1.view.frame =
        CGRectMake(
                   0,
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD1_HEIGHT_FACTOR)
                   );
    self.childVC1.view.backgroundColor = UIColorFromHex(0xBAA4DC);
    self.childVC1.tableView.layer.borderWidth = 1.0;
    self.childVC1.tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.isChild1Visible = YES;
    [self addChildViewController:self.childVC1];
    [self.view addSubview:self.childVC1.view];
    
    // Child 2 VC. -------------------------------------------------------------------------------------|
    //
    self.childVC2 = [[TransportDetailTVC alloc] init];
    self.childVC2.view.frame =
        CGRectMake(
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD2_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD2_HEIGHT_FACTOR)
                   );
    self.childVC2.view.backgroundColor = UIColorFromHex(0x6DA97A);
    self.childVC2.tableView.layer.borderWidth = 1.0;
    self.childVC2.tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.isChild2Visible = YES;
    [self addChildViewController:self.childVC2];
    [self.view addSubview:self.childVC2.view];
    
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%%TransportsParentVC-I-TRACE, -didReceiveMemoryWarning called.");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%%TransportsParentVC-I-TRACE, -viewWillLayoutSubviews called.");
    
    if (self.isChild1Visible) {
        self.childVC1.view.frame =
        CGRectMake(
                   0,
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD1_HEIGHT_FACTOR)
                   );
    }
    
    if (self.isChild2Visible) {
        self.childVC2.view.frame =
        CGRectMake(
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD2_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD2_HEIGHT_FACTOR)
                   );
    }
}

- (void)addToolbarItems {
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"Master Toggle"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton1:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"Detail Toggle"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton2:)];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                            target:self
                                                                            action:nil];
    
    NSArray *buttons = [NSArray arrayWithObjects:spacer, btn1, spacer, btn2, spacer, nil];
    
    self.toolbarItems = buttons;
}

- (void)doButton1:(UIButton *)sender {
    NSLog(@"%%TransportsParentVC-I-TRACE, -doButton1 called.");
    
    if (self.isChild1Visible) {
        
        CGPoint newCenter;
        
        // Shift the subview left by its longest dimension.
        //
        if (self.view.frame.size.height > self.view.frame.size.width) {
            // If the superview is in portrait orientation...
            
            if (self.childVC1.view.frame.size.height > self.childVC1.view.frame.size.width) {
                // ...and if the subview is higher than it is wide,
                // then shift the subview left by its height.
                newCenter = CGPointMake(self.childVC1.view.center.x - self.childVC1.view.frame.size.height,
                                        self.childVC1.view.center.y);
            } else {
                // ...and if the subview is wider than it is high,
                // then shift the subview left by its width.
                newCenter = CGPointMake(self.childVC1.view.center.x - self.childVC1.view.frame.size.width,
                                        self.childVC1.view.center.y);
            }
            
        } else {
            // Else if the superview is in landscape orientation...
            
            if (self.childVC1.view.frame.size.width > self.childVC1.view.frame.size.height) {
                // ...and if the subview is wider than it is high,
                // then shift the subview left by its width.
                newCenter = CGPointMake(self.childVC1.view.center.x - self.childVC1.view.frame.size.width,
                                        self.childVC1.view.center.y);
            } else {
                // ...and if the subview is higher than it is wide,
                // then shift the subview left by its height.
                newCenter = CGPointMake(self.childVC1.view.center.x - self.childVC1.view.frame.size.height,
                                        self.childVC1.view.center.y);
            }
            
        }
        
        [UIView animateWithDuration:0.3f animations:^{
            self.childVC1.view.center = newCenter;
        }];
        
    } else {
        
        CGRect newFrame;
        
        // Resize and shift the subview right to its originally assigned position.
        //
        newFrame =
        CGRectMake(
                   0,
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD1_HEIGHT_FACTOR)
                   );
        
        [UIView animateWithDuration:0.3f animations:^{
            self.childVC1.view.frame = newFrame;
        }];
        
    }
    
    self.isChild1Visible = !self.isChild1Visible;
    
}

- (void)doButton2:(UIButton *)sender {
    NSLog(@"%%TransportsParentVC-I-TRACE, -doButton2 called.");
    
    if (self.isChild2Visible) {
        
        CGPoint newCenter;
        
        // Shift the subview right by its longest dimension.
        //
        if (self.view.frame.size.height > self.view.frame.size.width) {
            // If the superview is in portrait orientation...
            
            if (self.childVC2.view.frame.size.height > self.childVC2.view.frame.size.width) {
                // ...and if the subview is higher than it is wide,
                // then shift the subview right by its height.
                newCenter = CGPointMake(self.childVC2.view.center.x + self.childVC2.view.frame.size.height,
                                        self.childVC2.view.center.y);
            } else {
                // ...and if the subview is wider than it is high,
                // then shift the subview right by its width.
                newCenter = CGPointMake(self.childVC2.view.center.x + self.childVC2.view.frame.size.width,
                                        self.childVC2.view.center.y);
            }
            
        } else {
            // Else if the superview is in landscape orientation...
            
            if (self.childVC2.view.frame.size.width > self.childVC2.view.frame.size.height) {
                // ...and if the subview is wider than it is high,
                // then shift the subview right by its width.
                newCenter = CGPointMake(self.childVC2.view.center.x + self.childVC2.view.frame.size.width,
                                        self.childVC2.view.center.y);
            } else {
                // ...and if the subview is higher than it is wide,
                // then shift the subview right by its height.
                newCenter = CGPointMake(self.childVC2.view.center.x + self.childVC2.view.frame.size.height,
                                        self.childVC2.view.center.y);
            }
            
        }
        
        [UIView animateWithDuration:0.3f animations:^{
            self.childVC2.view.center = newCenter;
        }];
        
    } else {
        
        CGRect newFrame;
        
        // Resize and shift the subview left to its originally assigned position.
        //
        newFrame =
        CGRectMake(
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD2_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD2_HEIGHT_FACTOR)
                   );
        
        [UIView animateWithDuration:0.3f animations:^{
            self.childVC2.view.frame = newFrame;
        }];
        
    }
    
    self.isChild2Visible = !self.isChild2Visible;
    
}

- (void)getFrameSizeHeights {
    NSLog(@"%%TransportsParentVC-I-TRACE, -getFrameSizeHeights called.");
    
    self.statusBarFrameSizeHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.navBarFrameSizeHeight = self.navigationController.navigationBar.frame.size.height;
    self.toolBarFrameSizeHeight = self.navigationController.toolbar.frame.size.height;
    self.tabBarFrameSizeHeight = self.tabBarController.tabBar.frame.size.height;
}

- (void)getTopOffset {
    NSLog(@"%%TransportsParentVC-I-TRACE, -getTopOffset called.");
    
    // Offset height from the top of the view.
    //
    self.topOffset = (
                      self.statusBarFrameSizeHeight +
                      self.navBarFrameSizeHeight
                      );
}

- (void)getUnusableDimensions {
    NSLog(@"%%TransportsParentVC-I-TRACE, -getUnusableDimensions called.");
    
    // Total unusable view dimensions.
    //
    self.totalUnusableWidth = (0);
    self.totalUnusableHeight = (
                                self.statusBarFrameSizeHeight +
                                self.navBarFrameSizeHeight +
                                self.toolBarFrameSizeHeight +
                                self.tabBarFrameSizeHeight
                                );
}

@end
