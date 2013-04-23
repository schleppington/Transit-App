//
//  Line.m
//  Transit App
//
//  Created by Kurtis Schlepp on 4/22/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//

#import "Line.h"

@implementation Line

@synthesize line;
@synthesize station;
@synthesize trip;

- (id) initWithLine:(NSString *)theLine andStation:(NSString *)theStation andTrip:(NSString *)theTrip
{
    self = [super init];
    if(self)
    {
        line = theLine;
        station = theStation;
        trip = theTrip;
    }
    return self;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ %@ %@", line, station, trip];
}

@end
