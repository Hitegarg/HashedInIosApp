import Foundation
import SwiftUI

struct CourseModel: Codable, Identifiable{
    
    enum CodingKeys: CodingKey {
        case title
        case description
        case imageName
    }
    
    var id = UUID()
    var title:String
    var description:String
    var imageName: String
    
    
    
}

