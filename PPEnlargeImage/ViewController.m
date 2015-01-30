//
//  ViewController.m
//  PPEnlargeImage
//
//  Created by Powers, Patrick on 1/29/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "ViewController.h"
#import "PPAddDarkFilter.h"
#import "PPImageViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *contactImage;
@property (strong, nonatomic) IBOutlet UIImage *darkBackground;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ([[[touches anyObject] view] isEqual:_contactImage]){
        
        _contactImage.hidden = YES;
        
        PPAddDarkFilter *imageView = [[PPAddDarkFilter alloc] init];
        _darkBackground = [imageView captureBackgroundImage];
    
        
        PPImageViewController *vc = [[PPImageViewController alloc] init];
        vc.contactImage = _contactImage.image;
        vc.darkBackground = _darkBackground;
        vc.imageFrame = _contactImage.frame;
        
        
        [self presentViewController:vc animated:NO completion:nil];
        
         _contactImage.hidden = NO;
    }
    
}


@end
