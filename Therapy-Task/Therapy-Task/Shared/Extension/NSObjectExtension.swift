//
//  NSObjectExtension.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 09/02/23.
//

import Foundation

extension NSObject {
    static func className() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
