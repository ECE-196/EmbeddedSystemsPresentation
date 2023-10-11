//
//  MCU.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/8/23.
//

import Foundation
import SwiftUI
import PresentationKit
import Shimmer

class MCU: SlideModel {
    let name: String = "MCU"
    let duration: CGFloat = 9
    let transition: PresentationKit.Transition = .fade
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            MCUView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct MCUView: SlideView {
    @EnvironmentObject var model: MCU
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            HStack {
                if t > 6 {
                    VStack {
                        Text("0xDE\n0xAD")
                            .opacity(0.5)
                        Text("0xC0\n0xDE")
                            .opacity(t > 7 ? 1 : 0.5)
                            .animation(.smooth(duration: 4), value: t)
                        Text("0xBE\n0xEF")
                            .opacity(0.5)
                    }
                    .font(.system(size: 300 * scale))
                    .monospaced()
                    .foregroundStyle(.black)
                    .padding(.trailing, 400 * scale)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    if t > 0 {
                        Text("MCU - *simplified*")
                            .font(.system(size: 50 * scale))
                            .fontWeight(.regular)
                            .foregroundStyle(.black)
                    }
                    
                    VStack(spacing: 0) {
                        // cpu
                        Rectangle()
                            .fill(.black)
                            .frame(width: (t > 0 ? 800 : 500) * scale, height: (t > 0 ? 400 : 200) * scale)
                            .padding(t > 0 ? 8 * scale : 0)
                            .overlay {
                                Text("CPU")
                                    .font(.system(size: 100 * scale))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .shimmering(active: t == 2)
                                    .opacity(t > 0 ? 1 : 0)
                            }
                        
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: 8 * scale, height: t > 0 ? 200 * scale : 0)
                                // memory
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: (t > 0 ? 400 : 300) * scale, height: 200 * scale)
                                    .padding(t > 0 ? 8 * scale : 0)
                                    .overlay {
                                        Text("Memory")
                                            .font(.system(size: 50 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .shimmering(active: t == 3)
                                            .opacity(t > 0 ? 1 : 0)
                                    }
                                
                                
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: 8 * scale, height: t > 0 ? 200 * scale : 0)
                            }
                            
                            Spacer()
                                .frame(width: t > 0 ? 100 * scale: 0)
                            
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: 8 * scale, height: t > 0 ? 225 * scale : 0)
                                
                                // clocks
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: (t > 0 ? 150 : 200) * scale, height: (t > 0 ? 150 : 200) * scale)
                                    .padding(t > 0 ? 8 * scale : 0)
                                    .overlay {
                                        Text("Clocks")
                                            .font(.system(size: 25 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .shimmering(active: t == 4)
                                            .opacity(t > 0 ? 1 : 0)
                                    }
                                
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: 8 * scale, height: t > 0 ? 225 * scale : 0)
                            }
                        }
                        
                        // peripherals
                        let grid_spacing = t > 5 ? 20 * scale : 0
                        Grid(horizontalSpacing: grid_spacing, verticalSpacing: grid_spacing) {
                            HStack(spacing: grid_spacing) {
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("Flash")
                                            .font(.system(size: 40 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("Timers")
                                            .font(.system(size: 40 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                            }
                            
                            GridRow {
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("UART")
                                            .font(.system(size: 30 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("SPI")
                                            .font(.system(size: 30 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("I2C")
                                            .font(.system(size: 30 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("PWM")
                                            .font(.system(size: 30 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("ADC")
                                            .font(.system(size: 30 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                                Rectangle()
                                    .fill(.black)
                                    .overlay {
                                        Text("GPIO")
                                            .font(.system(size: 30 * scale))
                                            .bold()
                                            .foregroundStyle(.white)
                                            .opacity(t > 5 ? 1 : 0)
                                    }
                            }
                        }
                        .frame(width: (t > 0 ? t > 5 ? 1200 : 1000 : 500) * scale, height: (t > 5 ? 300 : 100) * scale)
                            .overlay {
                                ZStack {
                                    Rectangle()
                                        .fill(.black)
                                        .opacity(t == 1 ? 1 : 0)
                                    
                                    Text("Peripherals")
                                        .font(.system(size: 40 * scale))
                                        .bold()
                                        .foregroundStyle(.white)
                                        .shimmering(active: t == 5)
                                        .opacity((1...5).contains(t) ? 1 : 0)
                                }
                            }
                            .padding(t > 0 ? 8 * scale : 0)
                    }
                    .padding(32 * scale)
                    .border(.black, width: 8 * scale)
                }
            }
            
            Text("MCU")
                .font(.system(size: 100 * scale))
                .bold()
                .foregroundStyle(.white)
                .opacity(t < 1 ? 1 : 0)
        }
    }
}

#Preview {
    MCU()
        .view(t: 0, scale: 0.25)
        .frame(width: 960, height: 540)
        .background(.white)
}
