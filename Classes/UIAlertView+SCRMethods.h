//
//  UIAlertView+SCRMethods.h
//  TouchCustoms
//
//  Created by Aleks Nesterow-Rutkowski on 3/14/10.
//	aleks@screencustoms.com
//	
//	Purpose
//	Extension methods for UIAlertView.
//

@interface UIAlertView (SCRMethods)

/**
 * @remarks
 *		The UIAlertView creation method lets you keep the dialog localized in case you provide translation
 *		for "Yes" and "No" strings in your Localizable.strings file.
 */
+ (void)showYesNoAlertWithMessage:(NSString *)message delegate:(id)delegate;

/**
 * @remarks
 *		The UIAlertView creation method lets you keep the dialog localized in case you provide translation
 *		for "Yes" and "No" strings in your Localizable.strings file.
 */
+ (UIAlertView *)yesNoAlertViewWithMessage:(NSString *)message delegate:(id)delegate;

/**
  * Uses [error localizedFailureReason] as UIAlertView title and [error localizedDescription] as its message.
  * 
  * @remarks
  *		The UIAlertView creation method lets you keep the dialog localized in case you provide translation
  *		for "OK" string in your Localizable.strings file.
  */
+ (UIAlertView *)alertViewFromError:(NSError *)error;

/**
  * There is often need to just show UIAlertView with a custom message and OK button without providing a delegate
  * or any custom buttons.
  * 
  * @remarks
  *		The UIAlertView creation method lets you keep the dialog localized in case you provide translation
  *		for "OK" string in your Localizable.strings file.
  */
+ (void)showWithMessage:(NSString *)message;
+ (void)showWithTitle:(NSString *)title message:(NSString *)message;

@end
