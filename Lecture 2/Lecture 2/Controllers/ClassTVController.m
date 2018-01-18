//
//  ViewController.m
//  Lecture 2
//
//  Created by Sem Voigtländer on 10/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//

#import "ClassTVController.h"
#import "REMethodTVController.h"
#import "REPropertyTVController.h"
@interface ClassTVController()
@end

@implementation ClassTVController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:self.Class];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if([[sender reuseIdentifier] isEqualToString:@"METHODS"]) {
        REMethodTVController *vc;
        vc = [segue destinationViewController];
        vc.Class = self.Class;
    } else if([[sender reuseIdentifier] isEqualToString:@"PROPERTIES"]) {
        REPropertyTVController *vc;
        vc = [segue destinationViewController];
        vc.Class = self.Class;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
