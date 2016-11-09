//
//  ViewController.h
//  TKJSON
//
//  Created by Felix ITs 04 on 09/11/16.
//  Copyright © 2016 Tushar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSArray *array;
    NSMutableData *jsonData;
    NSDictionary *dataDataDictionary;
    NSURLConnection *urlConnection;
    
}


@end

