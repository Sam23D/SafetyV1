//
//  SecondViewController.m
//  Safety
//
//  Created by moviles on 3/8/15.
//  Copyright (c) 2015 DERVS. All rights reserved.
//

#import "SecondViewController.h"
#import "manual.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    emergency = [[NSMutableArray alloc] init];
    [emergency addObject:@"Volcanoes"];
    [emergency addObject:@"Earthquakes"];
    [emergency addObject:@"Hurricanes"];
    imagesName = [[NSArray alloc] initWithObjects: @"volcano.png", @"cracked2.png", @"tsunami1.png",nil];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [emergency count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    
    cell.imageView.image = [UIImage imageNamed:imagesName[indexPath.row % 3]];
    //customize cell
    cell.textLabel.text = [emergency objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    disaster = [emergency objectAtIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:disaster forKey:@"Disaster"];
    NSLog(@"Disaster: %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Disaster"]);
    
    manual *controller = (manual *) [self.storyboard instantiateViewControllerWithIdentifier:@"manualvc"];
    [self presentViewController:controller animated:YES completion:nil];
}

@end

