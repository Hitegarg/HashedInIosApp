import Foundation
class CartViewModel: ObservableObject {
    
    @Published var cartList = [CourseModel]()

    func courseConvert(id: UUID, title: String, image: String, desc: String) -> CourseModel{
        return CourseModel(id: id, title: title, description: desc, imageName: image)
    }
}
