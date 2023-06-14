//
//  asyncAfter.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 14.06.2023.
//

import UIKit
import SnapKit
class asyncAfter: UIViewController {

    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.center.equalToSuperview()
        }
        afterBlock(seconds: 2, queue: .main) {
            print("Hello")
            print(Thread.current)
        }
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            DispatchQueue.concurrentPerform(iterations: 200000) {
//                print("\($0) times")
//            }
//        }
        myInactiveQueue()
        
    }
    func myInactiveQueue(){
        let inactiveQueue = DispatchQueue(label: "silben", attributes: [.concurrent, .initiallyInactive]) // если добавляем этот атрибут, то у очереди пропадает автоматический запуск
        inactiveQueue.async {
            print("Done!")
        }
        print("not yet startet...")
        inactiveQueue.activate() //активируем
        print("active ")
        inactiveQueue.suspend() //оставнавливем очередь, ставим на паузу
        print("pause")
        inactiveQueue.resume() // отпускаем очередь
        
    }

   
    func afterBlock(seconds: Int, queue: DispatchQueue , coplition: @escaping()->()){ // эскейпинг держит все в памяти до определенного действия, очередь по умолчанию  - которая после =, тем самым у нас две функции на выбор
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            coplition()
        }
        
    }

}
