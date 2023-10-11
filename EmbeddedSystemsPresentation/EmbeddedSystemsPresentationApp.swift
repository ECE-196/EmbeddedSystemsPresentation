//
//  EmbeddedSystemsPresentationApp.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/8/23.
//

import SwiftUI
import PresentationKit

@main
struct MyApp: App {
    @StateObject var model = Presentation(bgColor: .white, slides: [
        Title(),
        What(),
        Arduino(),
        MCU(),
        Code(),
        SwiftIntro()
    ])
    
    var body: some Scene {
        WindowGroup {
            PresentationView()
                .environmentObject(model)
        }
        .commands {
            CommandMenu("Control") {
                Text("Current frame: \(Int(model.keyframe))")
                
                Button("Next Keyframe") {
                    model.nextKeyframe()
                }
                .keyboardShortcut("N")
                
                Button("Previous Keyframe") {
                    model.prevKeyFrame()
                }
                .keyboardShortcut("B")
            }
        }
    }
}
