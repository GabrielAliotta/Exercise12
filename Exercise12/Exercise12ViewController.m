//
//  Exercise12ViewController.m
//  Exercise12
//
//  Created by Gabriel Aliotta on 3/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Exercise12ViewController.h"

@implementation Exercise12ViewController
@synthesize label1;
@synthesize label2;
@synthesize activityIndicator;

NSThread *thread; 
NSTimer *timer; 
int i = 0;

- (void)dealloc
{
    [label1 release];
    [label2 release];
    [activityIndicator release];
    [thread release];
    [timer release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [activityIndicator setHidden:YES];
}


- (void)viewDidUnload
{
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) longTask{ 
	do { 
		i++; 
	} while (i<=1999999999); 
    thread = nil;
    i = 0;
	[activityIndicator stopAnimating];
    [activityIndicator setHidden:YES];
} 

- (IBAction)startRepeatingTask:(id)sender {
    [activityIndicator setHidden:NO];
    [activityIndicator startAnimating]; 
	
	if(thread == nil) 
		thread = [[NSThread alloc] initWithTarget:self selector:@selector(longTask) object:nil]; 
	
	if(![thread isExecuting]) 
		[thread start]; 
	
	//[self longTask]; 
	
	label1.text = @"Started long task"; 
	label2.text = @"Started long task"; 
}

- (IBAction)doSingularTask:(id)sender {
    if([thread isExecuting]) 
		label2.text = @"Task still executing..."; 
	else 
    {
		label2.text = @"Task is now finished!"; 
    }
	timer = [[NSTimer scheduledTimerWithTimeInterval:(0.5) target:self selector:@selector(updateGUI:) userInfo:nil repeats:YES] retain]; 
}

-(void) updateGUI:(NSTimer *)aTimer{ 
	label1.text = [NSString stringWithFormat:@"Up to int %i", i]; 
} 

@end
