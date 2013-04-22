//
//  MetrolinkDatabase.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import "MetrolinkDatabase.h"
#import <sqlite3.h>

@implementation MetrolinkDatabase

static MetrolinkDatabase* _databaseObj;

+ (MetrolinkDatabase*) database
{
    if (_databaseObj == nil) {
        _databaseObj = [[MetrolinkDatabase alloc] init];
    }
    return _databaseObj;
}

- (id) init{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"metrolink" ofType:@"sq3"];
        if (sqlite3_open([dbpath UTF8String], &_databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    return self;
}

- (void) dealloc
{
    sqlite3_close(_databaseConnection);
}

- (NSArray*) Lines
{
    
}

//figure out what sql queires you need to get.

@end
