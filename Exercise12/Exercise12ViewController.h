//
//  Exercise12ViewController.h
//  Exercise12
//
//  Created by Gabriel Aliotta on 3/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exercise12ViewController : UIViewController {
    
    UILabel *label1;
    UILabel *label2;
    UIActivityIndicatorView *activityIndicator;
}
@property (nonatomic, retain) IBOutlet UILabel *label1;
@property (nonatomic, retain) IBOutlet UILabel *label2;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)startRepeatingTask:(id)sender;
- (IBAction)doSingularTask:(id)sender;

@end
