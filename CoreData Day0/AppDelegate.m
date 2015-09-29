//
//  AppDelegate.m
//  CoreData Day0
//
//  Created by Emily on 15/9/17.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

#import "AppDelegate.h"
#import "Item.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#define debug 1

- (void)demo {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    NSArray *arrayitemNames = [NSArray arrayWithObjects:@"Apple",@"Milk",@"Bread",@"Cheese",@"Sausages",@"Fish",@"OrangeJuice" ,nil];
    for (NSString *newItemName in arrayitemNames) {
        Item *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:_coreDataHelper.context];
        newItem.name = newItemName;
        NSLog(@"插入新的Managed对象 %@",newItem.name);
    }

    //MARK: 获取托管对象
    NSError *error = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    //MARK: 对获取请求结果排序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *fetchedObjects = [_coreDataHelper.context executeFetchRequest:request error:&error];
    // 查看每个托管对象特性值
    for (Item *item in fetchedObjects){
        NSLog(@"fetched Object = %@",item.name);
    }
    
    //MARK: 获取请求模板的用法
    //  注意第一行代码和上面的不同
    NSFetchRequest *request1 = [[[_coreDataHelper model] fetchRequestTemplateForName:@"Test"] copy];
    NSSortDescriptor *sort1 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request1 setSortDescriptors:[NSArray arrayWithObject:sort1]];
    NSArray *fetchedObjects1 = [_coreDataHelper.context executeFetchRequest:request1 error:&error];
    for (Item *item in fetchedObjects1){
        NSLog(@"fetched Object 2 = %@",item.name);
    }

    // MARK:删除托管对象
    NSFetchRequest *request2 = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSArray *fetchedObjects2 = [_coreDataHelper.context executeFetchRequest:request2 error:&error];
    for (Item *item in fetchedObjects2){
        NSLog(@"Delete Object = %@",item.name);
        [_coreDataHelper.context deleteObject:item];
    }
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
