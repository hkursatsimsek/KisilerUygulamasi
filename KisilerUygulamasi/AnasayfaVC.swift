//
//  AnasayfaVC.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import UIKit

class AnasayfaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func denemeButton(_ sender: Any) {
        let kisi = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "11111")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Tetiklemeyi yakalıyoruz
        if segue.identifier == "toDetay" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! KisiDetayVC
            gidilecekVC.kisi = kisi 
        }
    }
    
}
