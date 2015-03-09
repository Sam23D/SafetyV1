//
//  FirstViewController.h
//  Safety
//
//  Created by moviles on 3/8/15.
//  Copyright (c) 2015 DERVS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController<CLLocationManagerDelegate, GMSMapViewDelegate, UIAlertViewDelegate>{
    
    NSString *latitude;
    NSString *longitude;
    NSString *altitude;
    NSDictionary *resName;
    NSDictionary *res;
    NSArray *pathline;
    
    GMSMutablePath *path;
    
    double latitudD;
    double longitudD;
    
}

@property NSString *toLatitude;
@property NSString *toLongitude;
@property NSString *toAltitude;
@property (nonatomic, retain) CLLocationManager *localizador;
@property (nonatomic, strong) NSMutableData *responseData;

@end
