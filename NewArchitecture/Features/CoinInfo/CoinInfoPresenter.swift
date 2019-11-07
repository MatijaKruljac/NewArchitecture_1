//
//  CoinInfoPresenter.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

class CoinInfoPresenter {
    
    private weak var viewController: CoinInfoViewController?
    
    init(viewController: CoinInfoViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Public methods
    
    func show(coinInfoViewModel: CoinInfoViewController.ViewModel) {
        viewController?.viewModel = coinInfoViewModel
    }
    
    func show(error: PrintableError?) {
        viewController?.show(error: error?.description)
    }
}
