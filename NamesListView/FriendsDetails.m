//
//  FriendsDetails.m
//  NamesListView
//
//  Created by Hala on 19/02/2021.
//

#import "FriendsDetails.h"

@implementation FriendsDetails

-(id) initWithName: (NSString*) name phone: (NSString*) phone email: (NSString*) email address: (NSString*) address image: (NSString*) image age: (int) age{
    
    self = [super init];
    
    if(self){
        self.name = name;
        self.phone = phone;
        self.email = email;
        self.address = address;
        self.image = image;
        self.age = age;
    }
    
    return self;
}

@end
