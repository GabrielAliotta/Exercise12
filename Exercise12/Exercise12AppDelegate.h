//
//  Exercise12AppDelegate.h
//  Exercise12
//
//  Created by Gabriel Aliotta on 3/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Exercise12ViewController;

@interface Exercise12AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Exercise12ViewController *viewController;

@end
