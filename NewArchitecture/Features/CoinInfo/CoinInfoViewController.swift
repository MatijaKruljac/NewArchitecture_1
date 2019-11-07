//
//  ViewController.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import UIKit
import SnapKit

extension CoinInfoViewController {
    
    struct ViewModel {
        
        let minimalOrderBTC: String
        let info: [CoinInfo]
        
        init(coinInfoList: CoinInfoList) {
            self.minimalOrderBTC = coinInfoList.minimalOrderBTC
            self.info = coinInfoList.info
        }
    }
}

class CoinInfoViewController: UIViewController {
    
    private let label = UILabel()
    private let tableView = UITableView()
    
    private lazy var coordinator = CoinInfoCoordinator(viewController: self)
    
    var viewModel: ViewModel? {
        didSet {
            label.text = "Minimal order BTC: \(viewModel?.minimalOrderBTC ?? "")"
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coin Info"
        view.backgroundColor = .white
        addSubviews()
        setupLabel()
        setupTableView()
        loadData()
    }
}

// MARK: - Public methods
extension CoinInfoViewController {
    
    func show(error: String?) {
        coordinator.presentError(error: error)
    }
}

// MARK: - Private methods
private extension CoinInfoViewController {
    
    func addSubviews() {
        view.addSubview(label)
        view.addSubview(tableView)
    }
    
    func setupLabel() {
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.backgroundColor = .green
        label.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tableView.snp.top)
            $0.height.equalTo(56)
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func loadData() {
        coordinator.fetchCoinInfoList()
    }
}

// MARK: - UITableViewDataSource
extension CoinInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.info.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?.info[indexPath.row].name
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CoinInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coinInfo = viewModel?.info[indexPath.row] else {
            return
        }
        coordinator.presentDetails(for: coinInfo)
    }
}
