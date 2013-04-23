//
//  OCTADatabase.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/21/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface OCTADatabase : NSObject
{
    sqlite3* _databaseConnection;
}

+ (OCTADatabase*) database;

@end
