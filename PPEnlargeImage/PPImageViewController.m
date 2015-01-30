//
//  PPImageViewController.m
//  PPEnlargeImage
//
//  Created by Powers, Patrick on 1/29/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "PPImageViewController.h"

@interface PPImageViewController (){
    float scaleRatio;
}

@property (strong, nonatomic) UIImageView *imgViewBackground;
@property (strong, nonatomic) UIImageView *imgView;

@end

@implementation PPImageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self setUpImageViews];
    
    [self animationBegin];
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self animationEnd];
    
}

-(void) setUpImageViews{
    
    _imgViewBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [_imgViewBackground setImage:_darkBackground];
    [self.view addSubview:_imgViewBackground];
    
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(_imageFrame.origin.x, _imageFrame.origin.y, _imageFrame.size.width, _imageFrame.size.height)];
    [_imgView setImage:_contactImage];
    [self.view addSubview:_imgView];
    
}

-(void) animationBegin{
    
    float screenWidth = [[UIScreen mainScreen] bounds].size.width;
    float imageWidth = _imgView.bounds.size.width;
    scaleRatio = screenWidth/imageWidth;
    
    
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:(void (^)(void)) ^{
        
        _imgViewBackground.alpha = 1.0;
        
        _imgView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - _imgView.frame.size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - _imgView.frame.size.height, ([[UIScreen mainScreen] bounds].size.width/scaleRatio), ([[UIScreen mainScreen] bounds].size.height/scaleRatio));
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        
    }completion:^(BOOL finished){
        //do nothing
    }];
    
}

-(void) animationEnd{
    
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:(void (^)(void)) ^{
        
        
        _imgViewBackground.alpha = .6;
        
        _imgView.frame = CGRectMake(_imageFrame.origin.x, _imageFrame.origin.y, _imageFrame.size.width, _imageFrame.size.height);
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        
    }completion:^(BOOL finished){
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
    }];
}


@end
