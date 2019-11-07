//
//  APIRequest.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

enum APIRequest {
    
    case coinInfo
    
    var generated: URLRequest? {
        switch self {
        case .coinInfo:
            return createRequest(path: "/coinInfo")
        }
    }
    
    private func createRequest(path: String, parameters: [String: String]? = nil) -> URLRequest? {
        guard let url = createUrlWithComponents(from: APIConstants.infoUrl + path, with: parameters) else {
            return nil
        }
        
        return URLRequest(url: url)
    }
    
    private func createUrlWithComponents(from urlString: String, with queryParameters: [String: String]?) -> URL? {
        guard var urlComponents = URLComponents(string: urlString),
            let queryParameters = queryParameters else {
                return URL(string: urlString)
        }
        
        let newQueryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        if let queryItems = urlComponents.queryItems {
            urlComponents.queryItems = queryItems + newQueryItems
        } else {
            urlComponents.queryItems = newQueryItems
        }
        
        return urlComponents.url
    }
}
