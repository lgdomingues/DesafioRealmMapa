//
//  Paises.swift
//  DesafioRealmMapa
//
//  Created by Swift on 19/01/2018.
//  Copyright © 2018 Corporate. All rights reserved.
//

import UIKit
import RealmSwift

class Paises: Object {

    @objc dynamic var nome: String? = nil
    let latitude = RealmOptional<Float>()
    let longitude = RealmOptional<Float>()
   
}
