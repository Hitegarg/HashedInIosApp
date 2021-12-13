import SwiftUI

struct CourseView: View {
    
    @ObservedObject private var courseListVM = CourseViewModel()
    
    var body: some View {
        
        NavigationView {
            List(self.courseListVM.courseList) {
                courses in
                Text(courses.title)

            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
