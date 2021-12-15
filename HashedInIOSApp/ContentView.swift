import SwiftUI

struct ContentView: View {
    
    @State var courses = [CourseModel]()
    @State var cart:[CourseModel] = []
    
    var body: some View {
        HeaderBarView(
            images: [
                Image(systemName: "house.fill"),
                Image(systemName: "cart.fill"),
                Image(systemName: "person.fill")
            ], tabIndex: 0,
            contentTabs: [
                AnyView(CourseView()),
                AnyView(CartView()),
                AnyView(CartView())
            ])
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
