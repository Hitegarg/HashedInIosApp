import SwiftUI

struct HeaderBarView: View {
    
    @State var images:[Image] = HeaderBarViewModel().header.imageList
    @State var tabIndex: Int = 0
    @State var contentTabs:[AnyView]
    
    @State var showCourseView: Bool = true
    @State var showCartView: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                self.contentTabs[self.tabIndex]
                
                Spacer()
                VStack {
                    
                    Divider()
                    HStack {
                        
                        Spacer()
                        
                        ForEach(images.indices) { i in
                
                            if i == self.tabIndex {
                                self.images[i]
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                                
                            } else {
                                self.images[i]
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.42))
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            }//Else
                            Spacer()
                        }//ForEach
                    }//HStack
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                }//VStack
                .background(Color.orange)
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: -2)
            }//VStack
            .edgesIgnoringSafeArea(.bottom)
        }//ZStack
    }//Body
}//HeaderBarView

struct HeaderBarView_Previews: PreviewProvider {
    
    static var images:[Image] = HeaderBarViewModel().header.imageList

    static var previews: some View {
        HeaderBarView(images: images, tabIndex: 0, contentTabs: [
            AnyView(CourseView()),
            AnyView(CartView()),
            AnyView(ProfileView())
        ])
    }
}
