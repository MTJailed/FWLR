//
//  AppDelegate.h
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

