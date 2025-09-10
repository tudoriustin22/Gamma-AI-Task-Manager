//
//  HomeViewV2.swift
//  Gamma
//
//  Created by Tudor Iustin on 08/09/2025.
//

import SwiftUI


struct HomeViewV2: View {
    
    @ObservedObject var viewModel: MainScreenViewModel                              // ViewModel
    var bgColor = Color(red: 0x12/255, green: 0x12/255, blue: 0x12/255)             // View Background Color

    var currentDateString: String {                           // Fetch current Date and format display style
        let formatter = DateFormatter()
        formatter.dateFormat = "d EEE"
        return formatter.string(from: Date())
    }

    var body: some View {
        
        // Main View Body
        
        ZStack (alignment: .topLeading) {
            bgColor.ignoresSafeArea()
            
        // Greeting and Profile Photo
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Hi 👋🏻 \(viewModel.userSummary.first?.userName ?? "")!")
                        .foregroundStyle(Color.white)
                    
                    Text("Welcome back")
                        .foregroundStyle(Color.white)
                }
                .font(.system(size: 25))
                .fontWeight(.medium)
                
                Spacer()
                
                Image("Profile Photo")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    
                
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 7)
            
            
        //ScrollView Content
            
            ScrollView {
                
        // First Element Body
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 260)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .foregroundStyle(Color(red: 217/255, green: 217/255, blue: 171/255))
                    
            // Current Date and Day
                    HStack {
                        HStack {
                            Image(systemName: "calendar")
                            
                            Text(currentDateString)
                                .foregroundColor(Color.black.opacity(0.5))
                                .fontWeight(.semibold)
                                
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 190)
                        .padding(.leading, 30)
                        
            // Share Tasks Button
                        ZStack {
                            Circle()
                                .foregroundColor(Color.white.opacity(0.4))
                            
                            Image(systemName: "square.and.arrow.up")
                        }
                        .frame(width: 50)
                        .padding(.trailing,5)
                        .padding(.bottom, 160)
                        
            // Add Taks Button
                        ZStack {
                            Circle()
                                .foregroundColor(bgColor)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .frame(width: 50)
                        .padding(.trailing, 30)
                        .padding(.bottom, 160)
                            
                    }
                    
            // Tasks summary
                    VStack(alignment: .leading, spacing: 2) {
                        
                        Text("Current tasks")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.bottom, 8)
                        
            // Tasks count
                        
                        Text("You have \(viewModel.userSummary.first?.upcomingTasks ?? 0)")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.black)
                        
                        HStack(spacing: 8) {
                            Text("tasks")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(.black)
                            
                            
            // Arrow Element
                            ZStack {
                                Capsule()
                                    .foregroundColor(.white)
                                    .frame(width: 70, height: 25)
                                    .padding(.horizontal, -4)
                                   
                                HStack(spacing: 2) {
                                    
                                    Text("High")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(Color(red: 180/255, green: 100/255, blue: 100/255))
                                    
                                    Image(systemName: "arrow.up.right")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(Color(red: 180/255, green: 100/255, blue: 100/255))
                                }
                                .padding(.horizontal, 8)
                            }
                            
                            Text("for today")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.bottom, 10)
                    
                    Rectangle()
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .padding(.top,150 )
                        .padding([.trailing, .leading], 30)
                        .foregroundColor(Color.gray)
                        
                    
                    
            // Sample Hashtags
                    HStack (spacing: 30) {
                        Text(" #shopping")
                        Text(" #office")
                        Text(" #work")
                    }
                    .padding(.top,195 )
                    .padding([.trailing, .leading], 30)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
        // 2nd stack (duplicate inserted here)
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .foregroundStyle(Color.white)
                    
                    ZStack {
                        Rectangle()
                            .frame(width:50, height: 85)
                            .cornerRadius(30)
                    } .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                    
        // Date Display
                    VStack(spacing: 0) {
                        
                        Text(Date(), format: .dateTime.day())
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                        Text(Date(), format: .dateTime.weekday(.abbreviated))
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 38)
                    
        // Chat to Gamma AI
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 4) {
                            Text("Gamma AI")
                                .font(Font.system(size: 18, weight: .semibold))
                                .foregroundColor(Color.black)
                            Image(systemName: "apple.intelligence")
                                .font(Font.system(size: 16, weight: .semibold))
                                .foregroundColor(Color.black)
                                .padding(.bottom, 1)
                        } .padding(.bottom, 5)
                        Text("Your private on-device AI")
                            .font(Font.system(size: 16))
                    }
                    .padding(.leading, 100)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack {
                        Circle()
                            .foregroundColor(bgColor)
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                    }
                    .frame(width: 50)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                }
                
        // 3rd Stack
                ZStack {
                    
                    // Main Frame
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 370)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .foregroundStyle(Color.white)
                    
                    // Card Title
                    HStack (spacing: 5) {
                        Image(systemName: "lasso.badge.sparkles")
                        Text("by")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black.opacity(0.6))
                        
                        Text("Gamma Daily")
                            .fontWeight(.semibold)
                        
                        
                        Spacer()
                        
                        HStack {
                            // Eye Circle (like share task)
                            ZStack {
                                Circle()
                                    .foregroundColor(bgColor.opacity(0.1))
                                Image(systemName: "eye")
                                    .foregroundColor(bgColor)
                                    .font(.system(size: 18))
                            }
                            .frame(width: 50)
                            .padding(.trailing, 5)

                            // Arrow Circle (like add task)
                            ZStack {
                                Circle()
                                    .foregroundColor(bgColor)
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .frame(width: 50)
                            .padding(.trailing, 30)
                        }

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .font(.system(size: 20))
                    .padding(.bottom, 285)
                    
            // Mock Article
                    VStack (alignment: .leading) {
                        Text("Community")
                            .font(.system(size: 20).weight(.semibold))
                            
                        Text("Productive Routine.")
                            .font(.system(size: 30).weight(.semibold))
                            .padding(.top,0.5)
                        
                
                    } .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.bottom, 140)
                    
                    
                    ZStack (alignment: .leading) {
                        Image("Demo Photo 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 1600)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .padding(.top, 145)
                            .padding(.leading,32)
                            .padding(.trailing,32)
                      
                        Capsule()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color.white.opacity(0.3))
                            .padding(.top, 250)
                            .padding(.leading, 40)
                        
                        VStack {
                            Image(systemName: "eye")
                            
                            Text("168")
                            
                        }   .padding(.top, 250)
                            .padding(.leading, 52)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 15))
                        
                    } .frame(maxWidth: .infinity)
                        
                        
                    
                }

            }
            .padding(.top, 110)
            .padding(.bottom, 7)
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    HomeViewV2(viewModel: MainScreenViewModel())
}

