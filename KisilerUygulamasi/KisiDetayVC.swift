//
//  KisiDetayVC.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import UIKit

class KisiDetayVC: UIViewController {
    
    var kisi:Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            print("Kişi : \(k.kisi_id!) - \(k.kisi_ad!) - \(k.kisi_tel!)")
        }
        
    }
    
}
