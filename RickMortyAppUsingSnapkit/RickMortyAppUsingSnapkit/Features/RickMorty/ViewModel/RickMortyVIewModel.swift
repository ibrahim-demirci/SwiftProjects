//
//  RickMortyVIewModel.swift
//  RickieMortySwiftWithoutStoryBoard
//
//  Created by İbrahim Demirci on 22.01.2022.
//

import Foundation

protocol IRickMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var isLoading: Bool { get set}
    var rickMortyCharacters: [Result] { get set }
    var rickMortyService: IRickMortyService { get }
    
    var rickMortyOutput: RickMortyOutput? { get }
    func setDelegate(output: RickMortyOutput)
}

class RickMortyViewModel: IRickMortyViewModel {
    var rickMortyOutput: RickMortyOutput?
    
    func setDelegate(output: RickMortyOutput) {
        rickMortyOutput = output
    }
    
    
    internal var isLoading: Bool = false
    var rickMortyCharacters: [Result] = []
    lazy var rickMortyService: IRickMortyService = RickMortyService()
    

    func fetchItems() {
        changeLoading()
        rickMortyService.fetchAllDatas { [weak self] response in
            self?.changeLoading()
            self?.rickMortyCharacters = response ?? []
            self?.rickMortyOutput?.saveDatas(characters: self?.rickMortyCharacters ?? [])
        }
    }
    func changeLoading() {
        isLoading = !isLoading
        rickMortyOutput?.changeLoading(isLoading: isLoading)
    }
    
   
    
    
}

