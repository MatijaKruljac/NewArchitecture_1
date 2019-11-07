//
//  RxSingle+QueueScheduler.swift
//  NewArchitecture
//
//  Created by Matija Kruljac on 19/10/2019.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import Foundation
import RxSwift

extension Single {
    
    func subscribeOnBackgroundObserveOnMain() -> PrimitiveSequence<Trait, Element> {
        return subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
    }
}
