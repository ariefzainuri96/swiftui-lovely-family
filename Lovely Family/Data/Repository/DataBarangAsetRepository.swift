//
//  DataBarangAsetRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import Foundation

protocol DataBarangAsetRepository {
    func getDataBarangAset() async -> [DataBarangAsetModel]?
    func getDetailBarangAset() async -> DetailDataBarangAsetModel?
    func getVendor() async throws -> [String]?
    func getKategoriAset() async throws -> [String]?
}

class DataBarangAsetRepositoryImpl: DataBarangAsetRepository {
    func getDataBarangAset() async -> [DataBarangAsetModel]? {
        do {
            try await Task.sleep(nanoseconds: getSecond(second: 1))
            
            let data = [
                DataBarangAsetModel(id: "1", namaBarang: "Nama Barang 1", noBarang: "noBarang 1", jumlah: "10", ruang: "Ruang 4D", deskripsi: "Contoh Deskripsi 1", spesifikasi: "Contoh Spesifikasi 1"),
                DataBarangAsetModel(id: "2", namaBarang: "Nama Barang 2", noBarang: "noBarang 2", jumlah: "10", ruang: "Ruang 4D", deskripsi: "Contoh Deskripsi 2", spesifikasi: "Contoh Spesifikasi 2"),
            ]
            
            let jsonData = try JSONEncoder().encode(data)
            //            let jsonString = String(data: jsonData, encoding: .utf8)!
            
            let decodedData = try JSONDecoder().decode([DataBarangAsetModel].self, from: jsonData)
            
            return decodedData
        } catch {
            print("Error happen: \(error)")
            return nil
        }
    }
    
    func getDetailBarangAset() async -> DetailDataBarangAsetModel? {
        do {
            try await Task.sleep(nanoseconds: getSecond(second: 1))
            
            let data = DetailDataBarangAsetModel(noInventaris: "123", namaAset: "Contoh Nama", deskripsiAset: "Lorem ipsum dolor sit amet", spesifikasiAset: "Spesifikasi Aset", isAsetSPK: false, noSPK: "12345", vendor: "", tipeAset: "", kategoriAset: "", subKategoriAset: "", kampus: "", ruang: "", convidentality: "", integrity: "", availability: "", tanggalAkuisisi: "", tanggalDepresiasi: "", asetTerdepresiasi: "", sumberAset: "", jumlahAset: "", nvb: "", statusAset: "")
            
            let jsonData = try JSONEncoder().encode(data)
            
            let decodedData = try JSONDecoder().decode(DetailDataBarangAsetModel.self, from: jsonData)
            
            return decodedData
        } catch {
            print("Error happen: \(error)")
            return nil
        }
    }
    
    func getVendor() async throws -> [String]? {
        do {
            try await Task.sleep(nanoseconds: getSecond(second: 1))
            
            var data: [String] = []
            for _ in Array(0...10) {
                data.append(generateRandomString(length: 10))
            }
            
            let jsonData = try JSONEncoder().encode(data)
            
            let decodedData = try JSONDecoder().decode([String].self, from: jsonData)
            
            return decodedData
        } catch {
            print("Error happen: \(error)")
            throw NetworkingError.INVALID_DATA
        }
    }
    
    func getKategoriAset() async throws -> [String]? {
        do {
            try await Task.sleep(nanoseconds: getSecond(second: 1))
            
            var data: [String] = []
            for _ in Array(0...10) {
                data.append(generateRandomString(length: 10))
            }
            
            let jsonData = try JSONEncoder().encode(data)
            
            let decodedData = try JSONDecoder().decode([String].self, from: jsonData)
            
            return decodedData
        } catch {
            print("Error happen: \(error)")
            throw NetworkingError.INVALID_DATA
        }
    }
}
