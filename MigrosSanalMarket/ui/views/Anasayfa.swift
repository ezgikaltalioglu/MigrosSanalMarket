//
//  ViewController.swift
//  MigrosSanalMarket
//
//  Created by Ezgi Kaltalıoğlu on 18.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var resimListesi = [Resim]()
    
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
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        
        let erkangenislik = UIScreen.main.bounds.width
        let itemGenislik = (erkangenislik-20)/2
        
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





