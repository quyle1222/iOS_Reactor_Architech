//
//  AuthResponsitory.swift
//  Chat
//
//  Created by Tú Phạm on 09/02/2023.
//

import Foundation
import RxCocoa
import RxSwift

final class AuthRepository {
    let netword = AFNetwork()
    func requestLogin(data:AuthInput)-> Observable<AuthOutput> {
        return Observable.create { observer in
            let result = Disposables.create()
            guard let paramester = try? data.asDictionary() else {return result}
            self.netword.postAPI(url: .LOGIN,paramester: paramester).responseDecodable(of: AuthOutput.self) { response in
                if let error = response.error {
                    observer.onError(error)
                } else if let output = response.value {
                    observer.onNext(output)
                }
                observer.onCompleted()
            }
            return result
        }
    }
}
