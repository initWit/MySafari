//
//  ViewController.m
//  MySafari
//
//  Created by Robert Figueras on 5/14/14.
//  Copyright (c) 2014 AppSpaceship. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.backButton setEnabled:NO];
    [self.forwardButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSURL *myURL = [NSURL URLWithString:textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.myWebView loadRequest:request];
    [textField resignFirstResponder];

    return YES;

}

- (IBAction)onForwardButtonPressed:(id)sender
{
    [self.myWebView goForward];
}

- (IBAction)onBackButtonPressed:(id)sender
{

    [self.myWebView goBack];
}

- (IBAction)onStopLoadingButtonPressed:(id)sender

{
    [self.myWebView stopLoading];
}

- (IBAction)onReloadButtonPressed:(id)sender
{
    [self.myWebView reload];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{

    if ([self.myWebView canGoForward])
    {
        [self.forwardButton setEnabled:YES];
    }
    else
    {
        [self.forwardButton setEnabled: NO];
    }

    if ([self.myWebView canGoBack])
    {
        [self.backButton setEnabled:YES];
    }
    else
    {
        [self.backButton setEnabled: NO];
    }
}

@end
