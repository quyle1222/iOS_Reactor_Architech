import ReactorKit
import RxSwift
import RxCocoa

class HomeViewReactor:Reactor {
    var initialState: State
    enum Action {
        case didTapLogin(AuthInput)
        case didTapShowHidden
    }
    
    enum Mutation {
        case setLoading(Bool)
        case setShowPassword
        case setLogged(Bool)
    }
    
    struct State {
        var isLoading:Bool
        var logged:Bool
        var isShowPassword:Bool
    }
    
    
    init() {
        self.initialState = State(isLoading: false,
                                  logged: false,
                                  isShowPassword: false)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapLogin(let model):
            let setLoading:Observable<Mutation> = .just(Mutation.setLoading(true))
            let fetchUser:Observable<Mutation> = AuthRespository().requestLogin(data: model).map { model in
                Mutation.setLogged(model.success)
            }
            let setFinish:Observable<Mutation> = .just(Mutation.setLoading(false))
            return Observable<Mutation>.concat([setLoading,fetchUser,setFinish])
        case .didTapShowHidden:
            return .just(Mutation.setShowPassword)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setLoading(let isLoading):
            state.isLoading = isLoading
            break
        case .setShowPassword:
            state.isShowPassword = !state.isShowPassword
            break
        case .setLogged(let isLogged):
            state.isLoading = false
            state.logged = isLogged
        }
        return state
    }
}
