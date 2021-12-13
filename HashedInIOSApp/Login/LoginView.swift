import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    let user:UserModel = UserModel(username: "hitesh", password: "123", name: "hitesh garg", bandName: "B7", role: "Software Engineer - 1", skills: "Java, IOS", level: "Intermediate", bio: "Enthusiastic learner", imageName: "hitesh")
    
    var body: some View {
        NavigationView{
            VStack{
                
                Image(systemName: "plus")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(22)
                .padding(.bottom)
                
                Spacer()
                TextField("Enter your Username", text: $username)
                    .padding(.all, 15)
                    .cornerRadius(100)
                    .background(Color(hue: 1.0, saturation: 0.007, brightness: 0.846))
                
                TextField("Enter your Password", text: $password)
                    .padding(.all, 15)
                    .background(Color(hue: 1.0, saturation: 0.007, brightness: 0.846))
                
                Spacer()
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                                Text("Login")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10.0)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                Spacer()
            }.padding(.horizontal, 30.0)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
