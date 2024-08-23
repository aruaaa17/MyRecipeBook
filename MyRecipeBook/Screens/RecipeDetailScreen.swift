//
//  RecipeDetailScreen.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/22/24.
//  
//

import SwiftUI
struct RecipeDetailScreen: View {
    let recipeId: String
    @StateObject private var recipeDetailVM = RecipeDetailViewModel()
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                AsyncImage(url: recipeDetailVM.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
                
                Text(recipeDetailVM.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 0)
                    .bold()
                    .multilineTextAlignment(.center)

            }
            .frame(height: 300)
            .clipped()

            VStack(alignment: .leading, spacing: 30) {
                if !recipeDetailVM.instructions.isEmpty {
                    Text("Instructions")
                        .font(.headline)

                    Text(recipeDetailVM.instructions)
                }
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        .task {
            await recipeDetailVM.populateRecipeDetail(id: recipeId)
        }
    }
}

    
#Preview {
    RecipeDetailScreen(recipeId: "52772")
}
