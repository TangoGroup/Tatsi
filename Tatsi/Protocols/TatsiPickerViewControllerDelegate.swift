//
//  TatsiPickerViewControllerDelegate.swift
//  Tatsi
//
//  Created by Rens Verhoeven on 27-03-16.
//  Copyright © 2017 Awkward BV. All rights reserved.
//

import UIKit
import Photos

/// Defines a number of methods that will be called throughout the lifecycle of the TatsiPickerViewController. See the config for more options.
public protocol TatsiPickerViewControllerDelegate: class {

    /// Called when the user has selected assets (and tapped the done button).
    ///
    /// - Parameters:
    ///   - pickerViewController: The PickerViewController that was used.
    ///   - assets: The assets the user has selected, in the order the user has selected them.
    func pickerViewController(_ pickerViewController: UIViewController, didPickAssets assets: [PHAsset])
    
    /// Called when the user has tried to select more assets than the agreed upon max
    ///
    /// - Parameters:
    ///   - pickerViewController: The PickerViewController that was used.
    ///   - max: The maximum allowed selections
   func pickerViewController(_ pickerViewController: UIViewController, didTryExceedingMaxSelections max: Int)
    
    /// Called when the user tapps the cancel button on the PickerViewController. By default this will dismiss the picker, but a custom implementation has to dismiss the picker.
    ///
    /// - Parameter pickerViewController: The PickerViewController that was used..=
    func pickerViewControllerDidCancel(_ pickerViewController: UIViewController)
    
    /// Allows you to customize the text, image or tint of the UIBarButtonItem that is used as the cancel button throughout the app.
    /// The picker will call this method when the cancel button is placed. The target, selector and accessibilityIdentifier of the returned UIBarButtonItem with be overwritten.
    ///
    /// - Parameter pickerViewController: The picker view controller the cancel button will be placed in.
    /// - Returns: The cancel button that should be used inside the picker view controller.
    func cancelBarButtonItem(for pickerViewController: UIViewController) -> UIBarButtonItem?
    
    /// Allows you to customize the text, image or tint of the UIBarButtonItem that is used as the done button throughout the app.
    /// The picker will call this method when the done button is placed. The target, selector and accessibilityIdentifier of the returned UIBarButtonItem with be overwritten.
    ///
    /// - Parameter pickerViewController: The picker view controller the done button will be placed in.
    /// - Returns: The done button that should be used inside the picker view controller.
    func doneBarButtonItem(for pickerViewController: UIViewController) -> UIBarButtonItem?
}

extension TatsiPickerViewControllerDelegate {
    
    public func pickerViewControllerDidCancel(_ pickerViewController: UIViewController) {
        pickerViewController.dismiss(animated: true, completion: nil)
    }
    
    public func cancelBarButtonItem(for pickerViewController: UIViewController) -> UIBarButtonItem? {
        return nil
    }
    
    public func doneBarButtonItem(for pickerViewController: UIViewController) -> UIBarButtonItem? {
        return nil
    }
    
    public func pickerViewController(_ pickerViewController: UIViewController, didTryExceedingMaxSelections max: Int) {
        print("Did try to exceed max selection")
    }
}
