//
//  AppDelegate.m
//  CoreData Day0
//
//  Created by Emily on 15/9/17.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

#import "AppDelegate.h"
#import "Item.h"
#import "Measurement.h"
#import "Amount.h"
#import "Unit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#define debug 1

- (void)demo {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    // 插入一些假数据，方便测试
//    for (int i = 0 ; i < 50000; i++) {
//        Measurement *newMeasurement = [NSEntityDescription insertNewObjectForEntityForName:@"Measurement" inManagedObjectContext:_coreDataHelper.context];
//        
//        newMeasurement.abc = [NSString stringWithFormat:@"--->> LOTS OF TEST DATA x%i",i];
//        NSLog(@"Inserted %@",newMeasurement.abc);
//    }
//    [_coreDataHelper saveContext];
    
//    for (int i = 0 ; i < 50000; i++) {
//        Amount *newamount = [NSEntityDescription insertNewObjectForEntityForName:@"Amount" inManagedObjectContext:_coreDataHelper.context];
//        
//        newamount.xyz = [NSString stringWithFormat:@"--->> LOTS OF TEST DATA x%i",i];
//        NSLog(@"Inserted %@",newamount.xyz);
//    }
//    [_coreDataHelper saveContext];

    
//    NSFetchRequest *requset = [NSFetchRequest fetchRequestWithEntityName:@"Amount"];
//    // 获取50个样例（获取到的结果数量限制到50）
//    [requset setFetchLimit:50];
//    
//    NSError *error = nil;
//    NSArray *fetchObject = [_coreDataHelper.context executeFetchRequest:requset error:&error];
//    
//    if (error) {
//        NSLog(@"%@",error);
//    }else
//    {
//        for (Amount *amount in fetchObject) {
//            NSLog(@"fetch Object = %@",amount.xyz);
//        }
//    }
    
//    NSFetchRequest *requset = [NSFetchRequest fetchRequestWithEntityName:@"Unit"];
//    // 获取50个样例（获取到的结果数量限制到50）
//    [requset setFetchLimit:50];
//    
//    NSError *error = nil;
//    NSArray *fetchObject = [_coreDataHelper.context executeFetchRequest:requset error:&error];
//    
//    if (error) {
//        NSLog(@"%@",error);
//    }else
//    {
//        for (Unit *amount in fetchObject) {
//            NSLog(@"fetch Object = %@",amount.name);
//        }
//    }

    Unit *kg = [NSEntityDescription insertNewObjectForEntityForName:@"Unit" inManagedObjectContext:[[self cdh] context]];
    Item *oranges = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:[[self cdh] context]];
    Item *bananas = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:[[self cdh] context]];

    kg.name = @"Kg";
    oranges.name = @"Oranges";
    bananas.name = @"Bananas";
    oranges.quantity = [NSNumber numberWithInt:1];
    bananas.quantity = [NSNumber numberWithInt:4];
    oranges.listed = [NSNumber numberWithBool:YES];
    bananas.listed = [NSNumber numberWithBool:YES];
    oranges.unit = kg;
    bananas.unit = kg;
    
    NSLog(@"Inserted %@%@ %@",oranges.quantity,oranges.unit.name,oranges.name);
    NSLog(@"Inserted %@%@ %@",bananas.quantity,bananas.unit.name,bananas.name);
    [[self cdh] saveContext];
}

- (CoreDataHelper*)cdh {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if (!_coreDataHelper) {
        _coreDataHelper = [CoreDataHelper new];
        [_coreDataHelper setupCoreData];
    }
    return _coreDataHelper;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[self cdh] saveContext];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [self cdh];
    [self demo];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[self cdh] saveContext];
}


@end
