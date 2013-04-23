//
//  ViewController.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: header file for the detail table view. ovtalines array is not used.

#import <UIKit/UIKit.h>
#import "MetrolinkDatabase.h"
#import "OCTADatabase.h"
#import "Line.h"

@interface DetailTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _metrolinkLines;
    NSArray* _octaLines;
}

@property (nonatomic, retain) NSArray* metrolinkLines;
@property (nonatomic, retain) NSArray* octaLines;
@property NSString* whichLine;

@end
