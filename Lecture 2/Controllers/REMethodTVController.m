//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "REMethodTVController.h"
#import "APIManager.h"
@interface REMethodTVController() {
    UIAlertController* msgcenter;
}
@end

@implementation REMethodTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    msgcenter = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [msgcenter addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
    }]];
    if(self.Class == nil) {
        return;
    }
    [self.navigationItem setTitle:self.Class];
    Class allocClass = NSClassFromString(self.Class);
    self.Methods = [APIManager dumpMethods:allocClass];
    [self.tableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Call Selector"
                                 message:@"Calling a selector may cause the app to crash, continue?"
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    NSString* method = [self.Methods objectAtIndex:indexPath.row];
                                    id result = [APIManager tryCallMethod:self.Class methodName:method];
                                    if([NSStringFromClass([result class]) containsString:@"Image"]) {
                                        result = @"The result seems to be an image.";
                                    }
                                    msgcenter.title = [@"'" stringByAppendingString:[method stringByAppendingString:@"' call result"]];
                                    msgcenter.message = result;
                                    [self presentViewController:msgcenter animated:YES completion:nil];
                                }];
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"No"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                  
                               }];
    [alert addAction:yesButton];
    [alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([self.Methods count]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"METHOD";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text=[self.Methods objectAtIndex:indexPath.row];
    return cell;
}

@end
