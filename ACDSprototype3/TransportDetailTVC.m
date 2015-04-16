//
//  TransportDetailTVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/15/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "TransportDetailTVC.h"
#import "Details.h"

@interface TransportDetailTVC ()

@property NSArray *details;

@end

@implementation TransportDetailTVC

- (void)viewDidLoad {
    NSLog(@"%%TransportDetailTVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    self.details = [Details knownFakeDetails];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%%TransportDetailTVC-I-TRACE, -didReceiveMemoryWarning called.");

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%%TransportDetailTVC-I-TRACE, -numberOfSectionsInTableView: called.");
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%%TransportDetailTVC-I-TRACE, -tableView:numberOfRowsInSection: called.");
    
    // Return the number of rows in the section.
    return self.details.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%%TransportDetailTVC-I-TRACE, -tableView:cellForRowAtIndexPath: called.");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransportDetailCell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"TransportDetailCell"];
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:
                           @"Flt: %@  From: %@ -> To: %@",
                           [self.details objectAtIndex:indexPath.row][@"tag"],
                           [self.details objectAtIndex:indexPath.row][@"sending"],
                           [self.details objectAtIndex:indexPath.row][@"receiving"]
                           ];
    cell.detailTextLabel.text = [NSString stringWithFormat:
                                 @"Weight(kg): %@ Name: %@, %@ DOB: %@ Gender: %@",
                                 [self.details objectAtIndex:indexPath.row][@"weight"],
                                 [self.details objectAtIndex:indexPath.row][@"lname"],
                                 [self.details objectAtIndex:indexPath.row][@"fname"],
                                 [self.details objectAtIndex:indexPath.row][@"dob"],
                                 [self.details objectAtIndex:indexPath.row][@"gender"]
                                 ];
    return cell;
}

#pragma mark - Table view delagate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TransportDetailTVC-I-TRACE, -tableView:didSelectRowAtIndexPath: called.");
    
    // Deselect the cell immediately after selection.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
