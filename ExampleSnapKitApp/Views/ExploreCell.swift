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
    typealias Reactor = <#type#>
    
    let imgView = UIImageView(frame: .zero).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
}

extension ExploreCell {
    
    func setupSubview(){
        contentView.addSubview(imgView)
    }
    
    func setupConstraints() {
        imgView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView)
        }
    }
}
