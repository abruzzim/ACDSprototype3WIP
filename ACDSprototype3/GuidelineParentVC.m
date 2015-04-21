//
//  GuidelineParentVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/16/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "GuidelineParentVC.h"
#import "GuidelineFlowchartVC.h"
#import "GuidelineOutlineVC.h"
#import "GuidelineChecklistTVC.h"

#define CHILD1_WIDTH_FACTOR (1.0/1.0)
#define CHILD1_HEIGHT_FACTOR (1.0/1.0)
#define CHILD2_WIDTH_FACTOR (1.0/1.0)
#define CHILD2_HEIGHT_FACTOR (1.0/1.0)
#define CHILD3_WIDTH_FACTOR (1.0/2.0)
#define CHILD3_HEIGHT_FACTOR (1.0/1.0)

@interface GuidelineParentVC ()

@property CGFloat statusBarFrameSizeHeight;
@property CGFloat navBarFrameSizeHeight;
@property CGFloat toolBarFrameSizeHeight;
@property CGFloat tabBarFrameSizeHeight;
@property CGFloat totalUnusableWidth;
@property CGFloat totalUnusableHeight;
@property CGFloat topOffset;

@property (strong, nonatomic) GuidelineFlowchartVC *flowchartVC;
@property BOOL isFlowchartVisible;
@property (strong, nonatomic) GuidelineOutlineVC *outlineVC;
@property BOOL isOutlineVisible;
@property (strong, nonatomic) GuidelineChecklistTVC *checklistVC;
@property BOOL isChecklistVisible;

- (void)showViewProperties:(UIView *)aView;

@end

@implementation GuidelineParentVC

- (void)viewDidLoad {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    
    /**
     *  Parent VC Attributes.
     */
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = [self.guidelineDict[@"title"] stringByAppendingString:@" Protocol"];
    [self addToolbarItems];
    [self getFrameSizeHeights];
    [self getTopOffset];
    [self getUnusableDimensions];
    
    /**
     *  Center VC. (UIViewController - Flowchart)------------------------------------------------------------|
     */
    self.flowchartVC = [[GuidelineFlowchartVC alloc] init];
    self.flowchartVC.view.frame =
        CGRectMake(
                   0,
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD1_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD1_HEIGHT_FACTOR)
                   );
    self.flowchartVC.view.backgroundColor = [UIColor cyanColor];
    //
    // Instantiate and configure the scroll view.
    //
    self.flowchartVC.scrollView = [[UIScrollView alloc] initWithFrame:self.flowchartVC.view.bounds];
    self.flowchartVC.scrollView.contentSize = [self.guidelineDict[@"size"] CGSizeValue];
    self.flowchartVC.scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    //
    // Instantiate the image view.
    //
    self.flowchartVC.image = [[UIImageView alloc] initWithFrame:[self.guidelineDict[@"frame"] CGRectValue]];
    [self.flowchartVC.image setImage:[UIImage imageNamed:self.guidelineDict[@"filename"]]];
    //
    // Constrain the image to the center of the scroll view.
    //
    self.flowchartVC.image.translatesAutoresizingMaskIntoConstraints = NO;
    [self.flowchartVC.scrollView addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.flowchartVC.image
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.flowchartVC.scrollView
      attribute:NSLayoutAttributeCenterX
      multiplier:1
      constant:0]];
    //
    // Add image view to scroll view.
    //
    [self.flowchartVC.scrollView addSubview:self.flowchartVC.image];
    //
    // Add scroll view to flowchart view.
    //
    [self.flowchartVC.view addSubview:self.flowchartVC.scrollView];
    //
    // Add flowchart view to parent view.
    //
    [self.view addSubview:self.flowchartVC.view];
    //
    // Add child VC to parent VC.
    //
    [self addChildViewController:self.flowchartVC];
    self.isFlowchartVisible = YES;
    
    /**
     *  Left VC. (UIViewController - Outline)----------------------------------------------------------------|
     */
    self.outlineVC = [[GuidelineOutlineVC alloc] init];
    self.outlineVC.view.frame =
        CGRectMake(
                   -roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD2_WIDTH_FACTOR),
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD2_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD2_HEIGHT_FACTOR)
                   );
    self.outlineVC.view.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.outlineVC.view];
    [self addChildViewController:self.outlineVC];
    self.isOutlineVisible = NO;

    /**
     *  Right VC. (UITableViewController - Checklist)--------------------------------------------------------|
     */
    self.checklistVC = [[GuidelineChecklistTVC alloc] init];
    self.checklistVC.view.frame =
        CGRectMake(
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD3_WIDTH_FACTOR) * 2,
                   (_topOffset),
                   roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD3_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD3_HEIGHT_FACTOR)
                   );
    self.checklistVC.view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.checklistVC.view];
    [self addChildViewController:self.checklistVC];
    self.isChecklistVisible = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -viewWillLayoutSubviews called.");
    
    // If the Outline view is visible...
    if (self.isOutlineVisible) {
        //...then set its CGRect according to its size factor.
    } else {
        //...else translate its center.x left by half of its frame size width.
        CGPoint newCenter =
            CGPointMake(
                        0 - (self.outlineVC.view.frame.size.width / 2),
                        self.outlineVC.view.center.y
                        );
        [UIView animateWithDuration:0.3f animations:^{
            self.outlineVC.view.center = newCenter;
        }];
    }
    
    // If the Checklist view is visible...
    if (self.isChecklistVisible) {
        //...then set the frame rectangle according to the assigned values.
        self.checklistVC.view.frame =
            CGRectMake(
                       roundf((self.view.frame.size.width - (_totalUnusableWidth)) - ((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD3_WIDTH_FACTOR)),
                       (_topOffset),
                       roundf((self.view.frame.size.width - (_totalUnusableWidth)) * CHILD3_WIDTH_FACTOR),
                       roundf((self.view.frame.size.height - (_totalUnusableHeight)) * CHILD3_HEIGHT_FACTOR)
                       );
    } else {
        //...else translate its center.x right by half of its frame size width.
        CGPoint newCenter =
            CGPointMake(
                        (self.view.frame.size.width) + (self.checklistVC.view.frame.size.width / 2),
                        self.checklistVC.view.center.y
                        );
        [UIView animateWithDuration:0.3f animations:^{
            self.checklistVC.view.center = newCenter;
        }];
    }
}

