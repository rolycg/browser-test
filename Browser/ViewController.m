//
//  ViewController.m
//  Browser
//
//  Created by Rolando Cruz on 4/17/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import "ViewController.h"
#import "HTTPHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    [self showWebContent:[HTTPHandler getContent:self.url.text]];
    [textField resignFirstResponder];
    return YES;
}

- (void)showWebContent:(NSString*)content {
    [self.webContent setBackgroundColor:[UIColor clearColor]];
    [self.webContent loadHTMLString:[content description] baseURL:[NSURL URLWithString:self.url.text]];
}


- (IBAction)EditingEnd:(id)sender {
    NSLog(@"Keyboard hidden: %@", self.url.text);
}
@end
