//
//  APIService.swift
//  PokemonArch
//
//  Created by Michel Bernardo on 19/05/21.
//

import Foundation

class APIService: NSObject {
    
    private let sourcesURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    
    func apiToGetPokemonData(completion: @escaping (Pokemons) -> ()){
        //        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
        //
        //            if let data = data {
        //
        //                let jsonDecoder = JSONDecoder()
        //
        //                let empData = try! jsonDecoder.decode(Pokemons.self, from: data)
        //
        //                completion(empData)
        //            }
        //        }.resume()
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            do {
                let data = data
                let decoder = JSONDecoder()
                let empData = try decoder.decode(Pokemons.self, from: data!)
                completion(empData)
            } catch {
                print("error:\(error)")
            }
        }.resume()
    }
}
