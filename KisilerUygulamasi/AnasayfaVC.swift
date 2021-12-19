//
//  AnasayfaVC.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import UIKit

class AnasayfaVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self // Protokolü sayfaya bağlamamızı sağlar. DidLoad' da çağırmamız lazım extension' a almıyoruz.
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "22222")
        kisilerListe.append(k1)
        kisilerListe.append(k2)
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

extension AnasayfaVC: UISearchBarDelegate { // AnasayfaVC ' i genişletiyoruz
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu : \(searchText)")
    }
}

extension AnasayfaVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row] // kişi nesnemizi aldık
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre",for: indexPath) as! TableViewHucre
        
        hucre.kisiBilgiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
//        print("Kişi : \(kisi.kisi_id!) - \(kisi.kisi_ad!) - \(kisi.kisi_tel!)")
        tableView.deselectRow(at: indexPath, animated: true) // Satırın seçili görüntüsünü kaldırır.
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let kisi = self.kisilerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi ?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
                // Tıklanınca bir şey yapmadım henüz
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                print("\(kisi.kisi_id!) silindi.")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
