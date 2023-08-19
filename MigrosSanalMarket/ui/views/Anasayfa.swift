//
//  ViewController.swift
//  MigrosSanalMarket
//
//  Created by Ezgi Kaltalıoğlu on 18.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var kampanyaCollectionView: UICollectionView!
    
    var resimListesi = [Resim]()
    var kampanyaListesi = [Kampanya]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    
        let logo = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: logo)
    
        
        let r1 = Resim(resim: "sanal", id: 1)
        let r2 = Resim(resim: "hemen", id: 2)
        let r3 = Resim(resim: "yemek", id: 3)
        let r4 = Resim(resim: "taze", id: 4)
        let r5 = Resim(resim: "macro", id: 5)
        let r6 = Resim(resim: "extra", id: 6)
        
        resimListesi.append(r1)
        resimListesi.append(r2)
        resimListesi.append(r3)
        resimListesi.append(r4)
        resimListesi.append(r5)
        resimListesi.append(r6)
        
        let k1 = Kampanya(kampanya: "kampanya", id: 1)
        kampanyaListesi.append(k1)

        
        
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let erkangenislik = UIScreen.main.bounds.width
        let itemGenislik = (erkangenislik-30)/2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik)
        
        collectionView.collectionViewLayout = tasarim
        
    }


}


extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resimListesi.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let resim = resimListesi[indexPath.row]
            
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "hucre", for: indexPath) as! CollectionViewCell
            
            hucre.imageView.image = UIImage(named: resim.resim!)
            
            hucre.layer.borderColor = UIColor.lightGray.cgColor
            hucre.layer.borderWidth = 0.5
            hucre.layer.cornerRadius = 10.0
            
            return hucre
            
    
        }
    
}





