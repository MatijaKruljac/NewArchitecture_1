//
//  APIClient.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import RxSwift

protocol MockableAPIClient {
    
    func send<T: Decodable>(request: URLRequest) -> Single<T>
}

class APIClient: MockableAPIClient {
    
    static let shared = APIClient()
    
    private let session = URLSession.shared
    
    private init() {}
    
    func send<T: Decodable>(request: URLRequest) -> Single<T> {
        return Single<T>.create { [weak self] single in
            
            print(request.description)
            
            guard let `self` = self else {
                return Disposables.create {}
            }
            
            let task = self.session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let error = error {
                    single(.error(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    single(.error(APIError.notHTTPResponse))
                    return
                }
                
                let code = response.statusCode
                
                guard (200..<300).contains(code) else {
                    single(.error(APIError.invalidStatusCode(code: code)))
                    return
                }
                
                guard let data = data else {
                    single(.error(APIError.invalidResponse))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    single(.success(result))
                } catch {
                    single(.error(LocalError.parsingError))
                }
            })
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
