//
//  FriendsDetails.h
//  NamesListView
//
//  Created by Hala on 19/02/2021.
//

#import <Foundation/Foundation.h>



@interface FriendsDetails : NSObject


@property NSString* name;
@property NSString* phone;
@property NSString* email;
@property NSString* address;
@property NSString* image;
@property int age;

-(id) initWithName: (NSString*) name phone: (NSString*) phone email: (NSString*) email address: (NSString*) address image: (NSString*) image age: (int) age;



@end

