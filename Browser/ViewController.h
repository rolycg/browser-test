//
//  ViewController.h
//  Browser
//
//  Created by Rolando Cruz on 4/17/18.
//  Copyright © 2018 Citrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController<UITextViewDelegate>


- (IBAction)EditingEnd:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@property (weak, nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UIWebView *webContent;

@end

