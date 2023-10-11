//
//  SwiftIntro.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/8/23.
//

import SwiftUI
import PresentationKit
import AVKit

class SwiftIntro: SlideModel {
    let name: String = "SwiftUI"
    let duration: CGFloat = 4
    let transition: PresentationKit.Transition = .fade
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            SwiftIntroView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct SwiftIntroView: SlideView {
    @EnvironmentObject var model: SwiftIntro
    
    var t: CGFloat
    var scale: CGFloat
    
    @State var player1: AVPlayer!
    @State var player2: AVPlayer!
    
    var body: some View {
        ZStack {
            if t <= 1 {
                if let player1 {
                    AVPlayerControllerRepresented(player: player1)
                } else {
                    Text("Error loading video.")
                }
                
                Text("SwiftUI")
                    .font(.system(size: 300 * scale))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t == 1 ? 1 : 0)
            } else if t == 2 {
                if let player2 {
                    AVPlayerControllerRepresented(player: player2)
                } else {
                    Text("Error loading video.")
                }
            }
            
            Image("swifties")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 2000 * scale)
                .offset(y: t >= 3 ? 0 : 500 * scale)
                .opacity(t == 3 ? 1 : 0)
        }
        .onAppear {
            player1 = AVPlayer(url: createLocalUrl(for: "swift intro", ofType: "mp4")!)
            player2 = AVPlayer(url: createLocalUrl(for: "swift demo", ofType: "mp4")!)
        }
        .onChange(of: t) { _, newValue in
            if newValue == 0 {
                player1.seek(to: .zero)
                player1.play()
            } else if newValue == 2 {
                player2.seek(to: .zero)
                player2.play()
            }
        }
    }
}
