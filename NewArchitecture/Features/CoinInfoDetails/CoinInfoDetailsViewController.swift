//
//  CoinInfoDetailsViewController.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 20/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension CoinInfoDetailsViewController {
    
    struct ViewModel {
        let name: String
        let symbol: String
        let walletStatus: String?
        let minDepositAmount: Double?
        let minOrderAmount: Double?
        
        init(coinInfo: CoinInfo) {
            self.name = coinInfo.name
            self.symbol = coinInfo.symbol
            self.walletStatus = coinInfo.walletStatus
            self.minDepositAmount = coinInfo.minDepositAmount
            self.minOrderAmount = coinInfo.minOrderAmount
        }
    }
}

class CoinInfoDetailsViewController: UIViewController {
    
    var viewModel: ViewModel? {
        didSet {
            title = "\(viewModel?.name ?? "")"
            nameLabel.text = "Name: \(viewModel?.name ?? "")"
            symbolLabel.text = "Symbol: \(viewModel?.symbol ?? "")"
            walletStatusLabel.text = "Wallet Status: \(viewModel?.walletStatus ?? "")"
            minDepositAmountLabel.text = "Min Deposit Amount: \(viewModel?.minDepositAmount ?? 0)"
            minOrderAmountLabel.text = "Min Order Amount \(viewModel?.minOrderAmount ?? 0)"
        }
    }
    
    private let nameLabel = UILabel()
    private let symbolLabel = UILabel()
    private let walletStatusLabel = UILabel()
    private let minDepositAmountLabel = UILabel()
    private let minOrderAmountLabel = UILabel()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel,
            symbolLabel,
            minDepositAmountLabel,
            minDepositAmountLabel,
            minOrderAmountLabel
        ])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackView()
    }
}

// MARK: - Private methods
private extension CoinInfoDetailsViewController {
    
    func setupStackView() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview().priority(.low)
            $0.height.equalTo(240).priority(.high)
        }
    }
}
