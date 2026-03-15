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
    @State private var soundIsOn: Bool = true
    
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Text("What's So Funny 'But")
                .font(.largeTitle)
                .foregroundStyle(.purple)
                .bold()
            
            Spacer()
            
            shownImage
                .font(.system(size: 300))
                
            
            Text(message)
                .font(.largeTitle)
                .foregroundStyle(Color(.purple))
                .bold(true)
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("Sound On", isOn: $soundIsOn)
                    .labelsHidden()
            }
            
            Spacer()
            
            HStack {
                Button("Peace") {
                    message = "Peace"
                    shownImage = Image(systemName: "peacesign")
                    if soundIsOn {
                        playSound(soundName: "sound0")
                    }
                    
                }
                
                Button("Love") {
                    message = "Love"
                    shownImage = Image(systemName: "heart")
                    if soundIsOn {
                        playSound(soundName: "sound1")
                    }
                    
                }
                
                Button("Understanding") {
                    message = "Understanding"
                    shownImage = Image(systemName: "lightbulb")
                    if soundIsOn {
                        playSound(soundName: "sound2")
                    }
                }
            }
            .buttonStyle(.glassProminent)
            .tint(Color(.purple))
            
            
        }
        .padding()
    }
    
    //Helper Functions
    
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
