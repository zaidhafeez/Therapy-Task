//
//  UIViewControllerExtension.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 09/02/23.
//

import Foundation
import UIKit

extension UIViewController {
    static func storyboardIdentifier() -> String {
        return className()
    }
}
