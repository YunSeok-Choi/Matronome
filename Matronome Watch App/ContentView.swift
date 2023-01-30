//
//  ContentView.swift
//  Matronome Watch App
//
//  Created by 최윤석 on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var degree = 150.0
    @State var bpm = 60
    var angle = 210.0
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Label("", systemImage: "ellipsis")
            }
            .padding()
            .padding(.top, 15)
            
            ZStack {
                
                //MARK: 파랑
                Ellipse()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.blue, .clear]),
                                       startPoint: .bottom, endPoint: .top)
                    )
                    .frame(width: 90, height: 130)
                    .rotationEffect(.degrees(degree), anchor: .top)
                    .position(x: 50, y: 180)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)
                            .speed(1)
                            .repeatForever()) {
                                degree = angle
                            }
                    }
                
                //MARK: 초록
                Ellipse()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.green, .clear]),
                                       startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 90, height: 130)
                    .rotationEffect(.degrees(degree), anchor: .bottom)
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .position(x: 50, y: 180)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)
                            .speed(1)
                            .repeatForever()) {
                                degree = angle
                            }
                    }
                
            }
            .frame(width: 100, height: 100)
            .padding()
            
            Text("\(bpm)")
                .font(.system(size: 28))
                .fontWeight(.light)
    
            
        }
        .padding()
    }
    
    func rotationLeftEllipse() {
        
        if degree <= 180.0 {
            degree -= 1
        } else if degree >= 360.0 {
            degree += 1
        }
        
    }
    
    func rotationRightEllipse() {
        
        if degree <= 0.5 {
            degree -= 1
        } else if degree >= 0.1 {
            degree += 1
        }
    }
    
}

//MARK: Ellipse
struct Slider: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 10))
        
        path.addCurve(to: CGPoint(x: 90, y: 110),
                      control1: CGPoint(x: -40, y: 50),
                      control2: CGPoint(x: 20, y: 120))
        
        path.addCurve(to: CGPoint(x: 0, y: 10),
                      control1: CGPoint(x: 140, y: 60),
                      control2: CGPoint(x: 40, y: -25))
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
