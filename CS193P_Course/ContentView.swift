//
//  ContentView.swift
//  CS193P_Course
//
//  Created by Michael Warner on 2021-09-21.
//

import SwiftUI

struct ContentView: View {
    var animalEmojis = ["🐶","🐱","🦁","🐮","🐷","🐒","🐔","🐣","🦉","🦅"]
    var vehicleEmojis = ["🚗","🚕","🚌","🏎","🚓","🚑","🚒","🛻","🚜","🚁"]
    var fruitEmojis = ["🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍒","🥝"]
    @State var activeTheme = ["🐶","🐱","🦁","🐮","🐷","🐒","🐔","🐣","🦉","🦅"]
    @State var cardsToShow = 5
    
    
    var body: some View {
        VStack {
            Text("Memorize!").bold().foregroundColor(.black).underline()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(activeTheme[0..<cardsToShow], id: \.self) { label in
                        PlayingCardView(label: label).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    }
                }
            } .padding(.horizontal)
            HStack {
                removeCard
                Spacer()
                animalThemeButton
                vehicleThemeButton
                fruitThemeButton
                Spacer()
                addCard
            }
            .padding()
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    
    // UI Buttons
    var addCard: some View {
        Button {
            if cardsToShow < activeTheme.count {
                cardsToShow += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeCard: some View {
        Button {
            if cardsToShow > 0 {
                cardsToShow -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var animalThemeButton: some View {
        Button(action: { activeTheme = animalEmojis.shuffled()}) {
            VStack {
                Text("Animals")
                Image(systemName: "tortoise")
            } .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
        }
    }
    
    var vehicleThemeButton: some View {
        Button(action: { activeTheme = vehicleEmojis.shuffled()}) {
            VStack {
                Text("Vehicles")
                Image(systemName: "car")
            } .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
        }
    }
    
    var fruitThemeButton: some View {
        Button(action: { activeTheme = fruitEmojis.shuffled()}) {
            VStack {
                Text("Fruit")
                Image(systemName: "applelogo")
            } .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
        }
    }
}


struct PlayingCardView: View {
    @State var isFaceUp = false
    var label: String
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text(label)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .foregroundColor(.red)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 6SE"))
            .previewDisplayName("iPhone 6SE")
    }
}
