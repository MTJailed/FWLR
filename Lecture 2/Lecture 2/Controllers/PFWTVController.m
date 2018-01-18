//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "PFWTVController.h"
@interface PFWTVController()
@end

@implementation PFWTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.frameworks = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/System/Library/PrivateFrameworks/" error:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    REClassTVController *vc;
    vc = [segue destinationViewController];
    vc.privateFW = YES;
    vc.framework = [[self.frameworks objectAtIndex:path.row] stringByReplacingOccurrencesOfString:@".framework" withString:@""];
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
    
    cell.textLabel.text=[self.frameworks objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
