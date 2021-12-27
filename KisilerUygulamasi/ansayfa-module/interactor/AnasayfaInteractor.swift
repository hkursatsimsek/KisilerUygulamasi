//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "22222")
        liste.append(k1)
        liste.append(k2)
        
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Arama sonucu : \(aramaKelimesi)")
    }
    
    func kisiSil(kisi_id: Int) {
        print("\(kisi_id) silindi.")
    }
    
    
}
