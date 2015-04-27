//
//  Guidelines.m
//  ACDSprototype3
//
//  Created by dev1 on 4/16/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "Guidelines.h"
#import "GuidelineChecklistTask.h"

@implementation Guidelines

+ (NSArray *)knownGuidelines {
    NSLog(@"%%Guidelines-I-TRACE, +knownGuidelines called.");
    
    // 0th Interval
    GuidelineChecklistTask *task1 = [[GuidelineChecklistTask alloc] initWithTitle:@"Assess Patient"];
    GuidelineChecklistTask *task2 = [[GuidelineChecklistTask alloc] initWithTitle:@"Give Oxygen"];
    // 1st Interval
    GuidelineChecklistTask *task3 = [[GuidelineChecklistTask alloc] initWithTitle:@"Place 2 IVs / IO"];
    GuidelineChecklistTask *task4 = [[GuidelineChecklistTask alloc] initWithTitle:@"Draw POC Labs"];
    GuidelineChecklistTask *task5 = [[GuidelineChecklistTask alloc] initWithTitle:@"Draw Hospital Labs"];
    GuidelineChecklistTask *task6 = [[GuidelineChecklistTask alloc] initWithTitle:@"Give Fluids"];
    GuidelineChecklistTask *task7 = [[GuidelineChecklistTask alloc] initWithTitle:@"Assess POC Results"];
    GuidelineChecklistTask *task8 = [[GuidelineChecklistTask alloc] initWithTitle:@"Treat Hypocalcemia"];
    GuidelineChecklistTask *task9 = [[GuidelineChecklistTask alloc] initWithTitle:@"Treat Hypoglycemia"];
    GuidelineChecklistTask *task10 = [[GuidelineChecklistTask alloc] initWithTitle:@"Treat Acidosis"];
    GuidelineChecklistTask *task11 = [[GuidelineChecklistTask alloc] initWithTitle:@"Order Ceftriaxone"];
    GuidelineChecklistTask *task12 = [[GuidelineChecklistTask alloc] initWithTitle:@"Order Vancomycin"];
    GuidelineChecklistTask *task13 = [[GuidelineChecklistTask alloc] initWithTitle:@"Order Inotropes"];
    GuidelineChecklistTask *task14 = [[GuidelineChecklistTask alloc] initWithTitle:@"Treat Hypotension"];
    // 2nd Interval
    GuidelineChecklistTask *task15 = [[GuidelineChecklistTask alloc] initWithTitle:@"Reassess Patient"];
    GuidelineChecklistTask *task16 = [[GuidelineChecklistTask alloc] initWithTitle:@"Treat Adrenal Insufficiency"];
    GuidelineChecklistTask *task17 = [[GuidelineChecklistTask alloc] initWithTitle:@"Treat Hypotension"];
    GuidelineChecklistTask *task18 = [[GuidelineChecklistTask alloc] initWithTitle:@"Draw Blood Culture"];
    GuidelineChecklistTask *task19 = [[GuidelineChecklistTask alloc] initWithTitle:@"Give Antibiotics"];
    // 3rd Interval
    GuidelineChecklistTask *task20 = [[GuidelineChecklistTask alloc] initWithTitle:@"Give Fluids"];
    
    NSDictionary *tasks1 =[NSDictionary dictionaryWithObjectsAndKeys:
                           @[
                             task1,
                             task2
                             ], @"0th Interval: Zero Time",
                           @[
                             task3,
                             task4,
                             task5,
                             task6,
                             task7,
                             task8,
                             task9,
                             task10,
                             task11,
                             task12,
                             task13,
                             task14
                             ], @"1st Interval: 0-15 Minutes",
                           @[
                             task15,
                             task16,
                             task17,
                             task18,
                             task19
                             ], @"2nd Interval: 15-60 Minutes",
                           @[
                             task20
                             ], @"3rd Interval: 1-4 Hours",
                           nil];
    
    NSDictionary *guideline1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Sepsis", @"title",
                                @"SepsisFlowchart3", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4914)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4914)], @"frame",
                                tasks1, @"checklist",
                                @"sepsis", @"html",
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
