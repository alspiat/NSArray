//
//  ViewController.m
//  ArrayPractice
//
//  Created by Алексей on 12.04.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create own autorelease pool
    @autoreleasepool {
    
    // Create NSArray, containing several strings, using literal declaration.
    NSArray *array = @[@"One", @"Two", @"Three", @"Four"];
    
    for (NSString *string in array) {
        NSLog(@"%@", string);
    }
    
    // Create mutable array from piviously created NSArray.
    NSMutableArray *mutable = [NSMutableArray arrayWithArray:array];
    
    // Check is array mutable
    if ([mutable respondsToSelector:@selector(addObject:)]) {
        NSLog(@"Mutable");
    } else {
        NSLog(@"Immutable");
    }
    
    // Better way
    if ([mutable isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"Mutable");
    } else {
        NSLog(@"Immutable");
    }
    
    // Create an empty array and obtain its first and last element in a safe way.
    NSArray *secondArray = [NSArray array];
    NSLog(@"%@", secondArray.firstObject);
    NSLog(@"%@", secondArray.lastObject);
    
    // Create NSArray, containing strings from 1 to 20
    NSArray *newArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",
                          @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20"];
    
    // Shallow copy
    NSArray *shallowCopy = [newArray copyWithZone:nil];
    
    // Real deep copy
    NSArray* realDeepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:
                                  [NSKeyedArchiver archivedDataWithRootObject:newArray]];
    
    // Compare addresses of the first item
    NSLog(@"Array: %p", newArray[0]);
    NSLog(@"Shallow copy: %p", shallowCopy[0]);
    NSLog(@"Real deep copy: %p", realDeepCopy[0]);
        
    [shallowCopy release];
    
    // Iterate over array and obtain item at index 13. Print an item.
    [newArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 13) {
            NSLog(@"Index 13 = %@", obj);
            *stop = YES;
        }
    }];
    
    // Make array mutable
    NSMutableArray *newMutableArray = [NSMutableArray arrayWithArray:newArray];
    
    // Add two new entries to the end of the array
    [newMutableArray addObject:@"21"];
    [newMutableArray addObject:@"22"];
    
    // Add an entry to the beginning of the array
    [newMutableArray insertObject:@"0" atIndex:0];
    
    for (NSString *string in newMutableArray) {
        NSLog(@"%@", string);
    }
    
    // Iterate over an array and remove item at index 5
    [newMutableArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 5) {
            [newMutableArray removeObjectAtIndex:5];
            *stop = YES;
        }
    }];
    
    for (NSString *string in newMutableArray) {
        NSLog(@"%@", string);
    }
    
    // Create new array of mixed numbers
    NSArray *numberArray = @[@56, @24.25, @37, @41, @24.98, @60, @7];

    // Sort it in an ascending order
    NSArray *ascendingOrderArray = [numberArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (NSString *string in ascendingOrderArray) {
        NSLog(@"%@", string);
    }
    
    // Sort it in a descending order
    NSArray *descendingOrderArray = [numberArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
    }];
    
    for (NSString *string in descendingOrderArray) {
        NSLog(@"%@", string);
    }
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
