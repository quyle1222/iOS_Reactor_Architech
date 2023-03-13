import RxCocoa
import RxSwift

class NewsRepository {
    let netword = AFNetwork()
  
    func getListNews()-> Observable<[NewsModel]> {
        return Observable.create { observer in
            self.netword.getAPI(url: .LIST_NEWS).responseDecodable(of:NewsOutput.self) { response in
                print("response",response)
                if let error = response.error {
                    observer.onError(error)
                } else if let output = response.value?.data {
                    observer.onNext(output)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
