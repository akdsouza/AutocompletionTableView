//
//  ACDViewController.m
//  AutocompletionTableView_Demo
//
//  Created by Gushin Arseniy on 13.03.12.
//  Copyright (c) 2012 Arseniy Gushin. All rights reserved.
//

#import "ACDViewController.h"
#import "AutocompletionTableView.h"

@interface ACDViewController ()
@property (nonatomic, strong) AutocompletionTableView *autoCompleter;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ACDViewController

@synthesize textField = _textField;
@synthesize autoCompleter = _autoCompleter;

- (AutocompletionTableView *)autoCompleter
{
    if (!_autoCompleter)
    {
        NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];
        [options setValue:[NSNumber numberWithBool:NO] forKey:ACOCaseSensitive];
        [options setValue:nil forKey:ACOUseSourceFont];
        
        _autoCompleter = [[AutocompletionTableView alloc] initWithTextField:self.textField inViewController:self withOptions:options];
        _autoCompleter.suggestionsDictionary = [NSArray arrayWithObjects:@"hostel",@"caret",@"carrot",@"house",@"horse", nil];
    }
    return _autoCompleter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.textField.delegate = self.autoCompleter;
}

- (IBAction)caseSwitchChanged:(UISwitch *)sender 
{
    NSMutableDictionary *options = [self.autoCompleter.options mutableCopy];
    [options setValue:[NSNumber numberWithBool:sender.on] forKey:ACOCaseSensitive];
    self.autoCompleter.options = options;
}

@end
