//
//  GuidelinesTVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/16/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "GuidelinesTVC.h"
#import "Guidelines.h"
#import "GuidelineParentVC.h"

#define UIColorFromHex(hexValue) \
[UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((hexValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface GuidelinesTVC ()

@property NSArray *guidelines;

@end

@implementation GuidelinesTVC

- (void)viewDidLoad {
    NSLog(@"%%GuidelinesTVC-I-TRACE, -viewDidLoad: called.");
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHex(0x32A664);
    self.title = @"Guidelines";
    self.guidelines = [Guidelines knownGuidelines];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%%GuidelinesTVC-I-TRACE, -numberOfSectionsInTableView: called.");
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%%GuidelinesTVC-I-TRACE, -tableView:numberOfRowsInSection: called.");
    // Return the number of rows in a section.
    return self.guidelines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%%GuidelinesTVC-I-TRACE, -tableView:cellForRowAtIndexPath: called.");
    
    // Configure the cell.
    //
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GuidelineCell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"GuidelineCell"];
    }
    
    // Set the cell's text label to the string representation of the treatment protocol object.
    //
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.guidelines[indexPath.row][@"title"];
    
    return cell;
}

#pragma mark - Manage selection

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%%GuidelinesTVC-I-TRACE, -tableView:didSelectRowAtIndexPath: called.");
    
    // Instantiate a GuidelineParentVC.
    //
    GuidelineParentVC *guidelineParentVC = [[GuidelineParentVC alloc] init];
    NSLog(@"%%GuidelinesTVC-I-TRACE, guidelineParentVC instantiated.");
    
    // Pass guideline data to parent view controller.
    //
    guidelineParentVC.guidelineDict = self.guidelines[indexPath.row];
    
    // Push the guidelineVC onto the ProtocolsTVC’s stack and update the display.
    //
    [self.navigationController pushViewController:guidelineParentVC animated:YES];
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
