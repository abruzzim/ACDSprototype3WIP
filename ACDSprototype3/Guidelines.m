//
//  Guidelines.m
//  ACDSprototype3
//
//  Created by dev1 on 4/16/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "Guidelines.h"

@implementation Guidelines

+ (NSArray *)knownGuidelines {
    NSLog(@"%%Guidelines-I-TRACE, +knownGuidelines called.");
    
    // Treatment guidelines (protocols) dictionary.
    //
    NSDictionary *guideline1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Sepsis", @"title",
                                @"SepsisFlowchart3", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4914)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4914)], @"frame",
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Assess Patient", @"task1",
                                 @"Give Oxygen", @"task2",
                                 @"Place 2 IVs / IO", @"task3",
                                 @"Draw POC Labs", @"task4",
                                 @"Draw Labs", @"task5",
                                 @"Give Fluids", @"task6",
                                 @"Assess POC Labs", @"task7",
                                 @"Treat Hypocalcemia", @"task8",
                                 @"Treat Hypoglycemia", @"task9",
                                 @"Treat Acidosis", @"task10",
                                 @"Order Ceftriaxone", @"task11",
                                 @"Order Vancomycin", @"task12",
                                 @"Treat Hypotension", @"task13",
                                 @"Reassess Patient", @"task14",
                                 @"Treat Adrenal Insufficiency", @"task15",
                                 @"Treat Hypotension", @"task16",
                                 @"Draw Blood Culture", @"task17",
                                 @"Give Antibiotics", @"task18",
                                 @"Give Fluids", @"task19",
                                 nil], @"checklist",
                                nil];
    
    NSDictionary *guideline2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Diabetic Ketoacidosis", @"title",
                                @"", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4096)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4096)], @"frame",
                                nil];
    
    NSDictionary *guideline3 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Traumatic Brain Injury", @"title",
                                @"", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4096)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4096)], @"frame",
                                nil];
    
    NSDictionary *guideline4 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Status Asthmaticus", @"title",
                                @"", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4096)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4096)], @"frame",
                                nil];
    
    NSDictionary *guideline5 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Status Epilepticus", @"title",
                                @"", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4096)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4096)], @"frame",
                                nil];
    
    NSArray *guidelines = [[NSArray alloc] initWithObjects:
                           guideline1,
                           guideline2,
                           guideline3,
                           guideline4,
                           guideline5,
                           nil];
    
    return guidelines;
}

@end
