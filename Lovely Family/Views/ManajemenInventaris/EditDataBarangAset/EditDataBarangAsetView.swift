//
//  EditDataBarangAsetView.swift
//  Simart UMBY
//
//  Created by фкшуа on 05/12/24.
//

import SwiftUI
import Perception

struct EditDataBarangAsetView: View {
    let data: DataBarangAsetModel
    
    let viewModel = EditDataBarangAsetVM()
    
    var body: some View {
        @Perception.Bindable var bindableVM = viewModel
        
        WithPerceptionTracking {
            
            ZStack {
                Color(.white)
                
                if viewModel.state == RequestState.LOADING {
                    ProgressView().frame(width: 20, height: 20)
                } else if viewModel.state == RequestState.ERROR {
                    CustomError {
                        Task {
                            await viewModel.getDetailData(data: data)
                        }
                    }
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            CustomTextField(value: $bindableVM.detailData.noInventaris.toUnwrapped(defaultValue: ""), label: "No Inventaris", disabled: true)
                            
                            CustomTextField(value: $bindableVM.detailData.namaAset.toUnwrapped(defaultValue: ""), label: "Nama Aset")
                            
                            CustomTextField(value: $bindableVM.detailData.deskripsiAset.toUnwrapped(defaultValue: ""), label: "Deskripsi Aset", maxLine: 4, minLine: 4)
                            
                            CustomTextField(value: $bindableVM.detailData.spesifikasiAset.toUnwrapped(defaultValue: ""), label: "Spesifikasi Aset", maxLine: 8, minLine: 4)
                            
                            CustomCheckbox(isChecked: $bindableVM.detailData.isAsetSPK.toUnwrapped(defaultValue: false), title: "Aset SPK ?")
                            
                            HStack(spacing: 12) {
                                CustomTextField(value: $bindableVM.detailData.noSPK.toUnwrapped(defaultValue: ""), label: "No SPK", hint: "Isi No SPK")
                                    .frame(maxWidth: .infinity)
                                
                                CustomButtonBottomSheet(
                                    label: "Vendor",
                                    value: viewModel.detailData.vendor.defaultValue("Pilih Vendor"),
                                    isLoading: viewModel.vendorState == RequestState.LOADING,
                                    isSheetOpen: $bindableVM.isVendorOpen
                                ) {
                                    BottomSheetDropdown(title: "Pilih Vendor") {
                                        InfiniteBottomSheet(items: viewModel.vendor) { item, index in
                                            SimpleText(content: item) {
                                                if (index == viewModel.vendor.count - 1) {
                                                    Task {
                                                        await viewModel.getVendor(isInitial: false)
                                                    }
                                                }
                                            }.onTapGesture {
                                                viewModel.updateDetailData(\.vendor, to: item)
                                                viewModel.isVendorOpen.toggle()
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            HStack(spacing: 16) {
                                Text("Tipe Aset").font(.system(size: 14, weight: .regular, design: .default))
                                
                                CustomRadio(tag: "ATK", selection: $bindableVM.detailData.tipeAset, label: "ATK", spacing: 16)
                                
                                CustomRadio(tag: "Aset", selection: $bindableVM.detailData.tipeAset, label: "Aset", spacing: 16)
                            }
                            
                            HStack(spacing: 12) {
                                CustomButtonBottomSheet(
                                    label: "Kategori Aset",
                                    value: viewModel.detailData.kategoriAset.defaultValue("Pilih Kategori Aset"),
                                    isLoading: viewModel.kategoriAsetState == RequestState.LOADING,
                                    isSheetOpen: $bindableVM.isKategoriAsetOpen
                                ) {
                                    BottomSheetDropdown(title: "Pilih Kategori Aset") {
                                        InfiniteBottomSheet(items: viewModel.kategoriAset) { item, index in
                                            SimpleText(content: item) {
                                                if (index == viewModel.kategoriAset.count - 1) {
                                                    Task {
                                                        await viewModel.getKategoriAset(isInitial: false)
                                                    }
                                                }
                                            }
                                            .onTapGesture {
                                                viewModel.updateDetailData(\.kategoriAset, to: item)
                                                viewModel.isKategoriAsetOpen.toggle()
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                
                                CustomButtonBottomSheet(
                                    label: "Sub Kategori Aset",
                                    value: viewModel.detailData.subKategoriAset.defaultValue("Pilih Sub Kategori Aset"),
                                    isLoading: viewModel.vendorState == RequestState.LOADING,
                                    isSheetOpen: $bindableVM.isSubKategoriAsetOpen
                                ) {
                                    BottomSheetDropdown(title: "Pilih Sub Kategori Aset") {
                                        InfiniteBottomSheet(items: viewModel.vendor) { item, index in
                                            SimpleText(content: item) {
                                                if (index == viewModel.vendor.count - 1) {
                                                    Task {
                                                        await viewModel.getVendor(isInitial: false)
                                                    }
                                                }
                                            }
                                            .onTapGesture {
                                                viewModel.updateDetailData(\.subKategoriAset, to: item)
                                                viewModel.isSubKategoriAsetOpen.toggle()
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }.padding(.all, 16)
                    }
                }
            }
            .navigationTitle("Edit Data Barang Aset").navigationBarTitleDisplayMode(.inline)
            .task {
                let vendor = Task {
                    await viewModel.getVendor()
                }
                let detailData = Task {
                    await viewModel.getDetailData(data: data)
                }
                let kategoriAset = Task {
                    await viewModel.getKategoriAset()
                }
                
                // Await both tasks to ensure completion
                await vendor.value
                await detailData.value
                await kategoriAset.value
            }
        }
    }
}

struct InfiniteBottomSheet<T, Content: View>: View {
    let items: [T]
    let itemBuilder: (T, _ index: Int) -> Content
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    itemBuilder(item, index)
                }
            }.padding(.horizontal, 16)
        }
    }
}
