//
//  RecipeByCategory.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/22/24.
//  
//

import Foundation

struct RecipeByCategoryResponse: Decodable {
    let meals: [RecipeByCategory]
}

struct RecipeByCategory: Identifiable, Decodable {
    let id: String
    let title: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case imageURL = "strMealThumb"
    }
}
