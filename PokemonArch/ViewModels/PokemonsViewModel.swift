//
//  PokemonsViewModel.swift
//  PokemonArch
//
//  Created by Michel Bernardo on 19/05/21.
//

import Foundation

class PokemonsViewModel: NSObject {
    
    private var apiService: APIService!
    private(set) var empData: Pokemons! {
        didSet {
            self.bindPokemonViewModelToController()
        }
    }
    
    var bindPokemonViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetPokemonData {
            (empData) in
            self.empData = empData
        }
    }
    
}
