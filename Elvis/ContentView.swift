//
//  ContentView.swift
//  Elvis
//
//  Created by Fanelo Mhlambi on 08/03/2026.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message: String = ""
    @State private var shownImage: Image = Image(systemName: "")
    
    @State private var audioPlayer: AVAudioPlayer!
    
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
                    playSound(soundName: "sound0")
                }
                
                Button("Love") {
                    message = "Love"
                    shownImage = Image(systemName: "heart")
                    playSound(soundName: "sound1")
                }
                
                Button("Understanding") {
                    message = "Understanding"
                    shownImage = Image(systemName: "lightbulb")
                    playSound(soundName: "sound2")
                }
            }
            .buttonStyle(.glassProminent)
            .tint(Color(.purple))
            
            
        }
        .padding()
    }
    
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("🤬 ERROR: Could not play sound. \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
