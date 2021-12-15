import SwiftUI

struct ProfileView: View {
    
    @ObservedObject private var profileVM = ProfileViewModel()
  
        @State var isPresented = false

            var body: some View {
                VStack {
                    VStack {
                        Header()
                        ProfileText()
                    }
                    Spacer()
                    Button (
                        action: { self.isPresented = true },
                        label: {
                            Label("Edit", systemImage: "pencil")
                    })
                    .sheet(isPresented: $isPresented, content: {
                        SettingsView()
                    })
                }
            }
}

struct ProfileText: View {
    @AppStorage("name") var name = ProfileViewModel().profile.username
    @AppStorage("subtitle") var subtitle = ProfileViewModel().profile.name
    @AppStorage("description") var description = ProfileViewModel().profile.bio
    @AppStorage("bandName") var bandName = ProfileViewModel().profile.bandName
    @AppStorage("role") var role = ProfileViewModel().profile.role
    @AppStorage("skill") var skill = ProfileViewModel().profile.skills
    @AppStorage("level") var level = ProfileViewModel().profile.level
   
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(name)
                    .bold()
                    .font(.title)
                
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
            
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
            Text(bandName)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(role)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(skill)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(level)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    
  
    static var previews: some View {
        ProfileView()
    }
}
