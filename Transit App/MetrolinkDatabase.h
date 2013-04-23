//
//  MetrolinkDatabase.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: header file for database connection with metrolink database. lines91 gets the 91 line information. riversideLine gets the Riverside Line information. getLines gets the names for the lines I'm displaying in this app.

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Line.h"

@interface MetrolinkDatabase : NSObject
{
    sqlite3* _databaseConnection;
}

+ (MetrolinkDatabase*) database;
- (NSArray*) lines91;
- (NSArray*) riversideLine;
- (NSArray*) getLines;

@end
