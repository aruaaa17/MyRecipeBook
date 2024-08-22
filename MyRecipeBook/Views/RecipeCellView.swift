//
//  RecipeCellView.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/21/24.
//  
//

import SwiftUI

struct RecipeCellView: View {
    
    let recipe: RecipeByCategoryViewModel
    
    var body: some View {
        
        HStack {
            AsyncImage(url: recipe.imageURL) { image in
                image.resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            } placeholder: {
                ProgressView()
            }
            Text(recipe.title)
        }
    }
}
