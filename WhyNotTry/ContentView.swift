//
//  ContentView.swift
//  WhyNotTry
//
//  Created by 領主湯姆 on 2024/6/25.
//

import SwiftUI

struct ContentView: View {
    var activities: [String] = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Curling", "Golf", "Hiking","Squash"]
    var  colors: [Color] = [.blue, .green, .indigo, .brown]
    @State private var selected: String = "Volleyball" // wraps our selected property with some extra logic.
    @State private var id: Int = 1
    var body: some View{
        VStack{
            Text("Why not try...")
                .font(.largeTitle.bold())
            VStack{
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white))
                Text("\(selected)!")
                    .font(.title)
                                
               
            }.transition(.slide).id(id)
            Spacer()
            Button("Try again"){
                withAnimation(.easeInOut(duration: 1)){
                    selected = activities.randomElement() ?? "Archery" // Must need a default value
                    id += 1
                }
        
            }
            .buttonStyle(.borderedProminent)
        
        }
    }
    
}

#Preview {
    ContentView()
}
