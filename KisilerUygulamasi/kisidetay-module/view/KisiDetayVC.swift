//
//  KisiDetayVC.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import UIKit

class KisiDetayVC: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler?
    
    var kisiDetayPresenterNesnesi:ViewToPresenterKisiDetayProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
//            print("Kişi : \(k.kisi_id!) - \(k.kisi_ad!) - \(k.kisi_tel!)")
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
        
        KisiDetayRouter.createModule(ref: self)
        
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let kA = tfKisiAd.text, let kT = tfKisiTel.text, let k = kisi {
            kisiDetayPresenterNesnesi?.guncelle(kisi_id: k.kisi_id!, kisi_ad: kA, kisi_tel: kT)
        }
    }
    
    
}
