//
//  Line.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/22/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject

@property (nonatomic, retain) NSString* line;
@property (nonatomic, retain) NSString* station;
@property (nonatomic, retain) NSString* trip;

- (id) initWithLine: (NSString*) theLine andStation: (NSString*) theStation andTrip: (NSString*) theTrip;
- (NSString*) description;

@end
