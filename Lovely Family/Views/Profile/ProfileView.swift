//
//  Profile.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import SwiftUI
import Perception

struct ProfileView: View {
    @Environment(AppState.self) var appState
    
    let profileVM = ProfileVM()
    
    var body: some View {
        WithPerceptionTracking {
            @Perception.Bindable var _profileVM = profileVM
            
            ZStack {
                if profileVM.profileState == RequestState.LOADING {
                    ProgressView().frame(width: 20, height: 20, alignment: .center)
                } else if profileVM.profileState == RequestState.ERROR {
                    Text("Error")
                } else {
                    ScrollView {
                        VStack(spacing: 8) {
                            CustomTextField(value: $_profileVM.profileData.name.toUnwrapped(defaultValue: ""), label: "Nama Lengkap", disabled: !profileVM.isEditable)
                            
                            CustomTextField(value: $_profileVM.profileData.email.toUnwrapped(defaultValue: ""), label: "Email", disabled: !profileVM.isEditable)
                            
                            CustomTextField(value: $_profileVM.profileData.telepon.toUnwrapped(defaultValue: ""), label: "Telepon", disabled: !profileVM.isEditable)
                            
                            CustomTextField(value: $_profileVM.profileData.userName.toUnwrapped(defaultValue: ""), label: "Username", disabled: !profileVM.isEditable)
                            
                            CustomTextField(value: $_profileVM.profileData.nis.toUnwrapped(defaultValue: ""), label: "NIS", disabled: !profileVM.isEditable)
                            
                            CustomTextField(value: $_profileVM.profileData.nidn.toUnwrapped(defaultValue: ""), label: "NIDN", disabled: !profileVM.isEditable)
                            
                            CustomButton(title: "EDIT PROFILE", backgroundColor: Color("#4CD964")) {
                                print("edit")
                                profileVM.isEditable.toggle()
                            }.padding(.top, 16)
                            
                            CustomCommonMenu(title: "Edit Password", paddingHorizontal: 0) {
                                print("Testing")
                            }
                            
                            CustomCommonMenu(title: "Logout", textColor: "#EB5757", paddingHorizontal: 0) {
                                appState.logout()
                            }
                        }.padding(.all, 16)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await profileVM.getProfileData()
            }
            .onAppear {
                setNavigationBarLayout()
            }
            .onDisappear {
                profileVM.resetData()
            }
            
        }
    }
}
