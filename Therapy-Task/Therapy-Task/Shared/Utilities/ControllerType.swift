//
//  ControllerType.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 09/02/23.
//

import Foundation
import UIKit

enum ControllerType {
    case masterTabBarScreen
    case homeScreen
    case appointmentScreen
    case searchScreen
    case taskScreen
    case profileScreen
    
    func controllerIdentifier() -> String {
        switch self {
        case .masterTabBarScreen:
            return MasterTabBarController.storyboardIdentifier()
        case .homeScreen:
            return HomeViewController.storyboardIdentifier()
        case .appointmentScreen:
            return AppointmentViewController.storyboardIdentifier()
        case .searchScreen:
            return SearchViewController.storyboardIdentifier()
        case .taskScreen:
            return TaskViewController.storyboardIdentifier()
        case .profileScreen:
            return ProfileViewController.storyboardIdentifier()
        }
    }
    
    func controller() -> UIViewController {
        switch self {
        default:
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: controllerIdentifier())
            return controller
        }
    }
    
    func navigationController() -> UINavigationController {
        switch self {
        default:
            let navVC = AppNavigationController(rootViewController: controller())
            return navVC
        }
    }

    
}

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.backgroundColor = .appThemeColor
        let profileButton = UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: self, action: #selector(rightButtonAction))
        let menuButton = UIBarButtonItem(image: UIImage(named: "hamburger"), style: .plain, target: self, action: #selector(rightButtonAction))
        self.topViewController?.navigationItem.rightBarButtonItem  = profileButton
        self.topViewController?.navigationItem.leftBarButtonItem  = menuButton
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        
    }
}
