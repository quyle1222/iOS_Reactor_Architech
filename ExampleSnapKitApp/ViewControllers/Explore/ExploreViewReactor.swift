import ReactorKit
class ExploreViewReactor:Reactor {
    
    init() {
        initialState = State(numberOfList: 0)
    }
    
    var initialState: State
    
    enum Action {
        case setList(Int)
    }
    
    enum Mutation {
        case setList(Int)
    }
    
    struct State {
        var numberOfList:Int
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setList(let number):
            return .just(Mutation.setList(number))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setList(let number):
            state.numberOfList = number
        }
        return state
    }
}
