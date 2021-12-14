import Foundation
import Combine

class CourseViewModel: ObservableObject {
    
    @Published var courseList = [CourseModel]()
    private var cancellable: AnyCancellable?
    
    
    init() {
        fetchAllCourses()
    }
    
    private func fetchAllCourses() {
        self.cancellable = WebService().getAllCourses()
            .sink(receiveCompletion: { _ in } , receiveValue: {
                data in
                self.courseList = data
        })
    }
}
