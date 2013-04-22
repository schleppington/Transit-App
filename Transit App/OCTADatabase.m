//
//  OCTADatabase.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import "OCTADatabase.h"

@implementation OCTADatabase

static OCTADatabase* _databaseObj;

+ (OCTADatabase*) database
{
    if (_databaseObj == nil) {
        _databaseObj = [[OCTADatabase alloc] init];
    }
    return _databaseObj;
}

- (id) init{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"octa" ofType:@"sq3"];
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

//figure out what sql queires you need to get.

@end
