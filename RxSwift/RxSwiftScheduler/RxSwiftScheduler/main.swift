//
//  main.swift
//  RxSwiftScheduler
//
//  Created by Данила Рахманов on 06.11.2024.
//

import Foundation
import RxSwift

import RxSwift

let observable = Observable<Int>.create { (observer) -> Disposable in
    print("thread observable -> \(Thread.current)")
    observer.onNext(1)
    observer.onNext(2)
    return Disposables.create()
}.subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))

let disposable = observable
    .observe(on: MainScheduler.instance)
    .subscribe({ (e) in
        print("thread -> \(Thread.current)")
        print(e)
})

//func fetchData() -> Observable<Data> {
//    return Observable.create { observer in
//        Task {
//            do {
//                let url = URL(string: "http://jsonplaceholder.typicode.com/posts/1")!
//                let (data, _) = try await URLSession.shared.data(from: url)
//                observer.onNext(data)
//                observer.onCompleted()
//            } catch {
//                observer.onError(error)
//            }
//        }
//        
//        return Disposables.create()
//    }
//}
//
//let disposable = fetchData()
//    .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
//    .observe(on: MainScheduler.instance)
//    .subscribe { event in
//        switch event {
//        case .next(let data):
//            print("данные: \(data)")
//        case .error(let error):
//            print("ошибка: \(error)")
//        case .completed:
//            print("завершено")
//        }
//        print("thread: \(Thread.current)")
//    }
//
RunLoop.main.run()
