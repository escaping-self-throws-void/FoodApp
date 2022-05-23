//
//  APIService.swift
//  FoodApp
//
//  Created by Paul Matar on 23/05/2022.
//

import Alamofire

protocol APIProtocol {
    func fetchTabs(completion: @escaping (Result<[Tab], APError>) -> Void)
    func fetchCoffee(completion: @escaping (Result<Coffee, APError>) -> Void)
}

final class APIService: APIProtocol {
    
    func fetchTabs(completion: @escaping (Result<[Tab], APError>) -> Void) {
        AF.request(APIUrls.mockURL).validate().responseDecodable(of: [Tab].self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(_):
                completion(.failure(.invalidData))
            }
        }
    }
    
    func fetchCoffee(completion: @escaping (Result<Coffee, APError>) -> Void) {
        AF.request(APIUrls.realURL).validate().responseDecodable(of: Coffee.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(_):
                completion(.failure(.unableToComplete))
            }
        }
    }
    
    
    static let shared = APIService()
    
    private init(){}
    
}
