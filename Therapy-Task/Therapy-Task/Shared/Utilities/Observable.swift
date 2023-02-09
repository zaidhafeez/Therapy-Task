//
//  Observable.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation

class Observable<T> {
    
    typealias listenerBlock = (T) -> Void
    
    private var listener: listenerBlock?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func subcribe(block: @escaping listenerBlock) {
        listener = block
    }
    
    func removeObserver() {
        listener = nil
    }
}
