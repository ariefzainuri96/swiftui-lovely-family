//
//  ProfileVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import Perception
import Foundation
import SwiftUI

@Perceptible class ProfileVM {
    private let profileRepo = ProfileRepositoryImpl()
    
    var profileData = ProfileResponse()
    var profileState = RequestState.IDLE
    var isEditable = false
    
    func getProfileData() async {
        profileState = RequestState.LOADING
        
        await delay(second: 1)
        
        await performNetworkingTask(
            task: {
                try await profileRepo.getProfile()
            },
            onSuccess: {data in
                profileState = RequestState.SUCCESS
                profileData = data
            },
            onFailure: { error in
                profileState = RequestState.ERROR
            }
        )
    }
    
    func resetData() {
        profileData = ProfileResponse()
    }
}
