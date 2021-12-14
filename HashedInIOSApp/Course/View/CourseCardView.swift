import SwiftUI

struct CourseCardView: View {
    
    var item: CourseModel
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.gray.opacity(0.4))
                    .padding(.all)
                    
                Spacer()
                VStack(alignment: .center, spacing: 12) {
                    Text("\(item.title)")
                        .font(.largeTitle)
                        .font(Font.system(size: 17, weight: .regular, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                    Divider()
                    Text("\(item.description)")
                        .font(.body)
                        .font(Font.system(size: 38, weight: .regular, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red).lineLimit(1)
                    
                }//VStack
            }//Hstack
            Divider()
        }//VStack
    }//body
}//CourseCardView

struct CourseListView_Previews: PreviewProvider {
    @State static var item:CourseModel = CourseModel( title: "SwiftUI",  description: "eretgertfjddsfhksdgfhdgsfdhgfhsdgfdshgfhsgfsdgfhdsgfskgfhsdgfdsjfhdshfdvhsvhfdsfdsjfgjsdghfdkshjfghsdgfsdhkhfgsdkjfgdshgfjdskfgsdkgfskdjfgksdgfskjdgfjger",imageName: "swiftUI")
    
    static var previews: some View {
        CourseCardView(item: item)
    }
}
