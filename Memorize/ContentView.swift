//
//  ContentView.swift
//  Memorize
//
//  Created by Artem Morozov on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚌","🛺","🚜","🚗","🚁","🛶","⛵️","🚤","🛥️","🛳️","⛴️","🚢","🛟","⚓️","🪝","⛽️","🚄","🚅","🚈","🚂"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            
            }
            .font(.largeTitle)
            .padding(.horizontal)
       
    }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
}
    var remove: some View{
       Button(action: {emojiCount -= 1},
              label: {
           Image(systemName: "minus.circle")
       })
   }
      var add: some View{
       Button(action: {emojiCount += 1},
              label: {
           Image(systemName: "plus.circle")
       })
   }
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View{
         ZStack{
             let shape =  RoundedRectangle(cornerRadius: 20)
             if isFaceUp{
                 shape.stroke(lineWidth: 3)
                 shape.fill().foregroundColor(.white)
                 Text(content).font(.largeTitle)
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
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
