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
    
    let imageArray = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
//        loadFoto()
//        fetchImage2()
    }
    
    func initialize(){
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }
    }
//    func loadFoto(){
//        guard let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg") else {return}
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//
//            if let data = try? Data(contentsOf: imageURL){
//                DispatchQueue.main.async {
//                    self.image.image = UIImage(data: data )
//                }
//            }
//        }
////    }
//    func fetchFoto(){
//        guard let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg") else {return}
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            if let data = try? Data(contentsOf: imageURL){
//                DispatchQueue.main.async {
//                    self.image.image = UIImage(data: data)
//                }
//            }
//        }
//    }
    //DISPATCHWORK ITEM
//    func fetchImage2(){
//        guard let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg") else {return}
//
//        var data: Data?
//        let queue = DispatchQueue.global(qos: .utility)
//
//        let workUtem = DispatchWorkItem(qos: .userInteractive) {
//            data = try? Data(contentsOf: imageURL)
//            print(Thread.current)
//        }
//        queue.async(execute: workUtem) //когда наша задача здесь завершиться
//        workUtem.notify(queue: DispatchQueue.main) { // срабатывает notify и переводит блок в main и
//            if let imageData = data {
//                self.image.image = UIImage(data: imageData )
//            }
//        }
//    }
//    func fetchImage2(){
//                guard let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg") else {return}
//        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
//            print(Thread.current)
//            if let imageData = data {
//                DispatchQueue.main.async {
//                    self.image.image = UIImage(data: imageData)
//                }
//            }
//        }
//        task.resume()
//    }
}
