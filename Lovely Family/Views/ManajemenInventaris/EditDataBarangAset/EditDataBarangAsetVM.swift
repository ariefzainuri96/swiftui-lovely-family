//
//  EditDataBarangAsetVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 07/12/24.
//

import Perception

@Perceptible class EditDataBarangAsetVM {
    let repo = DataBarangAsetRepositoryImpl()
    
    var state = RequestState.IDLE
    var detailData = DetailDataBarangAsetModel()
    
    let paginationMaxPage = 3
    
    var vendor: [String] = []
    var vendorPage = 1
    var vendorState = RequestState.IDLE
    
    var kategoriAset: [String] = []
    var kategoriAsetPage = 1
    var kategoriAsetState = RequestState.IDLE
    
    var isVendorOpen = false
    var isKategoriAsetOpen = false
    var isSubKategoriAsetOpen = false
    var isLocationOpen = false
    var isAvailabilityOpen = false
    var isConvidentalityOpen = false
    var isIntegrityOpen = false
    
    func updateDetailData<Value>(_ keyPath: WritableKeyPath<DetailDataBarangAsetModel, Value>, to value: Value) {
        detailData.update(keyPath, to: value)
    }
    
    func getDetailData(data: DataBarangAsetModel) async {
        state = RequestState.LOADING
        
        let data = await repo.getDetailBarangAset()
        
        state = data != nil ? RequestState.SUCCESS : RequestState.ERROR
        
        detailData = data ?? DetailDataBarangAsetModel()
    }
    
    func getVendor(isInitial: Bool = true) async {
        if (vendorState == RequestState.LOADING || vendorState == RequestState.LOADING_NEXT_PAGE || vendorState == RequestState.MAX_PAGE) {return}
        
        if (isInitial) {
            vendorPage = 1
            vendor.removeAll()
            vendorState = RequestState.IDLE
        }
        
        vendorState = isInitial ? RequestState.LOADING : RequestState.LOADING_NEXT_PAGE
        
        await performNetworkingTask(
            task: {
                return try await repo.getVendor()
            },
            onSuccess: {data in
                vendorState = RequestState.SUCCESS
                
                if (vendorPage == paginationMaxPage) {
                    vendorState = RequestState.MAX_PAGE
                }
                
                vendorPage += 1
                vendor.append(contentsOf: data)
            },
            onFailure: {error in
                vendorState = isInitial ? RequestState.ERROR : RequestState.ERROR_NEXT_PAGE
            }
        )
    }
    
    func getKategoriAset(isInitial: Bool = true) async {
        if (kategoriAsetState == RequestState.LOADING || kategoriAsetState == RequestState.LOADING_NEXT_PAGE || kategoriAsetState == RequestState.MAX_PAGE) {return}
        
        if (isInitial) {
            kategoriAsetPage = 1
            kategoriAset.removeAll()
            kategoriAsetState = RequestState.IDLE
        }
        
        kategoriAsetState = isInitial ? RequestState.LOADING : RequestState.LOADING_NEXT_PAGE
        
        await performNetworkingTask(
            task: {
                return try await repo.getKategoriAset()
            },
            onSuccess: {data in
                kategoriAsetState = RequestState.SUCCESS
                
                if (kategoriAsetPage == paginationMaxPage) {
                    kategoriAsetState = RequestState.MAX_PAGE
                }
                
                kategoriAsetPage += 1
                kategoriAset.append(contentsOf: data)
            },
            onFailure: {error in
                kategoriAsetState = isInitial ? RequestState.ERROR : RequestState.ERROR_NEXT_PAGE
            }
        )
    }
}
