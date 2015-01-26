//
//  AppDelegate.m
//  MP4Vid
//
//  Created by Andrew Moore on 03/01/2015.
//  Copyright (c) 2015 Andrew Moore. All rights reserved.
//

#import "AppDelegate.h"
@import AVFoundation;
@import AVKit;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FilmName" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    if ( [content length] == 0 ) {
        
 
        
    } else {
    
    // Override point for customization after application launch.
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    

        
    playerViewController.player = [AVPlayer playerWithURL:[[NSBundle mainBundle]
                                                           URLForResource:content
                                   withExtension:@"mp4"]];

 
        playerViewController.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        
       
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object: playerViewController.player.currentItem];
        
        [playerViewController.player play];
        self.window.rootViewController = playerViewController;
        [self.window makeKeyAndVisible];

        
    }
    
    return YES;
}


- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
