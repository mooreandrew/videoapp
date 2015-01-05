//
//  ViewController.m
//  MP4Vid
//
//  Created by Andrew Moore on 03/01/2015.
//  Copyright (c) 2015 Andrew Moore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FilmName" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    if ( [content length] == 0 ) {
        
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"url" ofType:@"txt"];
        NSString *content2 = [NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:nil];
        
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 768, 1024)];
        NSURL *URL = [NSURL URLWithString:content2];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:URL];
        
        
        webView.delegate = self ;
        [webView loadRequest:requestObj];
        [self.view addSubview:webView];
        
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FilmName" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    if ( [content length] == 0 ) {
        return UIInterfaceOrientationMaskPortrait + UIInterfaceOrientationMaskPortraitUpsideDown;
        
    } else {
        
        return UIInterfaceOrientationMaskLandscapeLeft + UIInterfaceOrientationMaskLandscapeRight;

    }
}




@end
