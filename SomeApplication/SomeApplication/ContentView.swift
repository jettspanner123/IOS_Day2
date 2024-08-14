//
//  ContentView.swift
//  SomeApplication
//
//  Created by student on 14/08/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var isShowingLoader: Bool = true
    
    var body: some View {
        if isShowingLoader {
            ZStack {
                Circle()
                    .foregroundStyle(Color("Primary"))
                    .offset(x: -100, y: -100)
                    
                HStack {
                    Text("hell")
                }
                .frame(width: .infinity, height: .infinity)
                .background(Color.blue)
            }
            .frame(width: .infinity, height: .infinity)
            .background(Color.black)
            .ignoresSafeArea()
        } else {
            
        }
    }
}

#Preview {
    ContentView()
}
