//
//  main.swift
//  RxSwiftObservables
//
//  Created by Данила Рахманов on 05.11.2024.
//

import Foundation
import RxSwift

// MARK: - Observables

let singleElementObservable = Observable.just("Hello, RxSwift!")

let multipleElementsObservable = Observable.of(1, 2, 3)

let arrayObservable = Observable.from([1, 2, 3])

let emptyObservable = Observable<Int>.empty()

let neverObservable = Observable<String>.never()

let errorObservable = Observable<Void>.error(RxError.unknown)


// MARK: - Example 1
//
//let greetings = Observable.just("Hello, RxSwift!")
//let bag = DisposeBag()
//
//greetings.subscribe { event in
//    switch event {
//    case .next(let message):
//        print(message)
//    case .error(let error):
//        print("Error: \(error)")
//    case .completed:
//        print("Completed")
//    }
//}.disposed(by: bag)

// MARK: - Example 2

let bag = DisposeBag()

let subscription1 = singleElementObservable.subscribe(onNext: { value in
    print(value)
}, onError: { error in
    print(error)
}, onCompleted: {
    print("Completed")
}, onDisposed: {
    print("Disposed")
})

singleElementObservable.subscribe(onNext: { value in
    print(value)
})

// MARK: - Example 3
//Observable.of(1, 2, 3)
//    .map { $0 * 10 }
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: DisposeBag())
