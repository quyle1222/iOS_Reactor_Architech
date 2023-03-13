//
//  ExploreCellReactor.swift
//  ExampleSnapKitApp
//
//  Created by Tú Phạm on 13/03/2023.
//

import ReactorKit
import RxCocoa
import RxSwift

class ExploreCellReactor {
    typealias Action = NoAction

     let initialState: NoAction

     init(task: NoAction) {
       self.initialState = task
     }
}
