//
//  ProfileData.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

struct ProfileData {
    var namaLengkap: String = ""
    var email: String = ""
    var telepon: String = ""
    var username: String = ""
    var nis: String = ""
    var nidn: String = ""
    
    init(namaLengkap: String, email: String, telepon: String, username: String, nis: String, nidn: String) {
        self.namaLengkap = namaLengkap
        self.email = email
        self.telepon = telepon
        self.username = username
        self.nis = nis
        self.nidn = nidn
    }
    
    init() {}
}
