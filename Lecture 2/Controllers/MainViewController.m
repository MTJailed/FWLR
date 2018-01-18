//
//  UIViewController+MainViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "MainViewController.h"
#import "IOEnumerator.h"
@interface MainViewController()
- (IBAction)about:(id)sender;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.aboutalert = [UIAlertController alertControllerWithTitle:@"About" message:@"Created by Sem Voigtlander" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
    [self.aboutalert addAction:ok];
}

- (IBAction)about:(id)sender {
    [self presentViewController:self.aboutalert animated:YES completion:nil];
}
@end
