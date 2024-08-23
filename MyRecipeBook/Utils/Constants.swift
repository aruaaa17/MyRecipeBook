//
//  Constants.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/20/24.
//  
//

import Foundation

struct Constants {
    struct Urls {
        static let recipeCategoriesURL = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        
        static func recipeByCategoriesNameURL(_ name: String) -> URL {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(name)")!
        }
        
        static func recipeById(_ id: String) -> URL {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        }
    }
}
