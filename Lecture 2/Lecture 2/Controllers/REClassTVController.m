//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "REClassTVController.h"

#import "APIManager.h"
@interface REClassTVController()
@end

@implementation REClassTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL loaded = [APIManager loadFW:self.framework private:self.privateFW];
    if(!loaded) {
        NSLog(@"FW NOT LOADED!\n");
    }
    [self.navigationItem setTitle:[self.framework stringByAppendingString:@" classes"]];
    self.classes = [APIManager dumpClasses:self.framework privateFW:self.privateFW];
    [self.tableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    ClassTVController *vc;
    vc = [segue destinationViewController];
    vc.Class = [self.classes objectAtIndex:path.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([self.classes count]-1);
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"CLASS";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text=[self.classes objectAtIndex:indexPath.row];
    return cell;
}

@end
