//
//  SpotifyAuthManager.swift
//  Spotify Player
//
//  Created by Jaiveer Chadda on 09/01/2024.
//

import Foundation
import OAuthSwift

class SpotifyAuthManager {
    
    private var oauthswift: OAuth2Swift
    private(set) var accessToken: String? // Securely store this token
    
    init() {
        oauthswift = OAuth2Swift(
            consumerKey:    "<7c6356a48d394a3c879dc5025f485a7a>",
            consumerSecret: "<721292fc29e64128a036c64ac6d38541>",
            authorizeUrl:   "https://accounts.spotify.com/authorize",
            accessTokenUrl: "https://accounts.spotify.com/api/token",
            responseType:   "code"
        )
    }
    
    func authenticate() {
        oauthswift.authorize(
            withCallbackURL: "<http://localhost/>",
            scope: "user-modify-playback-state", state: "<STATE>")
        { result in
            switch result {
            case .success(let (credential, _, _)):
                self.accessToken = credential.oauthToken // Store this securely
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func handleRedirect(url: URL) {
        OAuthSwift.handle(url: url)
    }
}

