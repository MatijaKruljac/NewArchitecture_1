//
//  CoinInfoPresenterMock.swift
//  NewArchitectureTests
//
//  Created by Matija Kruljac on 20/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
@testable import NewArchitecture

class CoinInfoPresenterMock: CoinInfoPresenter {
    
    var coinInfoViewModel: CoinInfoViewController.ViewModel?
    var error: PrintableError?
    
    override func show(coinInfoViewModel: CoinInfoViewController.ViewModel) {
        self.coinInfoViewModel = coinInfoViewModel
    }
    
    override func show(error: PrintableError?) {
        self.error = error
    }
}
