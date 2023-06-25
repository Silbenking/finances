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
//        create()
//        semapfore2()
//        dispachGroup()
        dispachGroupCocurrent()
    }
    //WORKITEM
//    func create(){
//        let queue = DispatchQueue(label: "workItem")
//        queue.async {
//            print(Thread.current)
//            sleep(1)
//            print("task1")
//        }
//        queue.async {
//            print(Thread.current)
//            sleep(1)
//            print("task2")
//        }
//        let workItem = DispatchWorkItem {
//            print(Thread.current)
//            print("task3")
//        }
//        queue.async(execute: workItem)
//        workItem.cancel()
//    }
    
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
        let vc = ImageViewController()
        navigationController?.pushViewController(vc, animated: true)
//        let vc = asyncAfter()
//        navigationController?.pushViewController(vc, animated: true)
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
    func semaphore(){
        let queue = DispatchQueue(label: "ios", attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 2) // в этой очереди может проъодить два потока
        queue.async {
            semaphore.wait() // у value отнимается -1
            sleep(3)
            print("method 1")
            semaphore.signal() // добавляет value +1, готов принимать еще два потока
        }
        queue.async {
            semaphore.wait() // у value отнимается -1
            sleep(3)
            print("method 2")
            semaphore.signal() // добавляет value +1, готов принимать еще два потока
        }
        queue.async {
            semaphore.wait() // у value отнимается -1
            sleep(3)
            print("method 3")
            semaphore.signal() // добавляет value +1, готов принимать еще два потока
        }
        queue.async {
            semaphore.wait() // у value отнимается -1
            sleep(3)
            print("method 3")
            semaphore.signal() // добавляет value +1, готов принимать еще два потока
        }
    }
    func semapfore2(){
        let queue = DispatchQueue(label: "jopa", qos: .utility, attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 1)
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 10) { (id: Int) in
                semaphore.wait(timeout: .distantFuture)
                sleep(1)
                print("Block", String(id))
                semaphore.signal()
            }
        }
    }
    func dispachGroup(){
        let queue = DispatchQueue(label: "jopa")
        let dispGroup = DispatchGroup()
        queue.async(group: dispGroup){
            sleep(1)
            print("task1")
        }
        queue.async(group: dispGroup){
            sleep(1)
            print("task2")
        }
        dispGroup.notify(queue: .main){
            print("finish")
        }
    }
    func dispachGroupCocurrent(){
        let queue = DispatchQueue(label: "jopa", attributes: .concurrent)
        let dispGroup = DispatchGroup()
        dispGroup.enter()
        queue.async(group: dispGroup){
            sleep(3)
            print("task1")
            dispGroup.leave()
        }
        dispGroup.enter()
        queue.async(group: dispGroup){
            sleep(1)
            print("task2")
            dispGroup.leave()
        }
        dispGroup.wait()
        print("finish task 1 and task 2")
    }
    
}
