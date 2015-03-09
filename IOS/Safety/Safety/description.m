//
//  description.m
//  Safety
//
//  Created by Erick  Alcántar Elías on 08/03/15.
//  Copyright (c) 2015 DERVS. All rights reserved.
//

#import "description.h"

@interface description ()

@end

@implementation description

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    disaster = [[NSUserDefaults standardUserDefaults] objectForKey:@"Disaster"];
    used = [[NSUserDefaults standardUserDefaults] objectForKey:@"used"];
    dis.text = disaster;
    
    if ([disaster isEqualToString:@"Volcanoes"]) {
        if ([used isEqualToString:@"Plan"]) {
            gtitle.text = used;
            des.text = @"Have a disaster plan. \n\nKnow whether or not you are at risk for danger. \n\nBe prepared for mudslides, flash floods, earthquakes, ash falling, acid rain and tsunamis. \n\nPrepare a disaster supplies kit for your home and car. Include a first aid kit, canned food and a can opener, bottled water, battery-operated radio, flashlight, protective clothing, dust mask, goggles and sturdy shoes. \n\nKnow evacuation routes.";
        }else{
            if ([used isEqualToString:@"During"]) {
                gtitle.text = used;
                des.text = @"Follow the evacuation order issued by authorities. \n\nAvoid areas downwind and river valleys downstream of the volcano. \n\nIf your caught indoors, close all windows and doors, put machinery inside a barn, and bring animals inside. \n\nIf you’re trapped outdoors, seek shelter indoors. \n\nProtect yourself when ash falls. Wear long-sleeved shirts and long pants. Use goggles to protect your eyes. Wear a dust mask and keep car engines off.";
            }else{
                if ([used isEqualToString:@"After"]) {
                    gtitle.text = used;
                    des.text = @"Cover you mouth and nose. Volcanic ash can irritate your respiratory system.\n\nWear goggles and protect your eyes. \n\nKeep your skin covered. \n\nClear roofs of ash. The ash is very heavy and can cause the building to collapse.";
                }
            }
        }
    } else{
        if ([disaster isEqualToString:@"Earthquakes"]) {
            if ([used isEqualToString:@"Plan"]) {
                gtitle.text = used;
            }else{
                if ([used isEqualToString:@"During"]) {
                    gtitle.text = used;
                }else{
                    if ([used isEqualToString:@"After"]) {
                        gtitle.text = used;
                    }
                }
            }
        }else{
            if ([disaster isEqualToString:@"Hurricanes"]) {
                if ([used isEqualToString:@"Plan"]) {
                    gtitle.text = used;
                }else{
                    if ([used isEqualToString:@"During"]) {
                        gtitle.text = used;
                    }else{
                        if ([used isEqualToString:@"After"]) {
                            gtitle.text = used;
                        }
                    }
                }
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
