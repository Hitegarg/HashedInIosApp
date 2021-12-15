import SwiftUI

struct CartView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Cart.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cart.id, ascending: true)]) var cartList: FetchedResults<Cart>
    
    @ObservedObject private var cartListVM = CartViewModel()
    
    @State private var isEditing:Bool = false
    @State private var orderShowing:Bool = false
    

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                Text("Your Cart")
                        .font(Font.system(size: 30, weight: .bold, design: .rounded))
                        .font(.title).padding(.all,30)
                Text("\(self.cartList.count) Item\(self.cartList.count == 1 ? "" : "s")")
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
                    ForEach(self.cartList, id: \.self) { item in
                        HStack {
                            CourseCardView(item: self.cartListVM.courseConvert(id: item.id ?? UUID(), title: item.title ?? "", image: item.image ?? "", desc: item.desc ?? ""))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                            
                            if self.isEditing {
                                
                                Button(action: {
                                    self.managedObjectContext.delete(item)
                                    do {
                                        try self.managedObjectContext.save()
                                        print("\(String(describing: item.id)) deleted")
                                    } catch {
                                            print(error)
                                    }
                                }) {
                                    Image(systemName: "trash.fill")
                                    .padding(.trailing, 20)
                                }.foregroundColor(Color.red)
                            }
                        }
                    }
                
                // Checkout Button
                GeometryReader { geometry in
                    Button(action: {
                        
                    }) {
                        if self.cartList.count == 0 {
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
                                Button(action: {
                                    self.orderShowing.toggle()
                                }) {
                                    Text("Checkout")
                                    Image(systemName: "arrow.right")
                                }
                                
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(hue: 0.359, saturation: 1.0, brightness: 0.677))
                            .cornerRadius(20)
                            .alert(isPresented: $orderShowing){
                                
                               
                                for entry in self.cartList {
                                    self.managedObjectContext.delete(entry)
                                }
                                
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                              return  Alert(title: Text("Order Confirmed\n"), message: Text("Your Order is Confirmed\n Your order-id:\n \(UUID())"))
                        }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding([.top, .leading], 30.0)
                .padding(.bottom, 100) 
            }
        }
    }
}
}

struct CartView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartView()
    }
}
