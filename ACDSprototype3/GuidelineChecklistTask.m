//
//  GuidelineChecklistTask.m
//  ACDSprototype3
//
//  Created by abruzzim on 4/21/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import "GuidelineChecklistTask.h"

@implementation GuidelineChecklistTask

- (instancetype)initWithTitle:(NSString *)aTitle {
    if (self = [super init]) {
        self.title = aTitle;
    }
    return self;
}

@end
