//
//  ContentView.swift
//  Memorize
//
//  Created by Artem Morozov on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojiCount = 20
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .padding(0.5)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            
    }
       
        .padding(.horizontal)
}
   
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View{
         ZStack{
             let shape =  RoundedRectangle(cornerRadius: 20)
             if isFaceUp{
                 shape.fill().foregroundColor(Color.white)
                 shape.strokeBorder(lineWidth: 3)
                 Text(content).font(Font.largeTitle)
             } else{
                 shape.fill()
            }
        }
         
         .onTapGesture{
             isFaceUp = !isFaceUp
         }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
//        ContentView()
//            .preferredColorScheme(.light)
            
    }
}


