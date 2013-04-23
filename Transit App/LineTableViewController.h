//
//  LineTableViewController.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/22/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: header file for the table view controller that shows metrolink lines

#import <UIKit/UIKit.h>
#import "MetrolinkDatabase.h"

@interface LineTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _lines;
}

@property (nonatomic, retain) NSArray* lines;
@property NSString* whichLine;

@end
