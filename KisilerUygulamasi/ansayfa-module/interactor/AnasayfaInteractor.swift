//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    // veri tabanı erişim nesnesi
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisiler.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        
        db?.open()
        do {
            let c = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while c.next() {
                let kisi = Kisiler(
                    kisi_id: Int(c.string(forColumn: "kisi_id"))!,
                    kisi_ad: c.string(forColumn: "kisi_ad")!,
                    kisi_tel: c.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        var liste = [Kisiler]()
        
        db?.open()
        do {
            let c = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            while c.next() {
                let kisi = Kisiler(
                    kisi_id: Int(c.string(forColumn: "kisi_id"))!,
                    kisi_ad: c.string(forColumn: "kisi_ad")!,
                    kisi_tel: c.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func kisiSil(kisi_id: Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            tumKisileriAl()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
