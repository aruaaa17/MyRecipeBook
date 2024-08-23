//
//  RecipeDetailViewModel.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/22/24.
//  
//

import Foundation

@MainActor
class RecipeDetailViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var imageURL: URL?
    @Published var instructions: String = ""
    @Published var ingredientMeasurePairs: [(String, String)] = []
    
    func populateRecipeDetail(id:String) async {
        do {
            print("Debug: Fetching recipes for id: \(id)")
            let recipeDetailResponse = try await NetworkManager().get(url: Constants.Urls.recipeById(id)) { data in
                return try? JSONDecoder().decode(RecipeDetailResponse.self, from: data)
            }
            if let recipeDetail = recipeDetailResponse.meals.first {
                self.title = recipeDetail.title
                self.imageURL = URL(string: recipeDetail.imageURL)
                self.instructions = recipeDetail.instructions
                self.ingredientMeasurePairs = recipeDetail.ingredientMeasurePairs
                print("Debug: Recipe details populated successfully")
            } else {
                print("Debug: No meals found in response")
            }
        } catch {
            print("Debug: RecipeDetailViewModel - populateRecipeDetail func", error)
        }
    }
    
}
