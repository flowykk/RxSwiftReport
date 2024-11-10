//
//  main.swift
//  RxSwiftOperators
//
//  Created by Данила Рахманов on 05.11.2024.
//

import Foundation
import RxSwift

// MARK: - Transforming Operators

func mapOperator() {
    print("Map Operator:")
    Observable.of(1, 2, 3)
        .map { $0 * 10 }
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

struct Player {
    var score: Observable<Int>
}

func flatMapOperator() {
    print("\nFlatMap Operator:")
    let player1 = Player(score: Observable.of(10, 20))
    let player2 = Player(score: Observable.of(15, 30))
    
    Observable.of(player1, player2)
        .flatMap(\.score)
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

// MARK: - Filtering Operators

func filterOperator() {
    print("\nFilter Operator:")
    Observable.of(1, 2, 3, 4, 5)
        .filter { $0 % 2 == 0 }
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

func distinctOperator() {
    print("\nDisctinctUntilChanged Operator:")
    Observable.of(1, 1, 1, 2, 2, 3, 3, 3, 4, 5, 5)
        .distinctUntilChanged()
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

// MARK: - Combining Operators

func mergeOperator() {
    let obs1 = Observable.of(1, 2, 3)
    let obs2 = Observable.of(4, 5, 6)
    
    print("\nMerge Operator:")
    Observable.of(obs1, obs2)
        .merge()
        // ...
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

func zipOperator() {
    let obs1 = Observable.of(1, 2, 3)
    let obs2 = Observable.of("A", "B", "C")

    print("\nZip Operator:")
    Observable.zip(obs2, obs1) { string, int in
        return "\(string) and \(int)"
    }
    .subscribe(onNext: { print($0) })
    .disposed(by: DisposeBag())

}

// MARK: - Custom Operators

extension ObservableType {
    func mapTo<T>(_ value: T) -> Observable<T> {
        return map { _ in value }
    }
}

func mapToOperator() {
    print("\nMapTo Operator:")
    Observable.of(1, 2, 3)
        .mapTo("constant")
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

extension ObservableType where Element == Int {
    func filterGreaterThan(_ threshold: Int) -> Observable<Int> {
        return filter { $0 > threshold }
    }
}

func filterGreaterThanOperator() {
    print("\nFilterGreaterThan Operator:")
    Observable.of(1, 2, 3, 4, 5)
        .filterGreaterThan(3)
        .subscribe(onNext: { print($0) })
        .disposed(by: DisposeBag())
}

// MARK: - Debugging

func debugExample() {
    print("\nDebug Example:")
    Observable.of(1, 2, 3)
        .debug("MyStatus")
        .subscribe()
        .disposed(by: DisposeBag())
}

// MARK: - Examples

// Map
mapOperator()

// FlatMap
flatMapOperator()

// Filter
filterOperator()

// DistinctUntilChanged
distinctOperator()

// Merge
mergeOperator()

// ZipOperator
zipOperator()

// MapToOperator
mapToOperator()

// FilterGreaterThanOperator
filterGreaterThanOperator()

// DebugExample
debugExample()
print()
