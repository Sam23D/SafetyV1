//
//  manual.m
//  Safety
//
//  Created by Erick  Alcántar Elías on 08/03/15.
//  Copyright (c) 2015 DERVS. All rights reserved.
//

#import "manual.h"
#import "description.h"

@interface manual ()

@end

@implementation manual

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dis.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"Disaster"];
    guide = [[NSMutableArray alloc] init];
    [guide addObject:@"Plan"];
    [guide addObject:@"During"];
    [guide addObject:@"After"];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [guide count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    //Customize cell
    cell.textLabel.text = [guide objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    p = [guide objectAtIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:p forKey:@"used"];
    
    description *controller = (description *) [self.storyboard instantiateViewControllerWithIdentifier:@"descriptionvc"];
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
