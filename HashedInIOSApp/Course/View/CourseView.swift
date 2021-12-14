import SwiftUI

struct CourseView: View {
    
    @ObservedObject private var courseListVM = CourseViewModel()
    
    @Binding var courses:[CourseModel]
    @Binding var cart:[CourseModel]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                    ForEach(self.courses) {
                        item in
                        NavigationLink(destination: CourseDetailView(course: item, cart: self.$cart)) {
                                CourseCardView(item: item)
                                    .padding(.horizontal, 20)
                        }//NavigationLink
                    }//ForEach
            }// NavigationView
        }// body
    }//CourseView
}

struct CourseView_Previews: PreviewProvider {
    
    static var course1:CourseModel = CourseModel( title: "SwiftUI", description: "jhncjdncje",imageName: "swiftUI")
    
    static var course2:CourseModel = CourseModel( title: "SwiftUI", description: "jhncjdncje",imageName: "swiftUI")
    
    static var course3:CourseModel = CourseModel( title: "SwiftUI", description: "jhncjdncje",imageName: "swiftUI")
    
    @State static var items:[CourseModel] = [course1, course2, course3]
    @State static var cart:[CourseModel] = [course1,course2]
    
    static var previews: some View {
        CourseView(courses: $items, cart: $cart)
    }
}
