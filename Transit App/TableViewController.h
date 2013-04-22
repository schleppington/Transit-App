//
//  ViewController.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetrolinkDatabase.h"
#import "OCTADatabase.h"

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _metrolinkLines;
    NSArray* _octaLines;
}

@property (nonatomic, retain) NSArray* metrolinkLines;
@property (nonatomic, retain) NSArray* octaLines;

@end
