//
//  SearchViewModel.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation

class SearchViewModel {
    var therapyList = Observable<[TherapyListDetail]>(value: [])
    
    func getTherapyList() {
        searchRepository.getTherapyList { [weak self] response in
            switch response {
            case .success(let data):
                self?.therapyList.value = data.therapyList
            case .failure:
                break
            }
        }
    }
}

extension SearchViewModel: SearchRepositoryInjection {}
