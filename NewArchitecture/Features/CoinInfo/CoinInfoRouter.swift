//
//  CoinInfoRouter.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import UIKit

class CoinInfoRouter {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    
    func presentDetails(for coinInfo: CoinInfo) {
        let detailsViewController = CoinInfoDetailsViewController()
        detailsViewController.viewModel = CoinInfoDetailsViewController.ViewModel(coinInfo: coinInfo)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func presentAlert(title: String? = nil, message: String? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
