//
//  Pokemon.swift
//  PokemonArch
//
//  Created by Michel Bernardo on 19/05/21.
//

import Foundation

// MARK: - Welcome
struct Pokemons: Decodable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [PokemonData]
}

// MARK: - Result
struct PokemonData: Decodable {
    let name: String
    let url: String
    
    enum CondingKeys: String, CodingKey {
        case name = "pokemon_name"
        case url = "pokemon_url"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

