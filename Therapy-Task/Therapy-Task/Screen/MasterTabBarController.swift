//
//  MasterTabBarController.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 09/02/23.
//

import UIKit

enum TabBarControllerType: CaseIterable {
    case home
    case appointment
    case search
    case task
    case profile
    
    func controller() -> UIViewController {
        switch self {
        case .home:
            return ControllerType.homeScreen.navigationController()
        case .appointment:
            return ControllerType.appointmentScreen.navigationController()
        case .search:
            return ControllerType.searchScreen.navigationController()
        case .task:
            return ControllerType.taskScreen.navigationController()
        case .profile:
            return ControllerType.profileScreen.navigationController()
        }
    }
    
    func tabBarIcon() -> UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home")
        case .appointment:
            return UIImage(named: "calendar")
        case .search:
            return UIImage(named: "search")
        case .task:
            return UIImage(named: "clipboard")
        case .profile:
            return UIImage(named: "user")
        }
    }
    
    func tabBarSelectedIcon() -> UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home-fill")
        case .appointment:
            return UIImage(named: "calendar-fill")
        case .search:
            return UIImage(named: "search-fill")
        case .task:
            return UIImage(named: "clipboard")
        case .profile:
            return UIImage(named: "user-fill")
        }
    }
    
}

class MasterTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var tabBarControllers: [UIViewController] = []
        for controllerType in TabBarControllerType.allCases {
            let controller = controllerType.controller()
            controller.tabBarItem.image = controllerType.tabBarIcon()
            controller.tabBarItem.selectedImage = controllerType.tabBarSelectedIcon()
            tabBarControllers.append(controller)
        }
        self.viewControllers = tabBarControllers
        tabBar.backgroundColor = .appThemeColor
        
    }

}
