//
//  ViewController.swift
//  PokemonArch
//
//  Created by Michel Bernardo on 19/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    private var pokemonViewModel: PokemonsViewModel!
    
    private var dataSource: PokemonTableViewDataSource<PokemonTableViewCell, PokemonData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUpdate()
    }
    
    func callToViewModelForUpdate() {
        
        self.pokemonViewModel = PokemonsViewModel()
        self.pokemonViewModel.bindPokemonViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        
        self.dataSource = PokemonTableViewDataSource(cellIdentifier: "PokemonTableViewCell", items: self.pokemonViewModel.empData.results, configureCell: { (cell, evm) in
            cell.pokemonNameLabel.text = "Name: \(evm.name)"
            cell.pokemonUrlLabel.text = "URL:\(evm.url)"
        })
        
        DispatchQueue.main.sync {
            self.pokemonTableView.dataSource = self.dataSource
            self.pokemonTableView.reloadData()
        }
    }
    
    
}

