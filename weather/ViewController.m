//
//  ViewController.m
//  weather
//
//  Created by traidocthan47 on 11/20/15.
//  Copyright (c) 2015 traidocthan47. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLable;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];

}
- (IBAction)tempertureTouch:(id)sender {
    if ([self.temperatureLable.text  isEqual: @"C"]) {
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f", [self getFahrenheit]] forState:UIControlStateNormal];
        self.temperatureLable.text = @"F";
    }else{
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f", [self getCelsius]] forState:UIControlStateNormal];
        self.temperatureLable.text = @"C";
        
    }
}
- (float)  getCelsius {
    NSLog(@"%@",self.temperature.currentTitle);
    return ([self.temperature.currentTitle floatValue]-32)/1.8;
}
- (float) getFahrenheit {
    NSLog(@"%@",self.temperature.currentTitle);
    return [self.temperature.currentTitle floatValue]*1.8+32;
}

- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(locations.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}
- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
