import SwiftUI

struct CourseDetailView: View {
    
    @ObservedObject private var cartListVM = CartViewModel()
    var course:CourseModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "plus")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300, alignment: .center)
                .padding(.all)
                
                Spacer()
                    VStack(alignment: .center, spacing: 4) {
                        Text(course.title)
                            .font(Font.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(Color.red)
                
                    Text(course.description)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .fontWeight(.regular)
                        .foregroundColor(Color.cyan)
                    
                    }//VStack
                    .padding(.all)
                
                Divider()
                
                HStack {
                    Spacer()
                    Button(action: {
                        if self.cartListVM.cartList.contains(where: { (item) -> Bool in
                            item.id == self.course.id
                        }) {
                            self.cartListVM.cartList.removeAll { (item) -> Bool in
                                item.id == self.course.id
                            }
                        } else {
                            self.cartListVM.cartList.append(self.course)
                        }
                    }) {
                        if self.cartListVM.cartList.contains(where: { (item) -> Bool in
                            item.id == self.course.id
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADDED TO CART")
                                Image(systemName: "checkmark")
                            }//HStack
                            .padding(.all, 15)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(15)
                        } else {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADD TO CART")
                                Image(systemName: "cart.fill")
                            }//HStack
                            .padding(.all, 15)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.orange)
                            .cornerRadius(15)
                        }//else
                    }//Button
                    .padding(.all,40)
                    Spacer()
                }//HStack
            }//VStack
        }//VStack
    }//ScrollView
}//CourseDetailView

struct CourseDetailView_Previews: PreviewProvider {
    @State static var course :CourseModel = CourseModel(title: "SwiftUI", description: "jvnjdrv jdfnjv",imageName: "swiftUI")
    
    static var previews: some View {
        CourseDetailView(course: course)
    }
}
