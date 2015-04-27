//
//  GuidelineChecklistTVC.m
//  ACDSprototype3
//
//  Created by dev1 on 4/16/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "GuidelineChecklistTVC.h"
#import "GuidelineChecklistTask.h"

#define HDR_FONT_SIZE 15.0f
#define HDR_FONT_TYPE "HelveticaNeue-Light"

@interface GuidelineChecklistTVC ()

@property NSDictionary *tasks;
@property NSArray *taskSectionTitles;
@property NSArray *taskIndexTitles;

@end

@implementation GuidelineChecklistTVC

- (instancetype)initWithDataDict:(NSDictionary *)checklistItems {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -initWithDataDict called.");

    self = [super init];
    if (self) {
        self.tasks = checklistItems;
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -viewDidLoad called.");
    
    [super viewDidLoad];
    self.taskSectionTitles = [[self.tasks allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.taskIndexTitles = @[@"0th",@"1st",@"2nd",@"3rd"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -numberOfSectionsInTableView: called.");
    
    // Return the number of sections.
    //
    return [self.taskSectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -tableView:numberOfRowsInSection: called.");
    
    // Return the number of rows in a section.
    //
    NSString *sectionKey = [self.taskSectionTitles objectAtIndex:section];
    NSArray *sectionTasks = [self.tasks objectForKey:sectionKey];
    return [sectionTasks count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -tableView:titleForHeaderInSection: called.");
    
    return [self.taskSectionTitles objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -tableView:cellForRowAtIndexPath: called.");

    // Return a reusable table-view cell object located by its identifier.
    //
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    
    // Instantiate a reusable table-view cell object if one does not exist.
    //
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"TaskCell"];
    }
    
    // Configure the cell.
    //
    NSString *sectionTitle = [self.taskSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionTasks = [self.tasks objectForKey:sectionTitle];
    GuidelineChecklistTask *task = [sectionTasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.title;
    if (task.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -sectionIndexTitlesForTableView: called.");
    
    return self.taskIndexTitles;
}
/*
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -tableView:sectionForSectionIndexTitle:atIndex: called.");
    
    return [self.taskSectionTitles indexOfObject:title];
}
*/
#pragma mark - Table view delagate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -tableView:didSelectRowAtIndexPath: called.");
    
    // Deselect the cell immediately after selection.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *sectionTitle = [self.taskSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionTasks = [self.tasks objectForKey:sectionTitle];
    GuidelineChecklistTask *tappedTask = [sectionTasks objectAtIndex:indexPath.row];
    tappedTask.completed = !tappedTask.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    NSLog(@"%%GuidelineChecklistTVC-I-TRACE, -tableView:willDisplayHeaderView:forSection: called.");
    
    UITableViewHeaderFooterView *headerFooterView = (UITableViewHeaderFooterView *)view;
    headerFooterView.backgroundView.backgroundColor = [UIColor lightGrayColor];
    headerFooterView.textLabel.font = [UIFont fontWithName:@HDR_FONT_TYPE size:HDR_FONT_SIZE];
    headerFooterView.textLabel.textColor = [UIColor whiteColor];
    headerFooterView.textLabel.textAlignment = NSTextAlignmentNatural;
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
