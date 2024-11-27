//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by VietMac on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var number: Int = 1
    
    var body: some View {
        VStack {
            Text("Count")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundStyle(.orange)

            ZStack (alignment: .topTrailing) {
                Text("Hello world")
                    .fontDesign(.monospaced)
                    .font(.system(size: 35))
                    .padding(30)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                    )
                
                if number > 0 {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                        
                        Text(number > 99 ? "99+" : "\(number)")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(width: 40, height: 40)
                    .padding(.top, -10) 
                    .padding(.trailing, -10)
                }
            }
            //BUTTON ACTION
            Button (action: {
                number += 1
            }) {
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
            Button (action: {
                if number > 0 {
                    number -= 1
                }
            }) {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
