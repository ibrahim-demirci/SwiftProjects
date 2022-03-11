//
//  RickMortyService.swift
//  RickMortySwiftWithoutStoryBoard
//
//  Created by İbrahim Demirci on 22.01.2022.
//

import Alamofire
import Foundation
import UIKit

enum RickMortyServiceEndpoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return BASE_URL.rawValue + PATH.rawValue
    }
}

protocol IRickMortyService {
    func fetchAllDatas(completion: @escaping ([Result]?) -> Void )
}

struct RickMortyService: IRickMortyService {
    func fetchAllDatas( completion: @escaping ([Result]?) -> Void) {
        print(RickMortyServiceEndpoint.characterPath())
        AF.request( RickMortyServiceEndpoint.characterPath()).responseDecodable(of: RickMortyResponse.self) { response in
            guard let data = response.value else {
                // error
                completion(nil)
                return
            }
            completion(data.results)
        
        }
        
    }
}
