//
//  ImageViewController.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 13.06.2023.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {

    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
            image.isUserInteractionEnabled = false

        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        loadFoto()
    }
    
    func initialize(){
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }
    }
    func loadFoto(){
        guard let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg") else {return}
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
           
            if let data = try? Data(contentsOf: imageURL){
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data )
                }
            }
        }
    }

}
