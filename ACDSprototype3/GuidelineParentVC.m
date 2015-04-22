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
#define CHILD3_WIDTH_FACTOR (1.0/3.0)
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

@property BOOL isDebugSet;

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
    self.isDebugSet = NO;
    
    /**
     *  Center VC. (UIViewController - Flowchart)------------------------------------------------------------|
     */
    self.flowchartVC = [[GuidelineFlowchartVC alloc] init];
    self.flowchartVC.view.frame =
        CGRectMake(
                   0,
                   _topOffset,
                   roundf((self.view.frame.size.width - _totalUnusableWidth) * CHILD1_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - _totalUnusableHeight) * CHILD1_HEIGHT_FACTOR)
                   );
    self.flowchartVC.view.backgroundColor = [UIColor cyanColor];
    //
    // Instantiate and configure the scroll view.
    //
    self.flowchartVC.scrollView = [[UIScrollView alloc] initWithFrame:self.flowchartVC.view.bounds];
    self.flowchartVC.scrollView.contentSize = [self.guidelineDict[@"size"] CGSizeValue];
    self.flowchartVC.scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                                    UIViewAutoresizingFlexibleHeight);
    //
    // Instantiate the image view.
    //
    self.flowchartVC.image = [[UIImageView alloc] initWithFrame:[self.guidelineDict[@"frame"] CGRectValue]];
    [self.flowchartVC.image setImage:[UIImage imageNamed:self.guidelineDict[@"filename"]]];
    //
    // Add image view to scroll view.
    //
    [self.flowchartVC.scrollView addSubview:self.flowchartVC.image];
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
    //
    // Set view visibility flag.
    //
    self.isFlowchartVisible = YES;
    
    /**
     *  Left VC. (UIViewController - Outline)----------------------------------------------------------------|
     */
    self.outlineVC = [[GuidelineOutlineVC alloc] init];
    self.outlineVC.view.frame =
        CGRectMake(
                   -roundf((self.view.frame.size.width - _totalUnusableWidth) * CHILD2_WIDTH_FACTOR),
                   _topOffset,
                   roundf((self.view.frame.size.width - _totalUnusableWidth) * CHILD2_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - _totalUnusableHeight) * CHILD2_HEIGHT_FACTOR)
                   );
    
    if (self.isDebugSet) {
        // Check position and size properties.
        [self showViewCenterProperties:self.outlineVC.view];
        [self showViewFrameProperties:self.outlineVC.view];
        [self showViewBoundsProperties:self.outlineVC.view];
    }
    
    self.outlineVC.view.backgroundColor = [UIColor magentaColor];
    //
    // Instantiate the web view and size to outline view.
    //
    //self.outlineVC.webView = [[UIWebView alloc] initWithFrame:self.outlineVC.view.bounds];
    self.outlineVC.webView = [[UIWebView alloc] init];
    //
    // Return the NSBundle object that corresponds to the directory where the application
    // executable is located, or nil if a bundle object could not be created.
    //
    NSBundle *mainBundle = [NSBundle mainBundle];
    //
    // Return the file URL for the resource identified by the specified name and file extension
    // or nil if the file cannot be located.
    //
    NSURL *localURL = [mainBundle URLForResource:self.guidelineDict[@"html"] withExtension:@"html"];
    //
    // Create and return a URL request for the specified URL with a default cache policy of
    // NSURLRequestUseProtocolCachePolicy and a default timeout interval of 60 seconds.
    //
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:localURL];
    //
    // Connect to tehe given URL by initiating an asynchronous client request.
    //
    [self.outlineVC.webView loadRequest:urlRequest];
    //
    // Add web view to outline view.
    //
    [self.outlineVC.view addSubview:self.outlineVC.webView];
    //
    // Constrain the web view to the outline view.
    //
    self.outlineVC.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.outlineVC.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.outlineVC.webView
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:self.outlineVC.view
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:0]];
    [self.outlineVC.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.outlineVC.webView
      attribute:NSLayoutAttributeBottom
      relatedBy:NSLayoutRelationEqual
      toItem:self.outlineVC.view
      attribute:NSLayoutAttributeBottom
      multiplier:1
      constant:0]];
    [self.outlineVC.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.outlineVC.webView
      attribute:NSLayoutAttributeLeft
      relatedBy:NSLayoutRelationEqual
      toItem:self.outlineVC.view
      attribute:NSLayoutAttributeLeft
      multiplier:1
      constant:0]];
    [self.outlineVC.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.outlineVC.webView
      attribute:NSLayoutAttributeRight
      relatedBy:NSLayoutRelationEqual
      toItem:self.outlineVC.view
      attribute:NSLayoutAttributeRight
      multiplier:1
      constant:0]];
    //
    // Add outline view to parent view
    //
    [self.view addSubview:self.outlineVC.view];
    //
    // Add outline VC to parent VC.
    //
    [self addChildViewController:self.outlineVC];
    //
    // Set view visibility flag.
    //
    self.isOutlineVisible = NO;

    /**
     *  Right VC. (UITableViewController - Checklist)--------------------------------------------------------|
     */
    self.checklistVC = [[GuidelineChecklistTVC alloc] init];
    self.checklistVC.view.frame =
        CGRectMake(
                   roundf(self.view.frame.size.width - _totalUnusableWidth),
                   _topOffset,
                   roundf((self.view.frame.size.width - _totalUnusableWidth) * CHILD3_WIDTH_FACTOR),
                   roundf((self.view.frame.size.height - _totalUnusableHeight) * CHILD3_HEIGHT_FACTOR)
                   );
    
    if (self.isDebugSet) {
        // Check position and size properties.
        [self showViewCenterProperties:self.checklistVC.view];
        [self showViewFrameProperties:self.checklistVC.view];
        [self showViewBoundsProperties:self.checklistVC.view];
    }
    
    self.checklistVC.tasks = self.guidelineDict[@"checklist"];
    self.checklistVC.view.backgroundColor = [UIColor clearColor];
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
        //...then ?.
    } else {
        //...else translate its center.x left by half of its frame size width.
        self.outlineVC.view.center =
            CGPointMake(
                        0 - (self.outlineVC.view.frame.size.width / 2.0),
                        self.outlineVC.view.center.y
                        );
    }
    
    // If the Checklist view is visible...
    if (self.isChecklistVisible) {
        //...then set the frame rectangle according to its size factors
        //   and on-screen position.
        self.checklistVC.view.frame =
            CGRectMake(
                       roundf(self.view.frame.size.width - _totalUnusableWidth
                              - ((self.view.frame.size.width - _totalUnusableWidth) * CHILD3_WIDTH_FACTOR)),
                       _topOffset,
                       roundf((self.view.frame.size.width - _totalUnusableWidth) * CHILD3_WIDTH_FACTOR),
                       roundf((self.view.frame.size.height - _totalUnusableHeight) * CHILD3_HEIGHT_FACTOR)
                       );
    } else {
        //...else set the frame rectangle according to its size factors
        //   off-screen position.
        self.checklistVC.view.frame =
            CGRectMake(
                       roundf(self.view.frame.size.width - _totalUnusableWidth),
                       _topOffset,
                       roundf((self.view.frame.size.width - _totalUnusableWidth) * CHILD3_WIDTH_FACTOR),
                       roundf((self.view.frame.size.height - _totalUnusableHeight) * CHILD3_HEIGHT_FACTOR)
                       );
    }
}

