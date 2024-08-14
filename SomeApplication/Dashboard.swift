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
//    @State var SecondScreenShow: Bool = true
//    @State var isShowingLoader: Bool = true
    
    
    var Category : [String] = ["All", "Mantras", "Medication", "Yogas", "Sutras"]
    @State var CurrentSelectedCategory: String = "All"
    @State var ShowSheetView  = false
    
    @State var dent: PresentationDetent = .medium
    
    @State var todoList: [Todo] = [
        .init(id: 1, title: "Buy Milk!", description: "Buy Milk from the store.", isCompleted: false),
        .init(id: 2, title: "Study Hard!", description: "Study Computer Scienece", isCompleted: false)
    ]
   
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
                        .padding(10)
                        .background(.white.opacity(0.15))
                        .clipShape(Capsule())
                        .offset(x: SecondScreenShow ? 0 : -65)
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
                    
                    
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(10)
                        .background(.white.opacity(0.15))
                        .clipShape(Capsule())
                        .offset(x: SecondScreenShow ? 0 : 65)
                        .animation(.spring(duration: 1).delay(0.5), value: SecondScreenShow)
                        .onTapGesture() {
                            ShowSheetView = true
                        }
                        .sheet(isPresented: $ShowSheetView) {
                            SheetView(dent: $dent)
                                .presentationDetents([.medium])
                        }
                    
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
                    
                    
                    ScrollView(.vertical) {
                        VStack {
                        ForEach(todoList, id: \.self) {todos in
                            VStack {
                                HStack {
                                    HStack {
                                        Image(systemName: "person.fill")
                                        .imageScale(.large)
                                        .scaleEffect(1.1)
                                    }
                                    .padding()
                                    .background(.white.opacity(0.15))
                                    .clipShape(Circle())
                                    
                                    Text("\(todos.title)")
                                        .font(.system(size: 20))
                                        .padding(
                                            EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                                        )

                                    Spacer()
                                    
                                    HStack {
                                        Image(systemName: "checkmark")
                                        .imageScale(.large)
                                        .scaleEffect(1.1)
                                    }
                                    .padding()
                                    .background(.white.opacity(0.15))
                                    .clipShape(Circle())
                                    
                                  
                                    
                                }
                            }
                            .padding(25)
                            .background(Color("Background"))
                            .cornerRadius(30)
                        }
                    }
                        .scaleEffect(SecondScreenShow ? 1 : 0)
                        .animation(.spring(duration: 0.5).delay(0.5), value: SecondScreenShow)
                    .padding(20)
                    }
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

struct SheetView: View {
    
    
    @State var CurrentTodo: String = ""
    @Binding var dent: PresentationDetent
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Add Todo")
                        .font(.system(size: 30))
                        .padding(10)
                    Spacer()
                    
                    Text(dent == .medium ? "Add Category" : "Cancel")
                        .padding(10)
                        .background(.white.opacity(0.15))
                        .clipShape(Capsule())
                        .onTapGesture() {
                            
                        }
                }
                HStack {
                    TextField("Enter here", text: $CurrentTodo)
                }
                .padding(15)
                .background(.white.opacity(0.15))
                .cornerRadius(10)
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}



struct Todo: Hashable{
    var id: Int
    var title: String
    var description: String
    var isCompleted: Bool
}

//#Preview {
//    Dashboard()
//}
