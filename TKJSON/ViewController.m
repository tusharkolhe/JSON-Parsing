//
//  ViewController.m
//  TKJSON
//
//  Created by Felix ITs 04 on 09/11/16.
//  Copyright © 2016 Tushar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url=[NSURL URLWithString:@"http://api.androidhive.info/json/movies.json"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error!=nil) {
            
            NSLog(@"%@",error.localizedDescription);
            
        }else if(response)
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            
            if (httpResponse.statusCode==200)
            {
                if (data)
                {
                    NSError *error;
                    NSArray *jsonArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    if (error) {
                        NSLog(@"%@",error.localizedDescription);
                    }
                    
                    
                else
                {
                    [self performSelectorOnMainThread:@selector(displayData:) withObject:jsonArray waitUntilDone:NO];
                }
            }
        }
    }
    
    }];[dataTask resume];


}

-(void)displayData:(NSArray *)jsonArray
{
    NSLog(@"%@",jsonArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
