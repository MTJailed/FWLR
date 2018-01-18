//
//  ViewController.h
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassTVController.h"
@interface REClassTVController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property NSString* framework;
@property BOOL privateFW;
@property NSArray* classes;
@end

