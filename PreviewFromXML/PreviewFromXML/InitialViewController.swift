//
//  ViewController.swift
//  PreviewFromXML
//
//  Created by STV-M025 on 2019/11/07.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let linkPreview = LinkPreview()
    
    var linkPreviewData: LinkPreviewResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }

    private func setUp() {
        urlField.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "DataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DataCollectionViewCell")
        linkPreview.returnLinkPreviewDelegate = self
    }

    @IBAction func submit(_ sender: UIButton) {
        guard let urlStr = self.urlField.text else {
            return
        }
        linkPreview.requestingPreview(url: urlStr)
    }
}

extension InitialViewController: UITextFieldDelegate {
    
}

extension InitialViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath)
        guard let dataCollectionViewCell = cell as? DataCollectionViewCell else {
            return cell
        }
        if let setData = linkPreviewData {
            dataCollectionViewCell.setCell(linkPreviewData: setData)
        }
        return dataCollectionViewCell
    }
    
}

extension InitialViewController: UICollectionViewDelegate {
    
}

extension InitialViewController: ReturnLinkPreview {
    func linkPreview(result: LinkPreviewResponse) {
        linkPreviewData = result
        self.collectionView.reloadData()
    }
}

