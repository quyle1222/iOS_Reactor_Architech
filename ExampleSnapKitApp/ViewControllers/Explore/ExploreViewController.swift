import UIKit

import ReactorKit
import ReusableKit
import SnapKit
import Then
import RxDataSources

class ExploreViewController: BaseViewController,View {
    
    fileprivate struct Reusable {
        static let cell = ReusableCell<ExploreCell>()
    }
    
    let dataSource = RxTableViewSectionedReloadDataSource<ExploreViewSection>(
        configureCell: { _, tableView, indexPath, reactor in
          let cell = tableView.dequeue(Reusable.cell, for: indexPath)
//          cell.reactor = reactor
          return cell
      })

      let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
      let tableView = UITableView().then {
        $0.allowsSelectionDuringEditing = true
        $0.register(Reusable.cell)
      }
        
    
    
    typealias Reactor = ExploreViewReactor
    var disposeBag: RxSwift.DisposeBag = DisposeBag()
    
    
    let scrollView = UITableViewCell().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        
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
        
    }
    
    
}

extension ExploreViewController {
    func addSubViews(){
        view.addSubview(scrollView)
    }
    
    func setupUI(){
        scrollView.backgroundColor = .darkGray
    }
    
    func makeConstrains(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(1200)
        }
    }
}
