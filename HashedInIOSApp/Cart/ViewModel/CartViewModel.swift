//
//  File.swift
//  HashedInIOSApp
//
//  Created by hitegarg on 14/12/21.
//

import Foundation
class CartViewModel: ObservableObject {
    
    @Published var cartList = [CourseModel]()
    
    func addCartList(course: CourseModel){
        cartList.append(course)
    }
}
