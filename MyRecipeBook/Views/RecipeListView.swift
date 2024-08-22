//
//  RecipeListView.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import SwiftUI

struct RecipeListView: View {
    
    let recipeByCategory : [RecipeByCategoryViewModel]
    
    var body: some View {
        List(recipeByCategory, id: \.id) { recipe in
            RecipeCellView(recipe: recipe)
        }
    }
}
