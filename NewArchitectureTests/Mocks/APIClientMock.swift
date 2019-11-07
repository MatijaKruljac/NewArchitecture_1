//
//  APIClientMock.swift
//  NewArchitectureTests
//
//  Created by Matija Kruljac on 20/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import RxSwift
@testable import NewArchitecture

class APIClientMock: MockableAPIClient {
    
    var localError: LocalError?
    var apiError: APIError?
    var model: Decodable?
    
    func send<T: Decodable>(request: URLRequest) -> Single<T> {
        if let localError = localError {
            return Single.error(localError)
        }
        if let apiError = apiError {
            return Single.error(apiError)
        }
        guard let model = model as? T else {
            return Single.error(ErrorMock())
        }

        return Single.just(model)
    }
}
