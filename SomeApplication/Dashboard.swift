//
//  Dashboard.swift
//  SomeApplication
//
//  Created by student on 14/08/24.
//

import SwiftUI

struct Dashboard: View {
    @Binding var SecondScreenShow: Bool 
    @Binding var isShowingLoader: Bool
    
    
    var Category : [String] = ["All", "Mantras", "Medication", "Yogas", "Sutras"]
    @State var CurrentSelectedCategory: String = "All"
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color("Primary"))
                .offset(x: -200, y: -250)
                .blur(radius: 200)
                .scaleEffect(SecondScreenShow ? 1 : 0)
                .animation(.spring(duration: 1).delay(0.5), value: SecondScreenShow)
            
            
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .offset(x: SecondScreenShow ? 0 : -50)
                        .animation(.spring(duration: 1).delay(0.5), value: SecondScreenShow)
                        .onTapGesture() {
                            withAnimation() {
                                SecondScreenShow = false
                            }
                            withAnimation(.spring().delay(1)) {
                                isShowingLoader = true
                            }
                        }
                    Spacer()
                }
                .padding(
                    EdgeInsets(top: 30, leading: 20, bottom: 1, trailing: 20)
                )
                VStack {
                    HStack {
                        Text("My practical")
                            .font(.system(size: 50, weight: .light))
                            .padding(
                                EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                            )
                            .offset(x: SecondScreenShow ? 0 : -290)
                            .animation(.spring(duration: 1).delay(0.5), value: SecondScreenShow)
                        
                        Spacer()
                    }
                    HStack {
                        Text("plan")
                            .font(.system(size: 50, weight: .light))
                            .padding(
                                EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                            ).offset(x:SecondScreenShow ? 0 :  -110)
                            .animation(.spring(duration: 1).delay(0.5), value: SecondScreenShow)
                        
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Category, id: \.self) { category in
                                Text("\(category)")
                                    .padding(
                                        EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
                                    )
                                    .background(CurrentSelectedCategory == category ? Color.white.opacity(0.15) : Color("Background"))
                                    .clipShape(Capsule())
                                    .onTapGesture() {
                                        CurrentSelectedCategory = category
                                    }
                                    .scaleEffect(SecondScreenShow ? 1 : 0)
                                    .animation(.spring(duration: 0.5).delay(0.5), value: SecondScreenShow)
                            }
                        }
                    }
                    .padding(
                        EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                    )
                    Spacer()
                    
                }
                Spacer()
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .foregroundStyle(Color.white)
    }
}
