//
//  ErrorMock.swift
//  NewArchitectureTests
//
//  Created by Matija Kruljac on 20/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
@testable import NewArchitecture

class ErrorMock: PrintableError {
    
    var description: String {
        return "Test failure: could not cast to type T"
    }
}
