import SwiftUI

struct CourseView: View {
    
    @ObservedObject private var courseListVM = CourseViewModel()
    @ObservedObject private var cartListVM = CartViewModel()
    
    var body: some View {
        return
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(self.courseListVM.courseList) {
                        item in
                        NavigationLink(destination: CourseDetailView(course: item)) {
                                CourseCardView(item: item)
                                    .padding(.horizontal, 20)
                        }//NavigationLink
                    }//ForEach
        }// body
    }//CourseView
}

struct CourseView_Previews: PreviewProvider {
    
    static var previews: some View {
        CourseView()
    }
}
