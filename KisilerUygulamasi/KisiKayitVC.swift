//
//  KisiKayitVC.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import UIKit

class KisiKayitVC: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let kA = tfKisiAd.text, let kT = tfKisiTel.text {
            kayit(kisi_ad: kA, kisi_tel: kT)
        }
    }
    
    func kayit(kisi_ad:String, kisi_tel:String) {
        print("Kişi Kayıt : \(kisi_ad) - \(kisi_tel)")
    }
    
}
