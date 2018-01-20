//
//  PaisesTableViewController.swift
//  DesafioRealmMapa
//
//  Created by Swift on 19/01/2018.
//  Copyright © 2018 Corporate. All rights reserved.
//

import UIKit
import RealmSwift

class PaisesTableViewController: UITableViewController {

    var quantidadePaises: Int = 0
    var arrayPaises = [String: [[String:Any]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.carregarPaises()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.quantidadePaises
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    // MARK: - Métodos próprios
    func carregarPaises() {
        let realm = try! Realm()
        
        let paisesDB = realm.objects(Paises.self)
        
        if paisesDB.count == 0 {
            self.carregarJason()
        }    
        self.carregarDB()
        
    }
    
    func carregarDB() {
        
        let realm = try! Realm()
        
        let paisesDB = realm.objects(Paises.self)
        
    }
    
    func carregarJason() {
                
        let caminhoArquivo = Bundle.main.url(forResource: "paises", withExtension: "json")
        let paisesJson: Data = try! Data(contentsOf: caminhoArquivo!)
        
        do {
            
            arrayPaises = try JSONSerialization.jsonObject(with: paisesJson, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: [[String:Any]]]  
            
        } catch {
            
            print("Erro ao ler o aquivo Json")
            
        }
        
        let realm = try! Realm()

        self.quantidadePaises = arrayPaises["paises"]!.count
        
        for indicePais in 0..<self.quantidadePaises {
            
            let pais = arrayPaises["paises"]![indicePais]
            let paisPersist = Paises()
           
            paisPersist.nome = pais["name"] as? String
            paisPersist.latitude.value = pais["latitude"] as? Float
            paisPersist.longitude.value = pais["longitude"] as? Float
            
            try! realm.write {
                realm.add(paisPersist)
            }
            
        }
    }
    
}
