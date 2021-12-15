import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @ObservedObject private var user = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(.all)
                
                Spacer()
                TextField(user.profile.username, text: $username)
                    .padding(.all, 15)
                    .background(Color(hue: 1.0, saturation: 0.007, brightness: 0.846))
                
                TextField(user.profile.password, text: $password)
                    .padding(.all, 15)
                    .background(Color(hue: 1.0, saturation: 0.007, brightness: 0.846))
                
                Spacer()
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                
                    Text("Login")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10.0)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .background(Color.green)
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
