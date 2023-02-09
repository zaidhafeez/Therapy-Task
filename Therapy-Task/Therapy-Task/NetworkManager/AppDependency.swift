//
//  AppDependency.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation

struct AppDependency {
    static var networkManager: BaseAPIProtocol {
        BaseAPIClient()
    }
    
    static var searchAPIRepository: SearchAPIRepositoryProtocol {
        SearchUseCase()
    }
}
