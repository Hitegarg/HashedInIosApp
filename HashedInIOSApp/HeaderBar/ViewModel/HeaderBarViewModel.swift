import Foundation
import SwiftUI

class HeaderBarViewModel {
    var header: HeaderBarModel
    
    init() {
        self.header = HeaderBarModel(imageList: [
            Image(systemName: "house.fill"),
            Image(systemName: "cart.fill"),
            Image(systemName: "person.fill")
        ])
    }
}
