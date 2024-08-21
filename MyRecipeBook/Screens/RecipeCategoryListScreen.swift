//
//  RecipeCategoryListScreen.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/20/24.
//  
//

import SwiftUI

struct RecipeCategoryListScreen: View {
    
    @StateObject var model: RecipeCategoryListViewModel = RecipeCategoryListViewModel()
    
    
    var body: some View {
        NavigationView {
            RecipeCategoryListView(categories: model.recipeCategories)
                .task {
                    await model.populateCategories()
                }
                .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipeCategoryListScreen()
}
