//
//  StatisticViewController.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 07.06.2023.
//

import UIKit
import SnapKit

class StatisticViewController: UIViewController {

    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialaze()
    }
    
    func initialaze(){
        title = "GCD"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(150)
        }
    }
    @objc func tap() {
        let vc = ImageViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
 
}
