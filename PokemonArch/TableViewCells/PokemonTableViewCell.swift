//
//  PokemonTableViewCell.swift
//  PokemonArch
//
//  Created by Michel Bernardo on 19/05/21.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonUrlLabel: UILabel!
    
    var pokemon : PokemonData? {
        didSet {
            pokemonNameLabel.text = pokemon?.name
            pokemonUrlLabel.text = pokemon?.url
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

