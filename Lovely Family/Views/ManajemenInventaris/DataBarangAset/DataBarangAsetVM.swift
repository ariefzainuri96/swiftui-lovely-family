//
//  DataBarangAsetVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import Perception

@Perceptible class DataBarangAsetVM {
    let dataBarangAsetRepository = DataBarangAsetRepositoryImpl()
    
    var dataBarangAsetList: [DataBarangAsetModel] = []
    var dataBarangAsetState = RequestState.IDLE
    
    func getDataBarangAset() async {
        dataBarangAsetState = RequestState.LOADING
        
        guard let data = await dataBarangAsetRepository.getDataBarangAset() else {
            dataBarangAsetState = RequestState.ERROR
            return
        }
        
        dataBarangAsetState = RequestState.SUCCESS
        dataBarangAsetList = data
    }
    
    func reset() {
        dataBarangAsetState = RequestState.IDLE
        dataBarangAsetList.removeAll()
    }
}
