//
//  CoinInfoInteractorShould.swift
//  NewArchitectureTests
//
//  Created by Matija Kruljac on 20/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RxSwift
@testable import NewArchitecture

class CoinInfoInteractorShould: QuickSpec {
    
    override func spec() {
        var presenterMock: CoinInfoPresenterMock!
        var apiClientMock: APIClientMock!
        var sut: CoinInfoInteractor!
        
        beforeEach {
            presenterMock = CoinInfoPresenterMock(viewController: CoinInfoViewController())
            apiClientMock = APIClientMock()
            sut = CoinInfoInteractor(apiClient: apiClientMock, presenter: presenterMock)
        }
        
        afterEach {
            presenterMock = nil
            apiClientMock = nil
            sut = nil
        }
        
        describe("func fetchCoinInfoList()") {
            context("and an error did not occur while fetching data") {
                it("should fetch coin info list and present it") {
                    let coinInfoTest = CoinInfo(name: "testname",
                                                symbol: "testSymbol",
                                                walletStatus: "walletTest",
                                                minDepositAmount: 0,
                                                minOrderAmount: 0)
                    let coinInfoListTest = CoinInfoList(success: true,
                                                        minimalOrderBTC: "test",
                                                        info: [coinInfoTest])
                    apiClientMock.model = coinInfoListTest
                    
                    sut.fetchCoinInfoList()
                    
                    expect(apiClientMock.model)
                        .toEventually(beAKindOf(CoinInfoList.self))
                    expect((apiClientMock.model as! CoinInfoList)
                        .minimalOrderBTC)
                        .toEventually(match(coinInfoListTest.minimalOrderBTC))
                    expect((apiClientMock.model as! CoinInfoList)
                        .info.count) == coinInfoListTest.info.count
                    expect((apiClientMock.model as! CoinInfoList)
                        .info.first!.name)
                        .toEventually(match(coinInfoListTest.info.first!.name))
                    expect(presenterMock.coinInfoViewModel?.minimalOrderBTC)
                        .toEventually(match(coinInfoListTest.minimalOrderBTC))
                }
                
                context("and an error occurred while fetching data") {
                    it("should tell presenter to show error") {
                        apiClientMock.apiError = .invalidStatusCode(code: 404)
                        
                        sut.fetchCoinInfoList()
                        
                        expect(apiClientMock.model).toEventually(beNil())
                        expect(presenterMock.error).toEventuallyNot(beNil())
                        expect(presenterMock.error?.description)
                            .toEventually(match(apiClientMock.apiError?.description))
                    }
                }
            }
        }
    }
}
