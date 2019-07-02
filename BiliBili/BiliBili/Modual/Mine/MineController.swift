//
//  MineController.swift
//  BiliBili
//
//  Created by Near on 2019/6/29.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit
import RxDataSources

class MineController: BaseViewController {

    let mineViewModel = MineViewModel()
    
    var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        let mineView = MineView.loadFromNib()
        self.view = mineView
        
        // FIXME: Delete
        mineView.settingButton.addTarget(self, action: #selector(MineController.onClickSetting(button:)), for: .touchUpInside)
        
        mineView.collectionView.register(UINib(nibName: "DefaultCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
//        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, SectionDataModel>>()
    }
    
    @objc func onClickSetting(button: UIButton) {
        button.isSelected = !button.isSelected
        let index = button.isSelected ? 0 : 1
        ThemeManager.setTheme(index: index)
        print("123: \(index)")
//        let settings = SettingController()
//        self.navigationController?.pushViewController(settings, animated: true)
    }
}

// MARK: - Life cycle.
extension MineController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
