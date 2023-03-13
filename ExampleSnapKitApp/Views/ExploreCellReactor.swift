//
//  ExploreCellReactor.swift
//  ExampleSnapKitApp
//
//  Created by Tú Phạm on 13/03/2023.
//

import ReactorKit
import RxCocoa
import RxSwift

class ExploreCellReactor:Reactor {
    
    enum Action {
        case setList(Int)
    }
    
    enum Mutation {
        case setList(Int)
    }
    
    var initialState: State
    
    struct State {
    }
    
    init() {
        initialState = State()
    }
    
  
}
