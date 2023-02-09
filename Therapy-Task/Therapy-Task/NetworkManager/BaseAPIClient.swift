//
//  BaseAPIClient.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation

protocol NetworkManagerInjection {}
extension NetworkManagerInjection {
    var networkManager: BaseAPIProtocol {
        return AppDependency.networkManager
    }
}

enum Response<T> {
    case success(T)
    case failure(String)
}

protocol BaseAPIProtocol {
    func loadRequest<T: Decodable>(completion: @escaping (Response<T>) -> Void)
}

class BaseAPIClient: BaseAPIProtocol {
    func loadRequest<T: Decodable>(completion: @escaping (Response<T>) -> Void) {
        guard let url = URL(string: "https://mindmyscape.localserverpro.com/api/doctor/therapies") else {
            return
        }
        let urlRequest = URLRequest(url: url)
         URLSession.shared.dataTask(with: urlRequest) { data, urlresponse, error in
             guard let responseData = data else {
                 return
             }
             do{
                 let model = try JSONDecoder().decode(T.self, from: responseData)
                 completion(.success(model))
             }catch let parsingError {
                 completion(.failure(parsingError.localizedDescription))
             }
         }.resume()
    }
}
