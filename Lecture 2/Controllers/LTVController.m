//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "LTVController.h"

@interface LTVController()
@end

@implementation LTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.frameworks = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/usr/lib/" error:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.frameworks count]-1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if([[self.frameworks objectAtIndex:indexPath.row] containsString:@".dylib"]){
        cell.textLabel.text=[self.frameworks objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
