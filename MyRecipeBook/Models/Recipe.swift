//
//  Recipe.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import Foundation

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Decodable {
    let id: String
    let title: String
    let imageURL: String
    let category: String
    let instructions: String
// TODO: ingredients and measures
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case imageURL = "strMealThumb"
        case category = "strCategory"
        case instructions = "strInstructions"
    }
}
