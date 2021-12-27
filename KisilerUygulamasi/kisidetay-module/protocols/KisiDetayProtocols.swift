//
//  KisiDetayProtocols.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String)
}

protocol ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor:PresenterToInteractorKisiDetayProtocol? {get set} // Interacator içerisindeki fonksiyonu tetiklemek için değişken oluşturduk.
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String)
}

protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: KisiDetayVC)
}
