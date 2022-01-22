//
//  RickMortyViewController.swift
//  RickieMortySwiftWithoutStoryBoard
//
//  Created by İbrahim Demirci on 22.01.2022.
//

import UIKit
import SnapKit
import Alamofire

protocol RickMortyOutput {
    func changeLoading(isLoading: Bool)
    func saveDatas(characters: [Result])
}


final class RickMortyViewController: UIViewController {

    private let titleLabel: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private lazy var characters: [Result] = []
    
    lazy var viewModel: IRickMortyViewModel = RickMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(indicator)
        view.backgroundColor = .white
        drawDesigns()
        makeTableView()
        makeTitleLabel()
        makeIndicator()
        
    }
    private func drawDesigns() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 270
        tableView.register(RickMortyTableViewCell.self, forCellReuseIdentifier: RickMortyTableViewCell.Identifier.custom.rawValue)
        DispatchQueue.main.async {
            self.titleLabel.text = "Rick Morty"
            self.titleLabel.font = .boldSystemFont(ofSize: 20)
            self.indicator.color = .blue
            self.indicator.startAnimating()
        }
        
    }
}

extension RickMortyViewController: RickMortyOutput {
    func changeLoading(isLoading: Bool) {
        isLoading ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(characters: [Result]) {
        self.characters = characters
        self.tableView.reloadData()
    }
    
    
}

extension RickMortyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RickMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickMortyTableViewCell.Identifier.custom.rawValue) as? RickMortyTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: characters[indexPath.row])
        return cell
    }
}

extension RickMortyViewController {
    
    private func makeTableView() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.right.left.equalTo(titleLabel)
        }
    }
    private func makeTitleLabel() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(view).offset(-10)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
            
        }
    }
    private func makeIndicator() {
        
        indicator.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.height.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
