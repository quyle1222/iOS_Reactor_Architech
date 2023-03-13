import ReactorKit
final class ExploreViewReactor:Reactor {
    var initialState: State
    
    enum Action {
        case setLoading(Bool)
        case setList(Int)
        case getListNews
    }
    
    enum Mutation {
        case setLoading(Bool)
        case setList(Int)
        case setListNews([NewsModel])
    }
    
    struct State {
        var loading:Bool
        var listNews:[NewsModel]
        var numberOfList:Int
    }
    
    init() {
        initialState = State(loading: false, listNews:
                                [NewsModel(title: "", description: "")],
                             numberOfList: 0)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setLoading(let isLoading):
            return .just(Mutation.setLoading(isLoading))
        case .setList(let number):
            return .just(Mutation.setList(number))
        case .getListNews:
            let listNews:Observable<Mutation> = NewsRepository().getListNews().map { model in
                Mutation.setListNews(model)
            }
            return listNews
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setLoading(let loading):
            state.loading = loading
        case .setList(let number):
            state.numberOfList = number
        case .setListNews(let list):
            state.listNews = list
        }
        return state
    }
}
