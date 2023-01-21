//
//  ContentView.swift
//  Matronome Watch App
//
//  Created by 최윤석 on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Slider()
                .stroke()
            
        }
        .padding()
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
