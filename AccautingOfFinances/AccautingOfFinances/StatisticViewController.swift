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
//        afterBlock(seconds: 3) {
//            print("Hello")
//            DispatchQueue.main.async {
//                self.showAlert()
//            }
//            print(Thread.current)
//        }
    }
    
    @objc func tap() {
//        let vc = ImageViewController()
//        navigationController?.pushViewController(vc, animated: true)
        let vc = asyncAfter()
        navigationController?.pushViewController(vc, animated: true)
    }
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global() , coplition: @escaping()->()){ // эскейпинг держит все в памяти до определенного действия, очередь по умолчанию  - которая после =, тем самым у нас две функции на выбор
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            coplition()
        }
    }
    func showAlert(){
        let alert = UIAlertController(title: nil, message: "Hello", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
