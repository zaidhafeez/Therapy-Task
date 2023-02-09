//
//  SearchUseCase.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation

protocol SearchRepositoryInjection {}
extension SearchRepositoryInjection {
    var searchRepository: SearchAPIRepositoryProtocol {
        return AppDependency.searchAPIRepository
    }
}

protocol SearchAPIRepositoryProtocol {
    func getTherapyList(completion: @escaping (Response<TherapyList>) -> Void)
}
struct SearchUseCase: SearchAPIRepositoryProtocol {
    func getTherapyList(completion: @escaping (Response<TherapyList>) -> Void) {
        networkManager.loadRequest(completion: completion)
    }
}

extension SearchUseCase: NetworkManagerInjection {}
