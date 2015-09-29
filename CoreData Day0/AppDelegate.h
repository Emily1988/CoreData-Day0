//
//  AppDelegate.h
//  CoreData Day0
//
//  Created by Emily on 15/9/17.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) CoreDataHelper *coreDataHelper;


@end

