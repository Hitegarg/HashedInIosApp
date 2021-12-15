import SwiftUI

struct CourseView: View {
    
    @ObservedObject private var courseListVM = CourseViewModel()
    @ObservedObject private var cartListVM = CartViewModel()
    
    var body: some View {
            VStack {
                VStack {
                    Text("Courses")
                        .font(.title)
                        .font(Font.system(size: 23, weight: .regular, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Divider()
                    ForEach(self.courseListVM.courseList) {
                            item in
                            NavigationLink(destination: CourseDetailView(course: item)) {
                                    CourseCardView(item: item)
                                        .padding(.horizontal, 20)
                            }//NavigationLink
                        }//ForEach
                }//Vstack
            }//Vstack
    }// body
}//CourseView


struct CourseView_Previews: PreviewProvider {
    
    static var previews: some View {
        CourseView()
    }
}
