import Foundation

class ProfileViewModel : ObservableObject {
    
    @Published var profile: ProfileModel
    
    init () {
        profile = ProfileModel(username: "Hitesh", password: "************", name: "Hitesh Garg", bandName: "B7", role: "Software Engineer - 1", skills: "Java, IOS", level: "Intermediate", bio: "Enthusiastic learner", imageName: "hitesh")
    }
}
