//
//  CoinInfoList.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

struct CoinInfoList: Decodable {
    
    let success: Bool
    let minimalOrderBTC: String
    let info: [CoinInfo]
}
