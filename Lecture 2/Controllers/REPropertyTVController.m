//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "REPropertyTVController.h"
#import "APIManager.h"
@interface REPropertyTVController() {
    UIAlertController* msgcenter;
}
@end

@implementation REPropertyTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.Class == nil) {
        return;
    }
    msgcenter = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [msgcenter addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
    }]];
    [self.navigationItem setTitle:self.Class];
    NSLog(@"CLASS: %@\n",self.Class);
    Class allocClass = NSClassFromString(self.Class);
    self.Properties = [APIManager dumpProperties:allocClass];
    [self.tableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* property = [self.Properties objectAtIndex:indexPath.row];
    NSRange remove = [property rangeOfString:@") "];
    property = [[property substringFromIndex:remove.location] stringByReplacingOccurrencesOfString:@") " withString:@""];
    NSString* result = [APIManager tryReadProperty:self.Class property:property];
    msgcenter.title = property;
    msgcenter.message = result;
    [self presentViewController:msgcenter animated:YES completion:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([self.Properties count]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"PROPERTY";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[self.Properties objectAtIndex:indexPath.row];
    return cell;
}

@end
