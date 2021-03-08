//
//  FriendsTableViewController.m
//  NamesListView
//
//  Created by Hala on 19/02/2021.
//

#import "FriendsTableViewController.h"

@interface FriendsTableViewController (){
    NSMutableArray<FriendsDetails*> *male;
    NSMutableArray<FriendsDetails*> *female;
}

@end

@implementation FriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    male = [NSMutableArray new];
    female = [NSMutableArray new];
    
    // male objects
    FriendsDetails *friendMale1 = [[FriendsDetails alloc] initWithName: @"Ahmed" phone: @"012345678" email: @"Ahmed@gmail.com" address: @"Alexandria" image: @"1"  age: 24];

    [male addObject: friendMale1];
    
    FriendsDetails *friendMale2 = [[FriendsDetails alloc] initWithName: @"Mohammed" phone: @"012345678" email: @"Mohammed@gmail.com" address: @"Cairo" image: @"2"  age: 22];
    [male addObject: friendMale2];
    
    FriendsDetails *friendMale3 = [[FriendsDetails alloc] initWithName: @"Bavly" phone: @"023456764" email: @"Bavly@gmail.com" address: @"Cairo" image: @"3" age: 10];
    [male addObject: friendMale3];
    
    
    // female objects
    FriendsDetails *friendFemale1 = [[FriendsDetails alloc] initWithName: @"Hala" phone: @"012345678" email: @"Hala@gmail.com" address: @"Desouq" image: @"14" age: 22];
    [female addObject: friendFemale1];
    
    FriendsDetails *friendFemale2 = [[FriendsDetails alloc] initWithName: @"Muna" phone: @"012345678" email: @"Muna@gmail.com" address: @"Ismailia" image: @"12" age: 24];
    [female addObject: friendFemale2];
    
    FriendsDetails *friendFemale3 = [[FriendsDetails alloc] initWithName: @"Esraa" phone: @"023456764" email: @"Esraa@gmail.com" address: @"Dakahlya" image: @"13" age: 50];
    [female addObject: friendFemale3];
    
    FriendsDetails *friendFemale4 = [[FriendsDetails alloc] initWithName: @"Mariam" phone: @"023456764" email: @"Mariam@gmail.com" address: @"Souhag" image: @"11" age: 44];
    [female addObject: friendFemale4];

    
    
   // male addObject: FriendsDetails allo
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger numberOfRows = 0;
    
    switch (section) {
        case 0:
            numberOfRows =  [male count];
            break;
            
        case 1:
            numberOfRows = [female count];
            break;
            
    }
    return numberOfRows;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"friendCell"];
    }
    
    NSString *img;
    
    switch ([indexPath section]) {
        case 0:
            img = [male objectAtIndex:indexPath.row].image;
            //cell.imageView.image = [UIImage imageNamed: [male objectAtIndex:indexPath.row].image];
            cell.textLabel.text = [male objectAtIndex:indexPath.row].name;
            cell.imageView.image = [UIImage imageNamed: img];
            break;
            
        case 1:
            img = [female objectAtIndex:indexPath.row].image;
            cell.textLabel.text = [female objectAtIndex:indexPath.row].name;
            cell.imageView.image = [UIImage imageNamed: img];
            break;
    }
    
    cell.layer.borderWidth = 0.3;
    cell.layer.cornerRadius = 10;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *titleOfHeader = @"";
    
    switch (section) {
        case 0:
            titleOfHeader = @"Male";
            break;
            
        case 1:
            titleOfHeader = @"Female";
            break;
    }
    
    return titleOfHeader;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // navigator
    
    ViewController *detailsView = [self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    
    switch ([indexPath section]) {
        case 0:
            
            detailsView.name = [male objectAtIndex:indexPath.row].name;
            detailsView.image = [male objectAtIndex:indexPath.row].image;
            detailsView.phone = [male objectAtIndex:indexPath.row].phone;
            detailsView.email = [male objectAtIndex:indexPath.row].email;
            detailsView.address = [male objectAtIndex:indexPath.row].address;
            detailsView.age = [male objectAtIndex:indexPath.row].age;
            
            break;
            
        case 1:
            
            detailsView.name = [female objectAtIndex:indexPath.row].name;
            detailsView.image = [female objectAtIndex:indexPath.row].image;
            detailsView.phone = [female objectAtIndex:indexPath.row].phone;
            detailsView.email = [female objectAtIndex:indexPath.row].email;
            detailsView.address = [female objectAtIndex:indexPath.row].address;
            detailsView.age = [female objectAtIndex:indexPath.row].age;
            
            break;
    }
    
    
    [self.navigationController pushViewController:detailsView animated:YES];
    
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        switch ([indexPath section]) {
            case 0:
                [male removeObjectAtIndex:indexPath.row];
                break;
                
            case 1:
                [female removeObjectAtIndex:indexPath.row];
                break;
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (IBAction)addObjectButton:(id)sender {
    FriendsDetails *friendMale1 = [[FriendsDetails alloc] initWithName: @"Ahmed" phone: @"012345678" email: @"Ahmed@gmail.com" address: @"Alexandria" image: @"1"  age: 24];

    [male addObject: friendMale1];
    [self.tableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/





/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
