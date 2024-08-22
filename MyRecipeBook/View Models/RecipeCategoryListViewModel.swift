//
//  RecipeCategoryListViewModel.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/20/24.
//  
//

import Foundation

@MainActor
class RecipeCategoryListViewModel: ObservableObject {
    
    @Published var recipeCategories: [RecipeCategoryViewModel] = []
    
    func populateCategories() async {
        do {
            let recipeCategoriesResponse = try await NetworkManager().get(url: Constants.Urls.recipeCategoriesURL) { data in
                return try? JSONDecoder().decode(RecipeCategoryResponse.self, from: data)
            }
            
            self.recipeCategories = recipeCategoriesResponse.categories.map(RecipeCategoryViewModel.init)
        } catch {
            print("RecipeCategoryListViewModel - func populateCategories", error)
        }
    }
}

struct RecipeCategoryViewModel: Identifiable {
    
    let id = UUID()
    private let recipeCategory: RecipeCategory
    
    init(_ recipeCategory: RecipeCategory) {
        self.recipeCategory = recipeCategory
    }
    
    var title: String {
        recipeCategory.strCategory
    }
    
    var imageUrl: URL? {
        URL(string: recipeCategory.strCategoryThumb)
    }
    
}
