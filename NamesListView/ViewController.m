//
//  ViewController.m
//  NamesListView
//
//  Created by Hala on 19/02/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _name;
    
    _imageLable.image = [UIImage imageNamed:_image];
    _nameLable.text = _name;
    _addressLable.text = [_address stringByAppendingString: @", Egypt"];
    _emailLable.text = _email;
    _phoneLable.text = _phone;
    _ageLable.text = [NSString stringWithFormat:@"%d",_age];
}


@end
