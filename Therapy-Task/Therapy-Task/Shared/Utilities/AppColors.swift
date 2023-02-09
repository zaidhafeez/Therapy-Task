//
//  AppColors.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation
import UIKit

private struct AppColors {
    static let appThemeColor = "AppThemeColor"
}

extension UIColor {
    static var appThemeColor: UIColor {
        getColor(name: AppColors.appThemeColor)
    }
    
    
    private static func getColor(name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            fatalError("App Color assets: \(name) not defined")
        }
        return color
    }
}
