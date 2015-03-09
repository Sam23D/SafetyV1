//
//  description.h
//  Safety
//
//  Created by Erick  Alcántar Elías on 08/03/15.
//  Copyright (c) 2015 DERVS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface description : UIViewController{
    
    __weak IBOutlet UILabel *gtitle;
    __weak IBOutlet UILabel *des;
    NSString *disaster;
    NSString *used;
    __weak IBOutlet UILabel *dis;
}
- (IBAction)back:(id)sender;

@end
