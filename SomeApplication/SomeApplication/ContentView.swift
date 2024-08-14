//
//  ContentView.swift
//  SomeApplication
//
//  Created by student on 14/08/24.
//

import SwiftUI


struct ContentView: View {
    
    
    @State var isShowingLoader: Bool = true
    @State var circleAnimationBool: Bool = true
    
    @State var SecondScreenAppear: Bool = false
    
    
    var body: some View {
        if isShowingLoader {
            ZStack {
                
                Circle()
                    .zIndex(1)
                    .foregroundStyle(Color("Primary"))
                    .offset(x: -200, y: -250)
                    .blur(radius: 150)
                    
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("Background"))
                        HStack {
                            VStack(alignment: .leading) {
                                Text("All your")
                                Text("medications")
                                    .foregroundStyle(Color("Primary"))
                                Text("in one app!")
                            }
                            .font(.system(size: 55, weight: .light))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(
                            EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
                        )
                        HStack {
                            VStack {
                                VStack {
                                    Text("Get")
                                    Text("trained")
                                }
                                .padding(
                                    EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30)
                                )
                                
                            }
                            .font(.system(size: 25, weight: .light))
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.25))
                            .cornerRadius(40)
                            
                            VStack {
                                HStack {
                                    Text("Run")
                                    Image(systemName: "arrow.forward")
                                        .imageScale(.small)
                                }
                                
                                .padding(
                                    EdgeInsets(top: 35, leading: 30, bottom: 35, trailing: 30)
                                )
                                
                            }
                            .font(.system(size: 25, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .background(Color("Primary"))
                            .foregroundStyle(Color.black)
                            .cornerRadius(40)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    isShowingLoader = false
                                }
                            }
                        }
                        .padding(30)
                    }
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 50))
                    
                }
            }
            .transition(.slide)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
            .foregroundStyle(Color.white)
            .font(.system(size: 20, weight: .semibold))
            .ignoresSafeArea()
        } else {
            VStack {
                Dashboard(SecondScreenShow: $SecondScreenAppear, isShowingLoader: $isShowingLoader)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
            .onAppear() {
                SecondScreenAppear = true
            }
        }
    }
}

#Preview {
    ContentView()
}
