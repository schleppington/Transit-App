//
//  MainViewController.h
//  Transit App
//
//  Created by Kurtis Schlepp on 4/22/13.
//  Copyright (c) 2013 Kurtis Schlepp. All rights reserved.
//
//Author: Kurtis Schlepp
//Email: kurtis.schlepp@csu.fullerton.edu
//Description: Main View Controller for inital view. has IBActions for the two map buttons.

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property NSString* whichMap;
- (IBAction)metrolinkbutton:(UIButton *)sender;
- (IBAction)octabutton:(UIButton *)sender;

@end
