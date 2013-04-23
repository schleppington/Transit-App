//
//  ViewController.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: This file is the implementation of the detail table view. Displays stop information for lines.

#import "DetailTableViewController.h"

@interface DetailTableViewController ()

@end

@implementation DetailTableViewController

@synthesize metrolinkLines=_metrolinkLines;
@synthesize octaLines=_octaLines;
@synthesize whichLine;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if ([whichLine isEqualToString:@"91 Line"])
        self.metrolinkLines = [[MetrolinkDatabase database] lines91];
    else if ([whichLine isEqualToString:@"Riverside Line"])
        self.metrolinkLines = [[MetrolinkDatabase database] riversideLine];
    
    NSLog(@"made it to viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.metrolinkLines = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"made it to numberOFSectionsInTableView");
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"made it to tableView: numberOfRowsInSection");
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"number of rows in section: %d", [self.metrolinkLines count]);
    return [self.metrolinkLines count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"made it to tableView: cellForRowAtIndexPath");
    //static NSString *CellIdentifier = @"Cell";
    static NSString *MyIdentifier = @"MyCellIdentifier";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    
    Line *line = [self.metrolinkLines objectAtIndex: indexPath.row];
    cell.textLabel.text = line.station;
    cell.detailTextLabel.text = line.line;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%g, %g)", location.region, location.coord.longitude, location.coord.latitude];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Tap!");
    //[self performSegueWithIdentifier:@"detailsegue" sender:self];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
@end
