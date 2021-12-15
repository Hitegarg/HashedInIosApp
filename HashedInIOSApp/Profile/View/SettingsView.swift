import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                ProfileSettings()
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing:
                    Button (
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Done")
                        }
                    )
            )
        }
    }
}
struct ProfileSettings: View {
    @AppStorage("name") var name = ProfileViewModel().profile.username
    @AppStorage("subtitle") var subtitle = ProfileViewModel().profile.name
    @AppStorage("description") var description = ProfileViewModel().profile.bio
    @AppStorage("bandName") var bandName = ProfileViewModel().profile.bandName
    @AppStorage("role") var role = ProfileViewModel().profile.role
    @AppStorage("skill") var skill = ProfileViewModel().profile.skills
    @AppStorage("level") var level = ProfileViewModel().profile.level
    
    @State private var errorShowing = false
    
    var body: some View {
        Section(header: Text("Profile")) {
            Button (
                action: {
                    self.errorShowing.toggle()
                },
                label: {
                    Text("Pick Profile Image")
                }
            )
            TextField("Name", text: $name)
            TextField("Subtitle", text: $subtitle)
            TextField("description",text: $description)
            TextField("bandName", text: $bandName)
            TextField("role", text: $role)
            TextField("skill", text: $skill)
            TextField("level", text: $level)
        }
        .alert(isPresented: $errorShowing){
            Alert(title: Text("Not Implemented\n"), message: Text("Will be implemented soon"))
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
