import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack (alignment: .center){
                Image("Isaac")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Text("Issac")
            }
            
            HStack(alignment: .top){
                Text("Judy")
                Image("Judy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
            }
            
        }
        
        
        
        
        
    }
}
