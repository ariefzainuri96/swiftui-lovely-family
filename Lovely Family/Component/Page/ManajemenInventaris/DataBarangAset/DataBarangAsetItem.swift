//
//  DataBarangAsetItem.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import SwiftUI

struct DataBarangAsetItem: View {
    let data: DataBarangAsetModel
    
    @State private var isEditActive = false
    
    let menus: [PopupMenuModel] = [
        PopupMenuModel(title: "Edit", icon: "ic-edit"),
        PopupMenuModel(title: "Hapus", icon: "ic-trash", color: "#FF5D5D"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination:
                            EditDataBarangAsetView(data: data),
               isActive: self.$isEditActive) {
                 EmptyView()
            }.hidden()
            
            HStack(alignment: .top, spacing: 0) {
                Text(data.namaBarang).font(.system(size: 14, weight: .medium, design: .default)).frame(maxWidth: .infinity, alignment: .leading)
                
                Menu(content: {
                    ForEach(Array(menus.enumerated()), id: \.element.title) {index, item in
                        CustomPopupItem(data: item) {
                            if index == 0 {
                                isEditActive.toggle()
                            }
                        }
                    }
                }) {
                    Image("ic-menu-more").frame(width: 16, height: 16)
                }
            }
            
            HStack(spacing: 0) {
                Text(data.noBarang).font(.system(size: 12, weight: .regular, design: .default)).frame(maxWidth: .infinity, alignment: .leading)
                Text("\(data.jumlah) Unit . \(data.ruang)").font(.system(size: 12, weight: .regular, design: .default)).frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.top, 4)
            
            Divider().frame(height: 1).overlay(Color("#EFEFEF")).padding(.all, 0).padding(.vertical, 4)
            
            CustomExpandable(header: {
                HeaderItem(title: "Deskripsi")
            }) {
                Text(data.deskripsi).font(.system(size: 14, weight: .thin, design: .default)).foregroundColor(Color("#828282")).padding(.top, 4)
            }
            
            Divider().frame(height: 1).overlay(Color("#EFEFEF")).padding(.all, 0).padding(.vertical, 4)
            
            CustomExpandable(header: {
                HeaderItem(title: "Spesifikasi")
            }) {
                Text(data.spesifikasi).font(.system(size: 14, weight: .thin, design: .default)).foregroundColor(Color("#828282")).padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 16)
        .background(.white)
        .cornerRadius(6)
        .clipped()
        .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 1)
    }
}

struct HeaderItem: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title).font(.system(size: 14, weight: .regular, design: .default)).foregroundColor(Color("#333333"))
            
            Spacer()
            
            Image("ic-chevron-down").frame(width: 16, height: 16)
        }
    }
}
