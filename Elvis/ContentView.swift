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
    @State private var shownImage: Image? = nil
    @State private var soundIsOn: Bool = true
    
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            Text("What's So Funny 'But")
                .font(.largeTitle)
                .foregroundStyle(.purple)
                .bold()
            
            Spacer()
            
            if let shownImage {
                shownImage
                    .font(.system(size: 300))
                    .frame(width: 300, height: 300)
            } else {
                Color.clear
                    .frame(width: 300, height: 300)
            }
               
                
            
            Text(message)
                .font(.largeTitle)
                .foregroundStyle(.purple)
                .bold()
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("Sound On", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { oldValue, newValue in
                        if !newValue {
                            if audioPlayer?.isPlaying == true {
                                audioPlayer?.stop()
                            }
                        }
                    }
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
            .tint(.purple)
            
            
        }
        .padding()
        .onAppear { shownImage = nil }
    }
    
    //Helper Functions
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            return
        }
        
        //Safeguard: stop any sound currently playing
        if audioPlayer?.isPlaying == true {
            audioPlayer?.stop()
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer?.play()
        } catch {
            print("🤬 ERROR: Could not play sound. \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}

