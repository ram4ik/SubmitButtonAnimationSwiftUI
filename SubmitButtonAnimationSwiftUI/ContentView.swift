//
//  ContentView.swift
//  SubmitButtonAnimationSwiftUI
//
//  Created by Ramill Ibragimov on 14.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonRadius: CGFloat = 0
    @State private var rotationDegree: Double = 0
    @State private var buttonHeight: CGFloat = 60
    @State private var buttonWidth: CGFloat = 200
    @State private var whiteViewOffset: CGFloat = 0
    @State private var buttonScale: CGFloat = 1
    @State private var whiteViewScale: CGFloat = 0
    @State private var checkMarkMaskOffset: CGFloat = -30
    @State private var checkOpacity: CGFloat = 0
    @State private var buttonOuterScale: CGFloat = 1
    @State private var shouldAnimate = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ZStack {
                ZStack {
                    Button(action: {
                        self.startAnimation()
                    }, label: {
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.title)
                            .scaleEffect(buttonScale)
                            .animation(.default)
                    })
                }
                .frame(width: buttonWidth, height: buttonHeight)
                .background(Color.blue)
                .cornerRadius(buttonRadius)
                .animation(.default)
                .scaleEffect(buttonOuterScale)
                .animation(shouldAnimate ? .interpolatingSpring(stiffness: 80, damping: 3) : .default)
                
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .offset(y: whiteViewOffset)
                    .scaleEffect(whiteViewScale)
                    .animation(.default)
                    .rotationEffect(.degrees(rotationDegree))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                
                Image(systemName: "checkmark")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .clipShape(Rectangle().offset(x: checkMarkMaskOffset))
                    .animation(Animation.linear(duration: 0.5))
            }
        }
    }
    
    private func startAnimation() {
        rotationDegree = 360
        buttonRadius = 100
        buttonHeight = 100
        buttonWidth = 100
        buttonScale = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            shouldAnimate = true
            whiteViewOffset = 130
            whiteViewScale = 1
            buttonOuterScale = 1.5
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
            whiteViewOffset = 0
            whiteViewScale = 0
            checkMarkMaskOffset = 0
            checkOpacity = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            setInitialState()
        }
    }
    
    private func setInitialState() {
        buttonRadius = 0
        rotationDegree = 0
        buttonHeight = 60
        buttonWidth = 200
        whiteViewOffset = 0
        buttonScale = 1
        whiteViewScale = 0
        checkMarkMaskOffset = -30
        checkOpacity = 0
        buttonOuterScale = 1
        shouldAnimate = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