- (void)addToolbarItems {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -addToolbarItems called.");
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"Text"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton1:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"Checklist"
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
    NSLog(@"%%GuidelineParentVC-I-TRACE, -doButton1 called.");
    
    CGPoint newCenter;
    // If the outline view is visible...
    if (self.isOutlineVisible) {
        // ...then shift the view's center.x left by its current width.
        newCenter = CGPointMake(
                                self.outlineVC.view.center.x - self.outlineVC.view.bounds.size.width,
                                self.outlineVC.view.center.y
                                );
    } else {
        // ...else shift the view's center.x right by its current width.
        newCenter = CGPointMake(
                                self.outlineVC.view.center.x + self.outlineVC.view.bounds.size.width,
                                self.outlineVC.view.center.y
                                );
    }
    [UIView animateWithDuration:0.3f animations:^{self.outlineVC.view.center = newCenter;}];
    self.isOutlineVisible = !self.isOutlineVisible;
}

- (void)doButton2:(UIButton *)sender {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -doButton2 called.");
    
    CGPoint newCenter;
    // If the checklist view is visible...
    if (self.isChecklistVisible) {
        //...then shift the view's center.x right by its current width.
        newCenter = CGPointMake(
                                self.checklistVC.view.center.x + self.checklistVC.view.bounds.size.width,
                                self.checklistVC.view.center.y
                                );
    } else {
        //...else shift the view's center.x left by its current width.
        newCenter = CGPointMake(
                                self.checklistVC.view.center.x - self.checklistVC.view.bounds.size.width,
                                self.checklistVC.view.center.y
                                );
    }
    [UIView animateWithDuration:0.3f animations:^{self.checklistVC.view.center = newCenter;}];
    self.isChecklistVisible = !self.isChecklistVisible;
}

- (void)getFrameSizeHeights {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -getFrameSizeHeights called.");
    
    self.statusBarFrameSizeHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.navBarFrameSizeHeight = self.navigationController.navigationBar.frame.size.height;
    self.toolBarFrameSizeHeight = self.navigationController.toolbar.frame.size.height;
    self.tabBarFrameSizeHeight = self.tabBarController.tabBar.frame.size.height;
}

