//
//  MetrolinkDatabase.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: implementation of the metrolink database connection. 
#import "MetrolinkDatabase.h"

@implementation MetrolinkDatabase

static MetrolinkDatabase* _databaseObj;

//creates db object
+ (MetrolinkDatabase*) database
{
    NSLog(@"made it to database");
    if (_databaseObj == nil) {
        _databaseObj = [[MetrolinkDatabase alloc] init];
    }
    return _databaseObj;
}

//initializes the connection to the metrolink database
- (id) init{
    NSLog(@"made it to init in database");
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"metrolink" ofType:@"sq3"];
        if (sqlite3_open([dbpath UTF8String], &_databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
        NSLog(@"made it to if statement in init in database");
    }
    return self;
}

//closes db connection
- (void) dealloc
{
    sqlite3_close(_databaseConnection);
}

//gets the route_id for 2 lines
- (NSArray*) getLines
{
    NSLog(@"made it to getlines");
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"select * from routes where route_id = '91 Line' or route_id = 'Riverside Line';";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *line;
    if(sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            if(text)
                line = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            else
                line = nil;
            [rv addObject: line];
        }
        sqlite3_finalize(stmt);
    }
    NSLog(@"%@", [rv objectAtIndex:0]);
    return rv;
}

//gets stops information for the 91 line
- (NSArray*) lines91
{
    NSLog(@"made it to Lines");
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM trips WHERE route_id = '91 Line' and trip_sequence='10';";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *line, *station, *trip;
    
    if(sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            NSLog(@"column 0: %@", [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding]);
            if (text)
                line = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                line = nil;
            
            text = sqlite3_column_text(stmt, 3);
            NSLog(@"column 3: %s", text);
            if (text)
                station = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                station = nil;
            
            text = sqlite3_column_text(stmt, 4);
            NSLog(@"column 4: %s", text);
            if (text)
                trip = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                trip = nil;
            
            Line *thisLine = [[Line alloc] initWithLine:line andStation:station andTrip:trip];
            
            [rv addObject: thisLine];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"failed in Lines");
    return rv;
}

//gets stops information for riverside line
- (NSArray*) riversideLine
{
    NSLog(@"made it to Lines");
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM trips WHERE route_id = 'Riverside Line' and trip_sequence='10'";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *line, *station, *trip;
    
    if(sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            NSLog(@"column 0: %@", [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding]);
            if (text)
                line = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                line = nil;
            
            text = sqlite3_column_text(stmt, 3);
            NSLog(@"column 3: %s", text);
            if (text)
                station = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                station = nil;
            
            text = sqlite3_column_text(stmt, 4);
            NSLog(@"column 4: %s", text);
            if (text)
                trip = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                trip = nil;
            
            Line *thisLine = [[Line alloc] initWithLine:line andStation:station andTrip:trip];
            
            [rv addObject: thisLine];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"failed in Lines");
    return rv;
}


@end
