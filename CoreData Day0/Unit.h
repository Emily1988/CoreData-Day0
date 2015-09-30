//
//  Unit.h
//  CoreData Day0
//
//  Created by Emily on 15/9/30.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Unit : NSManagedObject

@property (nonatomic, retain) NSString * name;
// NSSet与NSOrderedSet或NSArray不同，NSSet里面的对象是无序的。获取对象时如果要排序，那么通常会给获取请求传入排序描述符，而获取请求执行完之后锁返回的是NSArray。假如在配置一对多关系时候勾选了Ordered选项，那么在NSManagedObject子类里面，对应的特性类型就变成了NSOrderedSet。
//NSSet与SArray还有一点不同，那就是不能包含重复的对象。
@property (nonatomic, retain) NSSet *item;  // 表示一对多的关系
@end

@interface Unit (CoreDataGeneratedAccessors)

- (void)addItemObject:(Item *)value;
- (void)removeItemObject:(Item *)value;
- (void)addItem:(NSSet *)values;
- (void)removeItem:(NSSet *)values;

@end
