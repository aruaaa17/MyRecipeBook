//
//  RecipeDetailResponse.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import Foundation

struct RecipeDetailResponse: Decodable {
    let meals: [RecipeDetail]
}

struct RecipeDetail: Identifiable, Decodable {
    let id: String
    let title: String
    let imageURL: String
    let category: String
    let instructions: String
    let ingredients: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case imageURL = "strMealThumb"
        case category = "strCategory"
        case instructions = "strInstructions"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        category = try container.decode(String.self, forKey: .category)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        var ingredientsDict = [String: String]()
        
        for i in 1...20 {
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)")!
            let measureKey = CodingKeys(rawValue: "strMeasure\(i)")!
            
            if let ingredient = try? container.decode(String.self, forKey: ingredientKey),
               let measure = try? container.decode(String.self, forKey: measureKey),
               !ingredient.isEmpty {
                ingredientsDict[ingredient] = measure
            }
        }
        
        ingredients = ingredientsDict
    }
    
    var ingredientMeasurePairs: [(String, String)] {
        ingredients.map { (ingredient, measure) in
            (ingredient, measure)
        }
    }
}
