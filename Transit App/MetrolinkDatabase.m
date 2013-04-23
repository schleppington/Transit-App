//
//  MetrolinkDatabase.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import "MetrolinkDatabase.h"

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
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"select * from trips where service_id = '91 Line' or service_id = 'Riverside Line'";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *line, *station, *trip;
    
    if(sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            if (text)
                line = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                line = nil;
            
            text = sqlite3_column_text(stmt, 1);
            if (text)
                station = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                station = nil;
            
            text = sqlite3_column_text(stmt, 2);
            if (text)
                trip = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                trip = nil;
            
            
        }
        sqlite3_finalize(stmt);
    }
    return rv;
}

//figure out what sql queires you need to get.


@end
