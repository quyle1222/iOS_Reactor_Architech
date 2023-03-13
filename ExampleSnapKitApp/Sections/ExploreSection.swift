import RxDataSources

struct ExploreViewSection {
    var items: [ExploreModel]
}

extension ExploreViewSection: SectionModelType{
    init(original: ExploreViewSection, items: [ExploreModel]) {
        self = original
        self .items = items
    }
    
}
