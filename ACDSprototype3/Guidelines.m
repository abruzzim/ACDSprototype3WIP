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
    
    // Treatment guidelines (protocols) dictionary.
    //
    NSMutableArray *tasks1 = [[NSMutableArray alloc] init];
    
    GuidelineChecklistTask *task1 = [[GuidelineChecklistTask alloc] init];
    task1.title = @"Assess Patient";
    [tasks1 addObject:task1];
    GuidelineChecklistTask *task2 = [[GuidelineChecklistTask alloc] init];
    task2.title = @"Give Oxygen";
    [tasks1 addObject:task2];
    GuidelineChecklistTask *task3 = [[GuidelineChecklistTask alloc] init];
    task3.title = @"Place 2 IVs / IO";
    [tasks1 addObject:task3];
    GuidelineChecklistTask *task4 = [[GuidelineChecklistTask alloc] init];
    task4.title = @"Draw POC Labs";
    [tasks1 addObject:task4];
    GuidelineChecklistTask *task5 = [[GuidelineChecklistTask alloc] init];
    task5.title = @"Draw Labs";
    [tasks1 addObject:task5];
    GuidelineChecklistTask *task6 = [[GuidelineChecklistTask alloc] init];
    task6.title = @"Give Fluids";
    [tasks1 addObject:task6];
    GuidelineChecklistTask *task7 = [[GuidelineChecklistTask alloc] init];
    task7.title = @"Assess POC Labs";
    [tasks1 addObject:task7];
    GuidelineChecklistTask *task8 = [[GuidelineChecklistTask alloc] init];
    task8.title = @"Treat Hypocalcemia";
    [tasks1 addObject:task8];
    GuidelineChecklistTask *task9 = [[GuidelineChecklistTask alloc] init];
    task9.title = @"Treat Hypoglycemia";
    [tasks1 addObject:task9];
    GuidelineChecklistTask *task10 = [[GuidelineChecklistTask alloc] init];
    task10.title = @"Treat Acidosis";
    [tasks1 addObject:task10];
    GuidelineChecklistTask *task11 = [[GuidelineChecklistTask alloc] init];
    task11.title = @"Order Ceftriaxone";
    [tasks1 addObject:task11];
    GuidelineChecklistTask *task12 = [[GuidelineChecklistTask alloc] init];
    task12.title = @"Order Vancomycin";
    [tasks1 addObject:task12];
    GuidelineChecklistTask *task13 = [[GuidelineChecklistTask alloc] init];
    task13.title = @"Treat Hypotension";
    [tasks1 addObject:task13];
    GuidelineChecklistTask *task14 = [[GuidelineChecklistTask alloc] init];
    task14.title = @"Reassess Patient";
    [tasks1 addObject:task14];
    GuidelineChecklistTask *task15 = [[GuidelineChecklistTask alloc] init];
    task15.title = @"Treat Adrenal Insufficiency";
    [tasks1 addObject:task15];
    GuidelineChecklistTask *task16 = [[GuidelineChecklistTask alloc] init];
    task16.title = @"Treat Hypotension";
    [tasks1 addObject:task16];
    GuidelineChecklistTask *task17 = [[GuidelineChecklistTask alloc] init];
    task17.title = @"Draw Blood Culture";
    [tasks1 addObject:task17];
    GuidelineChecklistTask *task18 = [[GuidelineChecklistTask alloc] init];
    task18.title = @"Give Antibiotics";
    [tasks1 addObject:task18];
    GuidelineChecklistTask *task19 = [[GuidelineChecklistTask alloc] init];
    task19.title = @"Give Fluids";
    [tasks1 addObject:task19];
    
    NSDictionary *guideline1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Sepsis", @"title",
                                @"SepsisFlowchart3", @"filename",
                                [NSValue valueWithCGSize:CGSizeMake(768, 4914)], @"size",
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 768, 4914)], @"frame",
                                tasks1, @"checklist",
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
