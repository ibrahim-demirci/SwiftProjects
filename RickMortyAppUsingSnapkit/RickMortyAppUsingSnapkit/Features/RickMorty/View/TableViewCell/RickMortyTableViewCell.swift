//
//  RickMortyTableViewCell.swift
//  RickieMortySwiftWithoutStoryBoard
//
//  Created by İbrahim Demirci on 23.01.2022.
//

import UIKit
import AlamofireImage

class RickMortyTableViewCell: UITableViewCell {
    
    private let customImageView: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    private let customDescribtion: UILabel = UILabel()
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case custom = "bb"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(customImageView)
        addSubview(customDescribtion)
        addSubview(title)
        title.font = .boldSystemFont(ofSize: 18)
        customDescribtion.font = .italicSystemFont(ofSize: 18)
        
        customImageView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(customImageView.snp.bottom).offset(10)
            make.right.left.equalTo(customImageView)
            make.height.greaterThanOrEqualTo(20)
        }
        customDescribtion.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.right.left.equalTo(title)
            make.height.greaterThanOrEqualTo(20)
        }
    }
    
    func saveModel(model: Result) {
        title.text = model.name
        customDescribtion.text = model.status
        customImageView.af.setImage(withURL: URL(string: model.image ?? randomImage)!)
    }
   
}
