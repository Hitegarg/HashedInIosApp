import SwiftUI

struct CartView: View {
    
    @ObservedObject private var cartListVM = CartViewModel()

    @State private var isEditing:Bool = false
    
    var body: some View {
            VStack{
            ZStack {
                Text("Your Cart")
                        .font(Font.system(size: 30, weight: .bold, design: .rounded))
                        .font(.title).padding(.all,30)
                Text("\(self.cartListVM.cartList.count) Item\(self.cartListVM.cartList.count == 1 ? "" : "s")")
                    .font(Font.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.gray)
                    .padding(.top, 50)
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isEditing = !self.isEditing
                        }
                    }) {
                        if self.isEditing {
                            Text("Done")
                            .font(Font.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 20)
                        } else {
                            Image(systemName: "ellipsis")
                            .padding(.trailing, 20)
                        }
                    }
                }
            }
            .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: true) {
        
                ForEach(self.cartListVM.cartList, id: \.id) { item in
                    HStack {
                        CourseCardView(item: item)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        
                        if self.isEditing {
                            Button(action: {
                                self.cartListVM.cartList.removeAll { (prod) -> Bool in
                                    prod.id == item.id
                                }
                            }) {
                                Image(systemName: "trash.fill")
                                .padding(.trailing, 20)
                            }.foregroundColor(Color.red)
                        }
                    }
                }

                HStack(alignment: .center, spacing: 12) {

                    
                    // Total cost and saved amount
                    VStack(alignment: .leading, spacing: 0) {
//                        Text("Total:")
//                            .foregroundColor(Color.gray)
//                            .font(Font.system(size: 14, weight: .semibold, design: .default))
//                        Text("Rs.\(String(format: "%.2f", cartTotal))")
//                            .font(Font.system(size: 20, weight: .heavy, design: .rounded))
//                        Text("You have saved Rs.\(String(format: "%.2f", cartSaved))")
//                            .font(Font.system(size: 15, design: .rounded))
//                            .fontWeight(.regular)
//                            .foregroundColor(Color.red)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                // Checkout Button
                GeometryReader { geometry in
                    Button(action: {
                        
                    }) {
                        if self.cartListVM.cartList.count == 0 {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Cart Empty")
                                Image(systemName: "xmark")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Checkout")
                                Image(systemName: "arrow.right")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(hue: 0.359, saturation: 1.0, brightness: 0.677))
                            .cornerRadius(20)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding([.top, .leading], 30.0)
                .padding(.bottom, 100) // Add Space at bottom of Scroll View
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartView()
    }
}
