//
//  KisiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        print("Kişi kayıt: \(kisi_ad) - \(kisi_tel)")
    }
}
