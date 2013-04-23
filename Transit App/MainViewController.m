//
//  MainViewController.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/22/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: implementation of the main view. has a prepare for segue function that tells the pdf view controller which map it should be displaying.

#import "MainViewController.h"
#import "PDFViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize whichMap;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"metromap"]){
        PDFViewController* detailVC = segue.destinationViewController;
        NSLog(@"%@", self.whichMap);
        detailVC.whichMap = self.whichMap;
    }
    else if ([segue.identifier isEqualToString:@"octapush"])
    {
        PDFViewController* detailVC = segue.destinationViewController;
        detailVC.whichMap = self.whichMap;
    }
}

- (IBAction)metrolinkbutton:(UIButton *)sender {
    
    NSLog(@"metrolinkbutton");
    
    self.whichMap = @"metrolink_system_map";
    
}

- (IBAction)octabutton:(UIButton *)sender {
    
    NSLog(@"octabutton");
    
    self.whichMap = @"sysmapoct12";
}
@end
