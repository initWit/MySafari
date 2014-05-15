//
//  ViewController.m
//  MySafari
//
//  Created by Robert Figueras on 5/14/14.
//  Copyright (c) 2014 AppSpaceship. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate,UITextFieldDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *mySpinner;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.backButton setEnabled:NO];
    [self.forwardButton setEnabled:NO];

    self.myWebView.scrollView.delegate = self;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat myOffset = self.myWebView.scrollView.contentOffset.y;

    NSLog(@"contentOffset.y is %g",(myOffset));

    if (myOffset > 0) {
        self.myURLTextField.alpha = (1-(myOffset*.01));


        self.myURLTextField.frame = CGRectMake(20.0, 80.0 -myOffset, self.myURLTextField.frame.size.width, self.myURLTextField.frame.size.height);

    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    NSString *finishedURL = textField.text;


    if (![textField.text hasPrefix:@"http://"]) {
        finishedURL = [@"http://" stringByAppendingString:textField.text];
    }

    NSURL *myURL = [NSURL URLWithString:finishedURL];
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


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.mySpinner startAnimating];
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

//    NSLog(@" is %@",webView.request.URL.absoluteString);
    self.myURLTextField.text = webView.request.URL.absoluteString;

    NSString *titleFromTheWebViewString = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];

    self.navigationItem.title = titleFromTheWebViewString;

    if (![webView isLoading]) {
        [self.mySpinner stopAnimating];
    }




}

- (IBAction)showMyAlert:(id)sender {

    UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"Coming soon!"
                                                         message:@"Coming soon!"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    [myAlertView show];
}


@end
