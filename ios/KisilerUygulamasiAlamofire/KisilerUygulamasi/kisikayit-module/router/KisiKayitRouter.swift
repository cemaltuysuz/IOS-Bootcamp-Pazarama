//
//  KisiKayitRouter.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

class KisiKayitRouter : PresenterToRouterKisiKayitProtocol {
    static func createModule(ref: KisiKayitVC) {
        ref.kisiKayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = KisiKayitInteractor()
    }
}
