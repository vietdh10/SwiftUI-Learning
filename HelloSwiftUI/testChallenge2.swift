//
//  testChallenge2.swift
//  HelloSwiftUI
//
//  Created by VietMac on 27/11/24.
//

import SwiftUI

struct testChallenge2: View {
    @State private var volumeLevel: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                BarIndicator(volumeLevel: $volumeLevel, maxLevel: 6)
                ButtonControl(volumeLevel: $volumeLevel, maxLevel: 6)
                    .padding(.top, 10)
                Spacer()
            }
            .padding()
        }
    }
}

//VOLUME BAR
struct BarIndicator: View {
    @Binding var volumeLevel: Int
    let maxLevel: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(0..<maxLevel, id: \.self) { index in
                RoundedRectangle(cornerRadius: 5)
                    .fill(colorVolumeLevel(index))
                    .frame(width: 30, height: CGFloat(20 + index * 15))
                    .onTapGesture {
                        volumeLevel = index + 1
                    }
                    .animation(.linear(duration: 0.3), value: volumeLevel)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func colorVolumeLevel(_ index: Int) -> Color {
        if index < volumeLevel {
            if volumeLevel <= 2 {
                return Color.red
            } else if volumeLevel <= 4 {
                return Color.yellow
            } else {
                return Color.green
            }
        } else {
            return Color.gray.opacity(0.3)
        }
    }
}

//BUTTON ACTION
struct ButtonControl: View {
    @Binding var volumeLevel: Int
    let maxLevel: Int
    
    var body: some View {
        HStack(spacing: 10) {
            Button(action: {
                if volumeLevel > 0 {
                    volumeLevel -= 1
                }
            }) {
                Image(systemName: "minus.circle")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            
            Button(action: {
                if volumeLevel < maxLevel {
                    volumeLevel += 1
                }
            }) {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    testChallenge2()
}
