//
//  DMNContactsTableViewController.m
//  Contacts
//
//  Created by Andrew R Madsen on 8/17/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNContactsTableViewController.h"
#import "DMNPersonController.h"
#import "DMNPerson.h"

@interface DMNContactsTableViewController ()

@end

@implementation DMNContactsTableViewController

- (IBAction)createNewContact:(id)sender
{
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Create Contact"
																			 message:@"Enter name and phone number:"
																	  preferredStyle:UIAlertControllerStyleAlert];
	
	[alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
		textField.placeholder = @"Name";
	}];
	[alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
		textField.placeholder = @"Phone Number";
	}];
	
	UIAlertAction *createAction = [UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		UITextField *nameField = alertController.textFields[0];
		UITextField *phoneNumberField = alertController.textFields[1];
		
		NSString *name = nameField.text;
		NSString *phoneNumber = phoneNumberField.text;
		
		DMNPerson *person = [[DMNPerson alloc] initWithName:name phoneNumber:phoneNumber];
		[[DMNPersonController sharedController] addPerson:person];
		[person release];
		
		[self.tableView reloadData];
	}];
	[alertController addAction:createAction];
	
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	[alertController addAction:cancelAction];
	
	[self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[[DMNPersonController sharedController] people] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
	
	DMNPersonController *controller = [DMNPersonController sharedController];
	DMNPerson *person = controller.people[indexPath.row];
	cell.textLabel.text = person.name;
	cell.detailTextLabel.text = person.phoneNumber;
	
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		DMNPersonController *controller = [DMNPersonController sharedController];
		DMNPerson *person = controller.people[indexPath.row];
		[controller deletePerson:person];
		
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
