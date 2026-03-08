//
//  ContentView.swift
//  Elvis
//
//  Created by Fanelo Mhlambi on 08/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message: String = ""
    @State private var shownImage: Image = Image(systemName: "")
    
    var body: some View {
        VStack {
            Text("What's So Funny 'But")
                .font(.largeTitle)
                .foregroundStyle(Color(.purple))
                .bold(true)
            
            Spacer()
            
            shownImage
                .font(Font.system(size: 300))
                
            
            Text(message)
                .font(.largeTitle)
                .foregroundStyle(Color(.purple))
                .bold(true)
            
            Spacer()
            
            HStack {
                Button("Peace") {
                    message = "Peace"
                    shownImage = Image(systemName: "peacesign")
                }
                
                Button("Love") {
                    message = "Love"
                    shownImage = Image(systemName: "heart")
                }
                
                Button("Understanding") {
                    message = "Understanding"
                    shownImage = Image(systemName: "lightbulb")
                }
            }
            .buttonStyle(.glassProminent)
            .tint(Color(.purple))
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
