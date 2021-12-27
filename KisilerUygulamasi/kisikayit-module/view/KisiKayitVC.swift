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
    
    var kisiKayitPresenterNesnesi:ViewToPresenterKisiKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KisiKayitRouter.createModule(ref: self)
        
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let kA = tfKisiAd.text, let kT = tfKisiTel.text {
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: kA, kisi_tel: kT)
        }
    }
    

    
}