- (void)getTopOffset {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -getTopOffset called.");
    
    // Offset height from the top of the view.
    //
    self.topOffset = (
                      self.statusBarFrameSizeHeight +
                      self.navBarFrameSizeHeight
                      );
}

- (void)getUnusableDimensions {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -getUnusableDimensions called.");
    
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

- (void)showViewProperties:(UIView *)aView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -showViewProperties: called.");
    
    // Super view properties.
    NSLog(@"super-view description: %@", aView.superview.description);
    NSLog(@"super-view alpha: %f", aView.superview.alpha);
    NSLog(@"super-view hidden: %@", aView.superview.hidden ? @"YES" : @"NO");
    NSLog(@"super-view opaque: %@", aView.superview.opaque ? @"YES" : @"NO");
    NSLog(@"super-view autoresizesSubview: %@", aView.superview.autoresizesSubviews ? @"YES" : @"NO");
    NSLog(@"super-view autoresizingMask: %lu", (long)aView.superview.autoresizingMask);
    NSLog(@"super-view contentMode: %lu", (long)aView.superview.contentMode);
    NSLog(@"super-view bounds origin x: %f", aView.superview.bounds.origin.x);
    NSLog(@"super-view bounds origin y: %f", aView.superview.bounds.origin.y);
    NSLog(@"super-view bounds size width: %f", aView.superview.bounds.size.width);
    NSLog(@"super-view bounds size height: %f", aView.superview.bounds.size.height);
    NSLog(@"super-view frame origin x: %f", aView.superview.frame.origin.x);
    NSLog(@"super-view frame origin y: %f", aView.superview.frame.origin.y);
    NSLog(@"super-view frame size width: %f", aView.superview.frame.size.width);
    NSLog(@"super-view frame size height: %f", aView.superview.frame.size.height);
    NSLog(@"super-view center x: %f", aView.superview.center.x);
    NSLog(@"super-view center y: %f", aView.superview.center.y);
    NSLog(@"super-view transform a: %f", aView.superview.transform.a);
    NSLog(@"super-view transform b: %f", aView.superview.transform.b);
    NSLog(@"super-view transform c: %f", aView.superview.transform.c);
    NSLog(@"super-view transform d: %f", aView.superview.transform.d);
    NSLog(@"super-view transform tx: %f", aView.superview.transform.tx);
    NSLog(@"super-view transform ty: %f", aView.superview.transform.ty);
    
    // Sub-view properties.
    NSLog(@"sub-view description: %@", aView.description);
    NSLog(@"sub-view alpha: %f", aView.alpha);
    NSLog(@"sub-view hidden: %@", aView.hidden ? @"YES" : @"NO");
    NSLog(@"sub-view opaque: %@", aView.opaque ? @"YES" : @"NO");
    NSLog(@"sub-view autoresizesSubview: %@", aView.autoresizesSubviews ? @"YES" : @"NO");
    NSLog(@"sub-view autoresizingMask: %lu", (long)aView.autoresizingMask);
    NSLog(@"sub-view contentMode: %lu", (long)aView.contentMode);
    NSLog(@"sub-view bounds origin x: %f", aView.bounds.origin.x);
    NSLog(@"sub-view bounds origin y: %f", aView.bounds.origin.y);
    NSLog(@"sub-view bounds size width: %f", aView.bounds.size.width);
    NSLog(@"sub-view bounds size height: %f", aView.bounds.size.height);
    NSLog(@"sub-view frame origin x: %f", aView.frame.origin.x);
    NSLog(@"sub-view frame origin y: %f", aView.frame.origin.y);
    NSLog(@"sub-view frame size width: %f", aView.frame.size.width);
    NSLog(@"sub-view frame size height: %f", aView.frame.size.height);
    NSLog(@"sub-view center x: %f", aView.center.x);
    NSLog(@"sub-view center y: %f", aView.center.y);
    NSLog(@"sub-view transform a: %f", aView.transform.a);
    NSLog(@"sub-view transform b: %f", aView.transform.b);
    NSLog(@"sub-view transform c: %f", aView.transform.c);
    NSLog(@"sub-view transform d: %f", aView.transform.d);
    NSLog(@"sub-view transform tx: %f", aView.transform.tx);
    NSLog(@"sub-view transform ty: %f", aView.transform.ty);
}

@end
