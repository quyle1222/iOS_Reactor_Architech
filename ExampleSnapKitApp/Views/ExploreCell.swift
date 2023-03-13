//
//  ExploreCell.swift
//  ExampleSnapKitApp
//
//  Created by Tú Phạm on 13/03/2023.
//

import UIKit
import SnapKit
import Then
import ReactorKit

class ExploreCell: UITableViewCell,View {
    
    typealias Reactor = ExploreCellReactor

    var disposeBag: RxSwift.DisposeBag = DisposeBag()
    
    let imgView = UIImageView(frame: .zero).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let lblTitle = UILabel().then {
        $0.text = "Title"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupSubview()
        setupConstraints()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
    }
    
    func bind(reactor: Reactor) {
        
    }
}

extension ExploreCell {
    
    func setupSubview(){
        contentView.addSubview(lblTitle)
        contentView.addSubview(imgView)
    }
    
    func setupUI(){
        contentView.backgroundColor = .blue
    }
    
    func setupConstraints() {
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.horizontalEdges.equalToSuperview()
        }
        
        imgView.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(20)
            make.left.bottom.right.equalTo(self.contentView)
        }
    }
}
