//
//  HomeViewV2.swift
//  Gamma
//
//  Created by Tudor Iustin on 08/09/2025.
//

import SwiftUI


struct HomeViewV2: View {
    
    @ObservedObject var viewModel: MainScreenViewModel // ViewModel
    var bgColor = Color(red: 0x12/255, green: 0x12/255, blue: 0x12/255) // View Background Color

    var currentDateString: String {
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
                        
                        
                        Circle()
                            .foregroundColor(Color.white.opacity(0.4))
                            .frame(width: 60)
                            .padding(.trailing,5)
                            .padding(.bottom, 160)
                        
                        Circle()
                            .foregroundColor(bgColor.opacity(0.8))
                            .frame(width: 60)
                            .padding(.trailing, 30)
                            .padding(.bottom, 160)
                            
                    }
                    
                }
                

                
            }
            .padding(.top, 110)
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    HomeViewV2(viewModel: MainScreenViewModel())
}

