//
//  ViewController.m
//  AlcoholTaxRebirth
//
//  Created by James Martin on 2/3/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

double totalCost;
double stateTax;

- (IBAction)taxToggle:(id)sender
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            printf("Dont need to move keyboard because we have enough space to see it\n");
        } else {
            printf("Moving keyboard to show more info\n");
            if (_taxToggle.isOn) {
                [_salePrice resignFirstResponder];
            }
            else
            {
                [_salePrice becomeFirstResponder];
            }
        }
    }
    if (_taxToggle.isOn) {
        _showTaxesAddedLabel.text = @"Hide Taxes Added";
        _stateTaxLabel.hidden      = NO;
        _stateTaxLabelPrice.hidden = NO;
        _literTaxLabel.hidden      = NO;
        _literTaxLabelPrice.hidden = NO;
        _totalTaxLabel.hidden      = NO;
        _totalTaxLabelPrice.hidden = NO;
    } else {
        _showTaxesAddedLabel.text = @"Show Taxes Added";
        _stateTaxLabel.hidden      = YES;
        _stateTaxLabelPrice.hidden = YES;
        _literTaxLabel.hidden      = YES;
        _literTaxLabelPrice.hidden = YES;
        _totalTaxLabel.hidden      = YES;
        _totalTaxLabelPrice.hidden = YES;
    }
    
}

-(IBAction)share:(id)sender {
    NSString *text = @"";
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/alcohol-tax/id615735309?mt=8"];
    UIActivityViewController *avController = [[UIActivityViewController alloc] initWithActivityItems:@[text, url] applicationActivities:nil];
    
    [self presentViewController:avController animated:YES completion:nil];
}
-(void)helpButton:(id)sender
{
    NSString *string = @"Type the tag price and the total price including tax will be displayed";
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"How to Use" message:string delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
    
    
//    SFDraggableDialogView *dialogView = [[[NSBundle mainBundle] loadNibNamed:@"SFDraggableDialogView" owner:self options:nil] firstObject];
//    dialogView.frame = self.view.bounds;
//    dialogView.photo = [UIImage imageNamed:@"icon-180"];
//    dialogView.delegate = self;
//    dialogView.titleText = [[NSMutableAttributedString alloc] initWithString:@"Help"];
//    dialogView.messageText = [self exampleAttributeString];
//    dialogView.firstBtnText = [@"See results" uppercaseString];
//    dialogView.dialogBackgroundColor = [UIColor whiteColor];
//    dialogView.cornerRadius = 8.0;
//    dialogView.backgroundShadowOpacity = 0.2;
//    dialogView.hideCloseButton = true;
//    dialogView.showSecondBtn = false;
//    [dialogView.heightAnchor constraintEqualToConstant:100].active = true;
//    [dialogView.widthAnchor constraintEqualToConstant:70].active = true;
//    dialogView.contentViewType = SFContentViewTypeDefault;
//    dialogView.firstBtnBackgroundColor = [UIColor colorWithRed:0.230 green:0.777 blue:0.316 alpha:1.000];
//    
//    [self.view addSubview:dialogView];
    
    
    
    /*
    UIActionSheet *actionsheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail",@"How to Use",@"Rate Me", nil];
    [actionsheet showInView:self.view];
  */
}
/*
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if ([MFMailComposeViewController canSendMail])
        {
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            mailer.mailComposeDelegate = self;
            [mailer setSubject:@"Suggestion/Support"];
            NSArray *toRecipients = [NSArray arrayWithObjects:@"contact@jamesnmartin.com", nil];
            [mailer setToRecipients:toRecipients];
            NSString *emailBody = @"Dear Developer,";
            [mailer setMessageBody:emailBody isHTML:NO];
            [self presentViewController:mailer animated:YES completion:nil];
        }
    }
    if (buttonIndex == 1)
    {
        NSString *string1=  @"Enter the price on the tag and the price with ";
        NSString *string2=  @"tax will automaticlly update as you type.\n";
        NSString *string3=  @"Change the bottle size to see the tax accordinglly.\n";
        NSString *string4=  @"Quick Tip: Shake device to clear fields.\n";
        NSString *string= [NSString stringWithFormat:@"%@%@%@%@",string1,string2,string3,string4];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"How to Use"
                                                            message: string
                                                            delegate: self
                                                            cancelButtonTitle:nil
                                                    otherButtonTitles:@"Dismiss",nil];
    [alert show];
    }
    if (buttonIndex == 2) {
        {
            NSString *stringUrl = @"itms-apps://itunes.apple.com/en/app/id615735309";
            NSURL *url = [NSURL URLWithString:stringUrl];
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    if (buttonIndex == 3) {
        {
            //HUMMMM
        }
    }
}
 */
