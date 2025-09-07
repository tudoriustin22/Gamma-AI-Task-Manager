//
//  TasksView.swift
//  Gamma
//
//  Created by Tudor Iustin on 03/09/2025.
//

import SwiftUI

struct TasksView: View {
    
    @ObservedObject var viewModel: TasksViewModel
    let bgColor = Color(red: 248/255, green: 244/255, blue: 244/255).opacity(0.9)

    var body: some View {
        ZStack (alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("My tasks")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(Color.black.opacity(100))
                        .padding(.top, 15)
                    
                    Spacer()
                    
                    
            // Task Sorting Button
                    ZStack {
                        Rectangle()
                            .frame(width: 85, height: 35)
                            .cornerRadius(20)
                            .foregroundColor(Color.white)
                        
                        Rectangle()
                            .frame(width: 80, height: 30)
                            .cornerRadius(20)
                            .foregroundColor(Color(red: 255/255, green: 244/255, blue: 245/255))
                        
                        HStack {
                            Image(systemName: "calendar")
                                .font(.system(size: 15))
                            
                            Text("Sort ")
                                .font(.system(size: 15))
                            
                        } .foregroundColor(Color.gray.opacity(100))
                            
                    }
                    .padding(.top, 15)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    
                    
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                
                
            // Sorting Tasks by Due Date
                ScrollView(.horizontal) {
                    ZStack {
                        Rectangle()
                            .frame(width: 120, height: 40)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        
                        Image(systemName: <#T##String#>)
                        Text("Recent")
                            .font(.system(size: 15))
                            
                    }
                    
                } .padding(.leading)
                
            }
            
        }
    }
}

#Preview {
    TasksView(viewModel: TasksViewModel())
}
