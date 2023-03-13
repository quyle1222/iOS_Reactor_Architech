import UIKit

import ReactorKit
import ReusableKit
import SnapKit
import Then
import RxDataSources
import RxViewController

final class ExploreViewController: BaseViewController,View {
    typealias Reactor = ExploreViewReactor
    var disposeBag: RxSwift.DisposeBag = DisposeBag()
    
    fileprivate struct Reusable {
        static let cell = ReusableCell<ExploreCell>()
    }
    
    lazy var dataSource = RxTableViewSectionedReloadDataSource<ExploreViewSection>(
        configureCell: { _, tableView, indexPath, reactor in
            let cell = tableView.dequeue(Reusable.cell, for: indexPath)
            return cell
        })
    
    let tableView = UITableView().then {
        $0.allowsSelectionDuringEditing = true
        $0.register(Reusable.cell)
    }
    
    init(reactor:ExploreViewReactor) {
        super.init()
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupUI()
        makeConstrains()
    }
    
    func bind(reactor: ExploreViewReactor) {
        self.rx.viewDidAppear
            .map { _ in Reactor.Action.getListNews }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ExploreViewController {
    func addSubViews(){
        view.addSubview(tableView)
    }
    
    func setupUI(){
        
    }
    
    func makeConstrains(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
