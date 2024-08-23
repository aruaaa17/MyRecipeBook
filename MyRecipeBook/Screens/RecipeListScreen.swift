//
//  RecipeListScreen.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import SwiftUI

struct RecipeListScreen: View {
    
    let recipeCategory: RecipeCategoryViewModel
    
    @StateObject private var recipeListVM = RecipeListViewModel()
    
    
    var body: some View {
        RecipeListView(recipeByCategory: recipeListVM.recipeByCategory)
            .task {
                print("Debug: Starting to populate recipes")
                await recipeListVM.populateRecipesByCategory(name: recipeCategory.title)
            }
            .onAppear {
                print("Debug: RecipeListScreen appeared, ViewModel initialized")
            }
    }
}