- (void)addToolbarItems {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -addToolbarItems called.");
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"Text"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton1:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"Flowchart"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton2:)];
    
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc] initWithTitle:@"Checklist"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doButton3:)];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                            target:self
                                                                            action:nil];
    
    NSArray *buttons = [NSArray arrayWithObjects:spacer, btn1, spacer, btn2, spacer, btn3, spacer, nil];
    
    self.toolbarItems = buttons;
}

- (void)doButton1:(UIButton *)sender {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -doButton1 called.");
    
    [self toggleOutlineView];
}

- (void)doButton2:(UIButton *)sender {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -doButton2 called.");
    
    if (self.isChecklistVisible) {[self toggleChecklistView];}
    if (self.isOutlineVisible) {[self toggleOutlineView];}
    
}

- (void)doButton3:(UIButton *)sender {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -doButton3 called.");
    
    [self toggleChecklistView];
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

- (void)toggleOutlineView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -toggleOutlineView called.");
    
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

- (void)toggleChecklistView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -toggleChecklistView called.");
    
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

- (void)showViewFrameProperties:(UIView *)aView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -showViewFrameProperties: called.");
    
    NSLog(@"view frame origin x: %f", aView.frame.origin.x);
    NSLog(@"view frame origin y: %f", aView.frame.origin.y);
    NSLog(@"view frame size width: %f", aView.frame.size.width);
    NSLog(@"view frame size height: %f", aView.frame.size.height);
}

- (void)showViewBoundsProperties:(UIView *)aView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -showViewBoundsProperties: called.");

    NSLog(@"view bounds origin x: %f", aView.bounds.origin.x);
    NSLog(@"view bounds origin y: %f", aView.bounds.origin.y);
    NSLog(@"view bounds size width: %f", aView.bounds.size.width);
    NSLog(@"view bounds size height: %f", aView.bounds.size.height);
}

- (void)showViewCenterProperties:(UIView *)aView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -showViewCenterProperties: called.");

    NSLog(@"view center x: %f", aView.center.x);
    NSLog(@"view center y: %f", aView.center.y);
}

- (void)showViewTransformProperties:(UIView *)aView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -showViewTransformProperties: called.");
    
    NSLog(@"sub-view transform a: %f", aView.transform.a);
    NSLog(@"sub-view transform b: %f", aView.transform.b);
    NSLog(@"sub-view transform c: %f", aView.transform.c);
    NSLog(@"sub-view transform d: %f", aView.transform.d);
    NSLog(@"sub-view transform tx: %f", aView.transform.tx);
    NSLog(@"sub-view transform ty: %f", aView.transform.ty);
}

- (void)showViewSelectProperties:(UIView *)aView {
    NSLog(@"%%GuidelineParentVC-I-TRACE, -showViewSelectProperties: called.");
    
    NSLog(@"sub-view description: %@", aView.description);
    NSLog(@"sub-view alpha: %f", aView.alpha);
    NSLog(@"sub-view hidden: %@", aView.hidden ? @"YES" : @"NO");
    NSLog(@"sub-view opaque: %@", aView.opaque ? @"YES" : @"NO");
    NSLog(@"sub-view autoresizesSubview: %@", aView.autoresizesSubviews ? @"YES" : @"NO");
    NSLog(@"sub-view autoresizingMask: %lu", (long)aView.autoresizingMask);
    NSLog(@"sub-view contentMode: %lu", (long)aView.contentMode);
}

@end
