//
//  KisiKayitProtocols.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

protocol PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad:String, kisi_tel:String)
}

protocol ViewToPresenterKisiKayitProtocol {
    // Presenter içinden Interactordaki metodu çalıştırabilmek için bir değişkene ihtiyaç var
    var kisiKayitInteractor:PresenterToInteractorKisiKayitProtocol? {get set}
    
    func ekle(kisi_ad:String,kisi_tel:String)
}

protocol PresenterToRouterKisiKayitProtocol {
    static func createModule(ref:KisiKayitVC) // hangiview yani hangi modülle uğraşıyorsak onu ref ediyoruz.
}
