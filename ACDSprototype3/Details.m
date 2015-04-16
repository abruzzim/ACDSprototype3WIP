//
//  Details.m
//  ACDSprototype3
//
//  Created by dev1 on 4/16/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "Details.h"

@implementation Details

+ (NSArray *)knownFakeDetails {
    NSLog(@"%%Details-I-TRACE, +knownFakeDetails called.");
    
    NSDictionary *fakeDetails1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"123ABC", @"tag",
                                  @"MedEvac 1", @"title",
                                  @"Little Community Hospital", @"sending",
                                  @"Children's Hospital Oakland", @"receiving",
                                  @"Sepsis", @"diagnosis",
                                  @26, @"weight",
                                  @"Doe", @"lname",
                                  @"Jane", @"fname",
                                  @"21-Oct-2014", @"dob",
                                  @"F", @"gender",
                                  nil];
    
    NSArray *fakeDetails = [[NSArray alloc] initWithObjects:
                            fakeDetails1,
                            nil];
    
    return fakeDetails;
}

@end
