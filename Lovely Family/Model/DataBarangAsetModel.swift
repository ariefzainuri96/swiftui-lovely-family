//
//  DataBarangAsetModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

struct DataBarangAsetModel: Identifiable, Codable {
    let id: String
    var namaBarang: String
    var noBarang: String
    var jumlah: String
    var ruang: String
    var deskripsi: String
    var spesifikasi: String
}

struct DetailDataBarangAsetModel: Codable {
    var noInventaris: String?
    var namaAset: String?
    var deskripsiAset: String?
    var spesifikasiAset: String?
    var isAsetSPK: Bool?
    var noSPK: String?
    var vendor: String?
    var tipeAset: String?
    var kategoriAset: String?
    var subKategoriAset: String?
    var kampus: String?
    var ruang: String?
    var convidentality: String?
    var integrity: String?
    var availability: String?
    var tanggalAkuisisi: String?
    var tanggalDepresiasi: String?
    var asetTerdepresiasi: String?
    var sumberAset: String?
    var jumlahAset: String?
    var nvb: String?
    var statusAset: String?
    
    mutating func update<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) {
        self[keyPath: keyPath] = value
    }
}
