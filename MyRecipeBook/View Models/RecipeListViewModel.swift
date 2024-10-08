//
//  RecipeListViewModel.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipeByCategory: [RecipeByCategoryViewModel] = []
    
    func populateRecipesByCategory(name:String) async {
        do {
            print("Debug: Fetching recipes for category: \(name)")
            let recipeResponse = try await NetworkManager().get(url: Constants.Urls.recipeByCategoriesNameURL(name)) { data in
                return try? JSONDecoder().decode(RecipeByCategoryResponse.self, from: data)
            }
            self.recipeByCategory = recipeResponse.meals.map(RecipeByCategoryViewModel.init)
            print("Debug: Fetched recipes for category: \(name)")
        } catch {
            print("Debug: RecipeListViewModel - populateRecipesByCategory func", error)
        }
    }
}

struct RecipeByCategoryViewModel {
    private let recipeByCategory: RecipeByCategory
    init(_ recipeByCategory: RecipeByCategory) {
        self.recipeByCategory = recipeByCategory
    }
    
    var id: String {
        recipeByCategory.id
    }

    var title: String {
        recipeByCategory.title
    }

    var imageURL: URL? {
        URL(string: recipeByCategory.imageURL)
    }
}

