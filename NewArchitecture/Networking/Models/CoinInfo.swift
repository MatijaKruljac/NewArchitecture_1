//
//  CoinInfo.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

struct CoinInfo: Decodable {
    
    let name: String
    let symbol: String
    let walletStatus: String?
    let minDepositAmount: Double?
    let minOrderAmount: Double?
}
