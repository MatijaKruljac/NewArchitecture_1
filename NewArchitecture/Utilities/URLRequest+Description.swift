//
//  URLRequest+Description.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

extension URLRequest {

    var description: String {
        return "\(httpMethod?.uppercased() ?? "") --> \(url?.absoluteString ?? "")"
    }
}
