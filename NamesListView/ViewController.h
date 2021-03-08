//
//  ViewController.h
//  NamesListView
//
//  Created by Hala on 19/02/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property NSString* name;
@property NSString* phone;
@property NSString* email;
@property NSString* address;
@property NSString* image;
@property int age;


@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *emailLable;
@property (weak, nonatomic) IBOutlet UILabel *ageLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;

@property (weak, nonatomic) IBOutlet UIImageView *imageLable;

@end

