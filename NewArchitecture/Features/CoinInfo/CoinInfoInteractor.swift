//
//  CoinInfoInteractor.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import RxSwift

class CoinInfoInteractor {
    
    private let apiClient: MockableAPIClient
    private let presenter: CoinInfoPresenter
    private let disposeBag = DisposeBag()
    
    init(apiClient: MockableAPIClient = APIClient.shared, presenter: CoinInfoPresenter) {
        self.apiClient = apiClient
        self.presenter = presenter
    }
    
    // MARK: - Public methods
    
    func fetchCoinInfoList() {
        guard let request = APIRequest.coinInfo.generated else {
            return
        }
        let single: Single<CoinInfoList> = apiClient.send(request: request)
        single
            .subscribeOnBackgroundObserveOnMain()
            .subscribe { [weak self] event in
                switch event {
                case .success(let coinInfoList):
                    let viewModel = CoinInfoViewController.ViewModel(coinInfoList: coinInfoList)
                    self?.presenter.show(coinInfoViewModel: viewModel)
                case .error(let error):
                    let printableError = error as? PrintableError
                    self?.presenter.show(error: printableError)
                }
        }.disposed(by: disposeBag)
    }
}
