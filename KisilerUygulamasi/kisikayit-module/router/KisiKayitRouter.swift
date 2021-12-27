//
//  KisiKayitRouter.swift
//  KisilerUygulamasi
//
//  Created by Kürşat Şimşek on 27.12.2021.
//

import Foundation

class KisiKayitRouter: PresenterToRouterKisiKayitProtocol {
    // module içerisinde kaç tane değişken tanımlandıysa o kadar yetki verilmesi gerekiyor.
    static func createModule(ref: KisiKayitVC) {
        ref.kisiKayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = KisiKayitInteractor()
    }
    

    
}
