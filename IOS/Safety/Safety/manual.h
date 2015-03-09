//
//  manual.h
//  Safety
//
//  Created by Erick  Alcántar Elías on 08/03/15.
//  Copyright (c) 2015 DERVS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface manual : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *guide;
    NSString *p;
    __weak IBOutlet UILabel *dis;
}
- (IBAction)back:(id)sender;

@end
