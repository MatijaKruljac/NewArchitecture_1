//
//  APIClientErrors.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

protocol PrintableError: Error {

    var description: String { get }
}

enum LocalError: PrintableError {
    
    case badRequestStructure
    case parsingError
    
    var description: String {
        switch self {
        case .badRequestStructure:
            return "Bad request structure."
        case .parsingError:
            return "Unable to parse data."
        }
    }
}

enum APIError: PrintableError {
    
    case notHTTPResponse
    case invalidResponse
    case invalidStatusCode(code: Int)
    case unknownError
    
    var description: String {
        switch self {
        case .notHTTPResponse:
            return "Not a HTTP response."
        case .invalidResponse:
            return "Invalid response."
        case .invalidStatusCode(let code):
            return "Invalid status code \(code)."
        case .unknownError:
            return "Unknown error occured."
        }
    }
}
