//
//  AnasayfaRouter.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

class AnasayfaRouter: PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        // View için yetkilendirme
        ref.anasayfaPresenterNesnesi = presenter
        
        // Presenter için yetkilendirme
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        
        // Interactor için yetkilendirme
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
    
    
}
