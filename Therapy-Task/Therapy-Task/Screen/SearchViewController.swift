//
//  SearchViewController.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 09/02/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
        }
    }
    
    private let viewModel = SearchViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.bounds.width / 3) - 20, height: (collectionView.bounds.width / 3) - 20)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.register(TherapyCollectionViewCell.nib(), forCellWithReuseIdentifier: TherapyCollectionViewCell.reuseIdentifier())
        bind()
        viewModel.getTherapyList()
    }
    
    func bind() {
        viewModel.therapyList.subcribe { [weak self] data in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

}

extension SearchViewController: UICollectionViewDataSource {
    
    var therapyList: [TherapyListDetail] {
        viewModel.therapyList.value
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return therapyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TherapyCollectionViewCell.reuseIdentifier(), for: indexPath) as! TherapyCollectionViewCell
        let therapyDetail = therapyList[indexPath.item]
        cell.configure(therapy: therapyDetail)
        return cell
    }
    
}
