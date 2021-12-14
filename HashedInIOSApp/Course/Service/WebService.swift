import Foundation
import Combine

class WebService {
        
    func getAllCourses() -> AnyPublisher<[CourseModel], Error>  {
        guard let url = URL(string: Constants.url) else {
                fatalError("Invalid URL")
            }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [CourseModel].self, decoder: JSONDecoder())
            .share()
            .eraseToAnyPublisher()
    }
    
}
