//
//  CoinInfoCoordinator.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation

class CoinInfoCoordinator {
    
    private let interactor: CoinInfoInteractor
    private let router: CoinInfoRouter
    
    init(viewController: CoinInfoViewController) {
        let presenter = CoinInfoPresenter(viewController: viewController)
        interactor = CoinInfoInteractor(presenter: presenter)
        router = CoinInfoRouter(navigationController: viewController.navigationController)
    }
    
    // MARK: - Public methods
    
    func fetchCoinInfoList() {
        interactor.fetchCoinInfoList()
    }
    
    func presentDetails(for coinInfo: CoinInfo) {
        router.presentDetails(for: coinInfo)
    }
    
    func presentError(error: String?) {
        router.presentAlert(title: "Error", message: error)
    }
}
