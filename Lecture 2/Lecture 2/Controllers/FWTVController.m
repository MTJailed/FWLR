//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "FWTVController.h"
@interface FWTVController()
@end

@implementation FWTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.frameworks = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/System/Library/Frameworks/" error:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    REClassTVController *vc;
    vc = [segue destinationViewController];
    vc.privateFW = NO;
    vc.framework = [[self.frameworks objectAtIndex:path.row] stringByReplacingOccurrencesOfString:@".framework" withString:@""];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.frameworks count];
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
