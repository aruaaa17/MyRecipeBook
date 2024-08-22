//
//  RecipeCategoryListView.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import SwiftUI

struct RecipeCategoryListView: View {
    
    let categories: [RecipeCategoryViewModel]
    
    
    var body: some View {
        List(categories) { category in 
            NavigationLink(destination: RecipeListScreen(recipeCategory: category)) {
                RecipeCategoryCellView(recipeCategory: category)
            }
        }.listStyle(.plain)
    }
}