- (NSMutableAttributedString *)exampleAttributeString {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"You have won"];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:21.0] range:NSMakeRange(9, 3)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.230 green:0.777 blue:0.316 alpha:1.000] range:NSMakeRange(9, 3)];
    
    return attributedString;
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent:
            break;
        case MFMailComposeResultFailed:
            break;
        default:
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (![_salePrice.text isEqual: @""])
    {
        NSDictionary *options = @{
                                  kCRToastTextKey : @"Cleared!",
                                  kCRToastFontKey :[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:20],
                                  kCRToastImageKey:[IonIcons imageWithIcon:ion_ios_checkmark_outline size:36.0 color:[UIColor whiteColor]],
                                  kCRToastTextAlignmentKey : @(NSTextAlignmentLeft),
                                  kCRToastBackgroundColorKey : [UIColor colorWithRed:0.15 green:0.41 blue:0.69 alpha:1.00],
                                  kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
                                  kCRToastSubtitleTextAlignmentKey: @(NSTextAlignmentLeft),
                                  kCRToastAnimationInTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationSpringDampingKey : @(.6),
                                  kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),
                                  kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionTop)
                                  };
        [CRToastManager showNotificationWithOptions:options
                                    completionBlock:^{
                                        NSLog(@"Completed");
                                    }];
        _salePrice.placeholder = @"Enter Sale Price";
        _totalPrice.text = @"$0.00";
        _stateTaxLabelPrice.text = @"$0.00";
        _literTaxLabelPrice.text = @"$0.00";
        _totalTaxLabelPrice.text = @"$0.00";
        _salePrice.text =@"";
        totalCost = 0;
    }
    
    if (![_totalPrice.text isEqual:@"$0.00"])
    {
        _salePrice.placeholder = @"Enter Sale Price";
        _totalPrice.text = @"$0.00";
        _salePrice.text =@"";
        totalCost = 0;
    }
    
}
-(IBAction)size:(id)sender
{
    double salePrice = [_salePrice.text doubleValue];
    while (salePrice >= 0 && _selectSize.selectedSegmentIndex == 0)
    {
        _salePrice.placeholder = @"Enter Sale Price";
        _totalPrice.hidden = NO;
        totalCost = salePrice * salesTax + pintTax + salePrice;
        stateTax = salePrice * salesTax;
        
        
        NSString *stateTaxString = [[NSString alloc]
                                    initWithFormat:@"$%.2f", stateTax];
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat: @"$%.2f for 375mL", totalCost];
        _totalPrice.text = totalString;
        _stateTaxLabelPrice.text = stateTaxString;
        
        
        
        _totalTaxLabelPrice.text = totalString;
        _literTaxLabelPrice.text = @"$1.41";
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _totalTaxLabelPrice.text = @"$0.00";
            _literTaxLabelPrice.text = @"$0.00";
            break;
        }
        if (totalString > 0) {
            break;
        }
    }
    while (salePrice >= 0 && _selectSize.selectedSegmentIndex == 1)
    {
        _salePrice.placeholder = @"Enter Sale Price";
        //_infoLabel.text = @"Total Price:";
        _totalPrice.hidden = NO;
        totalCost = salePrice * salesTax + fifthTax + salePrice;
        stateTax = salePrice * salesTax;
        
        NSString *stateTaxString = [[NSString alloc]
                                    initWithFormat:@"$%.2f", stateTax];
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat: @"$%.2f for 750mL", totalCost];
        _totalPrice.text = totalString;
        _stateTaxLabelPrice.text = stateTaxString;
        
        _totalTaxLabelPrice.text = totalString;
        _literTaxLabelPrice.text = @"$2.82";
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _totalTaxLabelPrice.text = @"$0.00";
            _literTaxLabelPrice.text = @"$0.00";
            break;
        }
        if (totalString > 0) {
            break;
        }
    }
    while (salePrice >= 0 && _selectSize.selectedSegmentIndex == 2)
    {
        _salePrice.placeholder = @"Enter Sale Price";
        //_infoLabel.text = @"Total Price:";
        _totalPrice.hidden = NO;
        totalCost = salePrice * salesTax + halfGalTax + salePrice;
        stateTax = salePrice * salesTax;
        
        NSString *stateTaxString = [[NSString alloc]
                                    initWithFormat:@"$%.2f", stateTax];
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat: @"$%.2f for 1.75L", totalCost];
        _totalPrice.text = totalString;
        _stateTaxLabelPrice.text = stateTaxString;
        
        _totalTaxLabelPrice.text = totalString;
        _literTaxLabelPrice.text = @"$6.59";
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _totalTaxLabelPrice.text = @"$0.00";
            _literTaxLabelPrice.text = @"$0.00";
            break;
        }
        if (totalString > 0) {
            break;
        }
    }
    while (salePrice >= 0 && _selectSize.selectedSegmentIndex == 3)
    {
        _salePrice.placeholder = @"Enter Sale Price";
        //_infoLabel.text = @"Total Price:";
        _totalPrice.hidden = NO;
        totalCost = salePrice * salesTax + fortyTax + salePrice;
        stateTax = salePrice * salesTax;
        
        NSString *stateTaxString = [[NSString alloc]
                                    initWithFormat:@"$%.2f", stateTax];
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat: @"$%.2f for 40oz", totalCost];
        _totalPrice.text = totalString;
        _stateTaxLabelPrice.text = stateTaxString;
        
        _totalTaxLabelPrice.text = totalString;
        _literTaxLabelPrice.text = @"$4.29";
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _totalTaxLabelPrice.text = @"$0.00";
            _literTaxLabelPrice.text = @"$0.00";
            break;
        }
        if (totalString > 0) {
            break;
        }
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.keyboardControls setActiveField:textView];
}
- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [self.view endEditing:YES];
}
- (IBAction)heartButton:(id)sender
{
    printf("YAY!\n");
}
-(void)brightnessChanged
{
    
}
-(void)viewWillAppear:(BOOL)animated
{
    //[self setNeedsStatusBarAppearanceUpdate];
}
/*
- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
 */
-(void)viewWillDisappear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    
    NSArray *fields = @[self.salePrice];
    [self.keyboardControls setVisibleControls:BSKeyboardControlDone];
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];
    
    self.keyboardControls.doneTintColor = [UIColor colorWithRed:0.15 green:0.41 blue:0.69 alpha:1.00];
    
    [_salePrice becomeFirstResponder];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.15 green:0.41 blue:0.69 alpha:1.00];
    //self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    
    [self.heartButton setTitle:nil forState:UIControlStateNormal];
    [self.heartButton setImage:[IonIcons imageWithIcon:ion_ios_heart size:20.0f color:[UIColor lightGrayColor]] forState:UIControlStateNormal];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
