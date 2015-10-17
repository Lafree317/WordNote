//
//  CustomFile+CoreDataProperties.h
//  WordNote
//
//  Created by 童浩 on 15/9/23.
//  Copyright © 2015年 Yoni. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CustomFile.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomFile (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSSet *contentSet;

@end

@interface CustomFile (CoreDataGeneratedAccessors)

- (void)addContentSetObject:(Content *)value;
- (void)removeContentSetObject:(Content *)value;
- (void)addContentSet:(NSSet *)values;
- (void)removeContentSet:(NSSet *)values;

@end

NS_ASSUME_NONNULL_END
