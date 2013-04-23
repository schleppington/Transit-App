//
//  OCTADatabase.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: This file is not used, but it's intention is to interface with the OCTA database.

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Line.h"

@interface OCTADatabase : NSObject
{
    sqlite3* _databaseConnection;
}

+ (OCTADatabase*) database;
- (NSArray*) getLines;
- (NSArray*) fToNLine;

@end
