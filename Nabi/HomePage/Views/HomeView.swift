//
//  HomeView.swift
//  Nabi
//
//  Created by Tudor Iustin on 21/08/2025.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    // ViewModel Integration
    @ObservedObject var viewModel: MainScreenViewModel
    
    @State private var isDueSoonSelected = false
    @State private var isOverdueSelected = false
    
    
    let bgColor = Color(red: 248/255, green: 244/255, blue: 244/255).opacity(0.8)
    let today = Date()
    
    

    var body: some View {
        ZStack (alignment: .topTrailing) {
            
            //Background Color Var
            bgColor.ignoresSafeArea()
            VStack { //main content
                
                // Fetch Real-time Date
                HStack {
                    Text(today.formatted(.dateTime.weekday(.abbreviated)))
                        .font(.system(size: 50))
                        .bold()
                        .foregroundStyle(Color.black.opacity(100))
                    Spacer()
                    
                    // Date Bar
                    VStack(alignment: .trailing, spacing: 0) {
                        // Day & Month
                        Text(today.formatted(.dateTime.month(.wide).day()))
                            .font(.system(size: 22))
                            .bold()
                            .foregroundStyle(Color.black.opacity(0.7))
                        
                        // Curent Year
                        Text(today.formatted(.dateTime.year()))
                            .font(.system(size: 22))
                            .foregroundStyle(Color.black.opacity(0.3))
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 1)
                
                
                
                    // First Line
                    HStack {
                        Text("\(viewModel.userSummary.first?.dayTime ?? ""),")
                            .foregroundColor(Color.black.opacity(0.5))
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                        
                        Text("\(viewModel.userSummary.first?.userName ?? "").")
                            .foregroundColor(Color.black)
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // Short Summary
                    
                    HStack {
                        Text("You have")
                            .foregroundColor(Color.black.opacity(0.5))
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                        
                        Image(systemName: "inset.filled.circle")
                            .foregroundColor(Color.black)
                        
                        Text("\(viewModel.userSummary.first?.currentMeetings ?? 0) meetings,")
                            .foregroundColor(Color.black)
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "pencil.and.outline")
                            .foregroundColor(Color.black)
                        
                        Text("\(viewModel.userSummary.first?.upcomingTasks ?? 0) tasks,")
                            .foregroundColor(Color.black)
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                        
                        Text("and")
                            .foregroundColor(Color.black.opacity(0.5))
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                        
                        Image(systemName: "repeat")
                            .foregroundColor(Color.black)
                            
                        
                        Text("\(viewModel.userSummary.first?.currentHabits ?? 0) habits,")
                            .foregroundColor(Color.black)
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    HStack {
                        Text("left today.")
                            .foregroundColor(Color.black.opacity(0.5))
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                    
    // My Tasks Section

                VStack {
                    HStack {
                        Text("My Tasks")
                            .font(.system(size: 25))
                            .bold()
                            .foregroundStyle(Color.black.opacity(100))
                        
                        Spacer()
                        Text("See all")
                            .font(.system(size: 18))
                            .foregroundStyle(Color.gray.opacity(100))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    .padding(.leading,5)
                    .padding(.bottom,1)
                    
                    
                    // Task Deadlines
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 110, height: 30)
                                .cornerRadius(5)
                                .foregroundColor(isDueSoonSelected ? Color.gray.opacity(0.2) : Color.white)

                                
                                
                            Image(systemName: "app.badge.checkmark")
                                .font(Font.system(size: 15))
                                .padding(.trailing, 75)
                            
                            
                            Text("Due Soon")
                                .font(Font.system(size: 15))
                                .padding(.leading, 30)

                        }
                        .onTapGesture {
                            isDueSoonSelected = true
                            isOverdueSelected = false
                        }
                        
                        Spacer().frame(width: 10)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 110, height: 30)
                                .cornerRadius(5)
                                .foregroundColor(isOverdueSelected ? Color.gray.opacity(0.2) : Color.white)
                                
                                
                                
                            Image(systemName: "app.badge.checkmark")
                                .font(Font.system(size: 15))
                                .padding(.trailing, 75)
                            
                            
                            Text("Overdue")
                                .font(Font.system(size: 15))
                                .padding(.leading, 30)

                        }
                        .onTapGesture {
                            isOverdueSelected = true
                            isDueSoonSelected = false
                        }
                    }
                        .padding(.leading,6)
                        .padding(.bottom, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                 
                    
                    // Tasks Scroll Vie
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 120)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Water Plants")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .padding(.bottom, 60)
                                    
                                    Text("🪴")
                                        .font(Font.system(size: 30))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing)
                                        .padding(.bottom, 60)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .frame(alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top, 60)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    Text("12/09/2025")
                                        .font(Font.system(size: 15))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing, 45)
                                        .padding(.top, 60)
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 25)
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                            .foregroundColor(Color.green.opacity(0.3))
                                            
                                        
                                        Text("Low")
                                            .font(Font.system(size: 15))
                                            .frame(alignment: .trailing)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                    }
                                    

                                }
                            } .padding(.trailing,5)
                            
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 120)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Finish app feature")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .padding(.bottom, 60)
                                    
                                    Text("📱")
                                        .font(Font.system(size: 22))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing)
                                        .padding(.bottom, 60)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .frame(alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top, 60)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    Text("10/19/2025")
                                        .font(Font.system(size: 15))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing, 45)
                                        .padding(.top, 60)
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 25)
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                            .foregroundColor(Color.red.opacity(0.3))
                                            
                                        
                                        Text("High")
                                            .font(Font.system(size: 15))
                                            .frame(alignment: .trailing)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                    }
                                    

                                }
                                
                            } .padding(.trailing,5)
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 120)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Go to the gym")
                                        .font(.system(size: 22))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .padding(.bottom, 60)
                                    
                                    Text("🏋️‍♀️")
                                        .font(Font.system(size: 22))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing)
                                        .padding(.bottom, 60)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .frame(alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top, 60)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    Text("11/9/2025")
                                        .font(Font.system(size: 15))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing, 45)
                                        .padding(.top, 60)
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 25)
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                            .foregroundColor(Color.yellow.opacity(0.3))
                                            
                                        
                                        Text("Med")
                                            .font(Font.system(size: 15))
                                            .frame(alignment: .trailing)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                    }
                                    

                                }
                                
                            } .padding(.trailing,5)
                        }
                        
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .padding(.bottom, 10)
                
                
                
    // Habits Section
                
                VStack {
                    HStack {
                        Text("Habits")
                            .font(.system(size: 25))
                            .bold()
                            .foregroundStyle(Color.black.opacity(100))
                        
                        Spacer()
                        Text("See all")
                            .font(.system(size: 18))
                            .foregroundStyle(Color.gray.opacity(100))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    .padding(.bottom,1)
                    .padding(.leading,5)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 120)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Drink 2L of water")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .padding(.bottom, 60)
                                    
                                    Text("💧")
                                        .font(Font.system(size: 30))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing)
                                        .padding(.bottom, 60)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .frame(alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top, 60)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    Text("Daily")
                                        .font(Font.system(size: 15))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing, 75)
                                        .padding(.top, 60)
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 25)
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                            .foregroundColor(Color.red.opacity(0.3))
                                            
                                        
                                        Text("High")
                                            .font(Font.system(size: 15))
                                            .frame(alignment: .trailing)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                    }
                                    

                                }
                            } .padding(.trailing,5)
                            
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 120)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Read for 20 min")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .padding(.bottom, 60)
                                    
                                    Text("📖")
                                        .font(Font.system(size: 22))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing)
                                        .padding(.bottom, 60)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .frame(alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top, 60)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    Text("Daily")
                                        .font(Font.system(size: 15))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing, 75)
                                        .padding(.top, 60)
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 25)
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                            .foregroundColor(Color.yellow.opacity(0.3))
                                            
                                        
                                        Text("Med")
                                            .font(Font.system(size: 15))
                                            .frame(alignment: .trailing)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                    }
                                    

                                }
                                
                            } .padding(.trailing,5)
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 120)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Clean apartment")
                                        .font(.system(size: 22))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .padding(.bottom, 60)
                                    
                                    Text("🏠")
                                        .font(Font.system(size: 22))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing)
                                        .padding(.bottom, 60)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .frame(alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top, 60)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    Text("Weekly")
                                        .font(Font.system(size: 15))
                                        .frame(alignment: .trailing)
                                        .padding(.trailing, 45)
                                        .padding(.top, 60)
                                        .foregroundColor(Color.black.opacity(0.6))
                                    
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 25)
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                            .foregroundColor(Color.yellow.opacity(0.3))
                                            
                                        
                                        Text("Med")
                                            .font(Font.system(size: 15))
                                            .frame(alignment: .trailing)
                                            .padding(.trailing)
                                            .padding(.top, 60)
                                    }
                                    

                                }
                                
                            } .padding(.trailing,5)
                        }
                        
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                
                
            } // end of main VStack
        } // end of main Z Stack
    }
}

#Preview {
    HomeView(viewModel: MainScreenViewModel())
}

