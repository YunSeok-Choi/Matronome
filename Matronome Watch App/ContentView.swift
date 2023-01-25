//
//  ContentView.swift
//  Matronome Watch App
//
//  Created by 최윤석 on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var radian = 6.25
    
    var body: some View {
        VStack {
            ZStack {
                Slider()
                    .stroke()
                    .padding()
                    .rotationEffect(.radians(radian), anchor: .bottom)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: radian)
                
                // 우 180 == 8.65
                // 90 == 7.05
                // 좌 180 == 5.55
                
                Slider()
                    .stroke()
                    .padding()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(.easeInOut(duration: 1).repeatForever(), value: radian)
                
            }
            .onAppear{
//                rotationEllipse()
            }
            .frame(width: 200, height: 150)
//            .background(.blue)
        }
        .padding()
    }
    
    func rotationEllipse() {
        
        if radian < 100 {
            radian -= 10
        } else if radian > 0{
            radian += 5
        }
    }
    
}


struct Slider: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 20, y: 30))
        
        path.addCurve(to: CGPoint(x: 90, y: 110),
                      control1: CGPoint(x: -10, y: 60),
                      control2: CGPoint(x: 50, y: 130))
        
        path.addCurve(to: CGPoint(x: 20, y: 30),
                      control1: CGPoint(x: 130, y: 85),
                      control2: CGPoint(x: 60, y: 0))
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
