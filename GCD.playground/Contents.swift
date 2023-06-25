import UIKit
import PlaygroundSupport


//print(Thread.current)
//
//let operation = {
//    print("Start")
//    print(Thread.current)
//}
//
//let queue = OperationQueue()
//queue.addOperation(operation)
//print(Thread.current)
//
//var result: String?
//let cocatOperation = BlockOperation{
//    result = "jopa"
//    print(Thread.current)
//}
////cocatOperation.start()
////print(result)
//let queue = OperationQueue()
//queue.addOperation(cocatOperation)
let queue = OperationQueue()
queue.addOperation {
    print("test")
    print(Thread.current)
}
    
