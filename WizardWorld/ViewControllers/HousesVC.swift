//
//  HousesVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

final class HousesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var houses: [House]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        title = "HOUSES"
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HousesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        houses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "houseCell", for: indexPath) as? HouseCell else { return UICollectionViewCell() }
        
        cell.houseNameLabel.text = houses[indexPath.item].name
        cell.houseImageView.image = UIImage(named: houses[indexPath.item].name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let houseDetailsVC = storyboard?.instantiateViewController(withIdentifier: "houseDetailsVC") as? HouseDetailsVC else { return }
        
        let selectedHouse = houses[indexPath.item]
        houseDetailsVC.house = selectedHouse

        navigationController?.pushViewController(houseDetailsVC, animated: true)
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension HousesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        let height = width + 50
        return CGSize(width: width, height: height)
    }
}



