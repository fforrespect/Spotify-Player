//
//  ContentView.swift
//  Spotify Player
//
//  Created by Jaiveer Chadda on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    private var spotifyAuthManager = SpotifyAuthManager()
    
    var body: some View {
        VStack {
            // App title
            Text("Spotify Player")
                .font(.largeTitle)
                .padding()

            // Album Cover Placeholder
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()

            // Track Title Placeholder
            Text("Track Title")
                .font(.title)
                .padding()

            // Player Controls
            HStack {
                // Previous Track Button
                Button(action: {
                    // Add action to go to the previous track
                }) {
                    Image(systemName: "backward.fill")
                }

                // Play/Pause Button
                Button(action: {
                    // Add action to play/pause the track
                }) {
                    Image(systemName: "play.fill")
                }

                // Next Track Button
                Button(action: {
                    // Add action to go to the next track
                }) {
                    Image(systemName: "forward.fill")
                }
            }
            .padding()
            
            // Spotify Login Button
            Button("Login to Spotify") {
                spotifyAuthManager.authenticate()
            }
        }
    }
}


#Preview {
    ContentView()
}
