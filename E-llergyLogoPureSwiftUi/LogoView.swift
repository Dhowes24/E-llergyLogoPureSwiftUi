//
//  ContentView.swift
//  E-llergyLogoPureSwiftUi
//
//  Created by Derek Howes on 3/29/23.
//

import SwiftUI
import PureSwiftUI

struct LogoView: View {
    @State private var animated = false
    @State private var rotating = false
    @State private var exit = false
    
    let rotationAnimation: Animation = Animation.linear(duration: 20).repeatForever(autoreverses: false)
    let halfSecondAnimation: Animation = Animation.easeInOut(duration: 0.5)
    
    func tapTransaction() {
        var rotationTransaction = rotating ?
        Transaction(animation: halfSecondAnimation) :
        Transaction(animation: rotationAnimation)

        rotationTransaction.disablesAnimations = false
        withTransaction(rotationTransaction) {
            rotating.toggle()
        }
        
        var exitTransaction = exit ?
        Transaction(animation: .linear) :
        Transaction(animation: halfSecondAnimation.delay(0.5))

        exitTransaction.disablesAnimations = false
        withTransaction(exitTransaction) {
            exit.toggle()
        }
    }
    
    var body: some View {
        VStack {
            
            ZStack{
                Circle()
                    .frame(width: 170)
                    .reverseMask {
                        topE()
                        bottomE()
                    }
                    .onTapGesture {
                        tapTransaction()
                    }
                
                Group{
                    Logo(prongNum: 0, animating: animated)
                        .fill(.white)
                        .frame(width: 400, height: 400)
                    Logo(prongNum: 1, animating: animated)
                        .fill(.white)
                        .frame(width: 400, height: 400)
                    Logo(prongNum: 2, animating: animated)
                        .fill(.white)
                        .frame(width: 400, height: 400)
                }
                .rotate(rotating ? 360.degrees : 0.degrees)
            }
            .reverseMask({
                Rectangle()
                    .frame(width:200, height: 13)
                    .offset(x:100, y:5)
                    .scale(1.1)
            })
            .contentShape(Rectangle())
            .onAppear() {
                withAnimation(rotationAnimation) {
                    rotating.toggle()
                }
                withAnimation(halfSecondAnimation.repeatForever( autoreverses: true)) {
                    animated.toggle()
                }
            }
            .scale(exit ? 25 : 1)
            .opacity(exit ? 0 : 1)

        }
        .padding()
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}

extension View {
  @inlinable
  public func reverseMask<Mask: View>(
    alignment: Alignment = .center,
    @ViewBuilder _ mask: () -> Mask
  ) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: alignment) {
          mask()
            .blendMode(.destinationOut)
        }
    }
  }
}
