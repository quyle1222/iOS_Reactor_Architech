import ReactorKit
import RxCocoa
import SnapKit
import UIKit
import RxSwift
import Then

class HomeViewController: BaseViewController,View {
    var disposeBag: RxSwift.DisposeBag = DisposeBag()
    typealias Reactor = HomeViewReactor
    let lblWellcome = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .black
        $0.text = "Hello,World!"
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    let lblUsername = UILabel().then {
        $0.text = "Username:"
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    let textFieldUsername = UITextField().then {
        $0.placeholder = "Enter username or email"
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true;
        $0.layer.borderColor = UIColor.red.cgColor;
        $0.layer.borderWidth = 1.0;
    }
    
    let lblPassword = UILabel().then {
        $0.text = "Password:"
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    let textFieldPassword = UITextField().then {
        $0.placeholder = "Enter password"
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true;
        $0.layer.borderColor = UIColor.red.cgColor;
        $0.layer.borderWidth = 1.0;
    }
    
    let lblShowHiddenPassword = UIButton().then {
        $0.setTitle("Show password", for: .normal)
        $0.titleLabel?.textAlignment = .left
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let btnLogin = UIButton().then {
        $0.setTitle("Login", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = .green
    }
    
    init(reactor:HomeViewReactor) {
        super.init()
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupUI()
        makeConstrains()
    }
    
    func bind(reactor: HomeViewReactor) {
        let userInputs = Observable.combineLatest(textFieldUsername.rx.text.orEmpty,textFieldPassword.rx.text.orEmpty) {(email, password) -> AuthInput in
            return AuthInput(username:email, password:password)
        }
        
        //Action
        btnLogin.rx.tap
            .withLatestFrom(userInputs)
            .map { model in  Reactor.Action.didTapLogin(model) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        lblShowHiddenPassword.rx.tap
            .map { Reactor.Action.didTapShowHidden }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //State
        reactor.state.asObservable()
            .map {$0.isLoading}
            .distinctUntilChanged()
            .subscribe { state in
                print("IsLoading :\(state)")
            }.disposed(by: disposeBag)
        
        reactor.state.asObservable()
            .map {$0.isShowPassword}
            .distinctUntilChanged()
            .subscribe { state in
                DispatchQueue.main.async {
                    self.lblShowHiddenPassword.setTitle(state ? "Hidden password" : "Show password", for: .normal)
                    self.textFieldPassword.isSecureTextEntry = !state
                }
            }.disposed(by: disposeBag)
    }
}

extension HomeViewController {
    
    func addSubView(){
        view.addSubview(lblWellcome)
        view.addSubview(lblUsername)
        view.addSubview(textFieldUsername)
        view.addSubview(lblPassword)
        view.addSubview(textFieldPassword)
        view.addSubview(lblShowHiddenPassword)
        view.addSubview(btnLogin)
    }
    
    func setupUI(){
        view.backgroundColor = UIColor.white
        textFieldUsername.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldUsername.frame.height))
        textFieldUsername.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldUsername.frame.height))
        textFieldUsername.leftViewMode = .always
        textFieldUsername.rightViewMode = .always
        textFieldPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldPassword.frame.height))
        textFieldPassword.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldPassword.frame.height))
        textFieldPassword.leftViewMode = .always
        textFieldPassword.rightViewMode = .always
    }
    
    func makeConstrains(){
        lblWellcome.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100).priority(.high)
            make.centerX.equalToSuperview()
        }
        
        lblUsername.snp.makeConstraints { make in
            make.top.equalTo(lblWellcome.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
        }
        
        textFieldUsername.snp.makeConstraints { make in
            make.top.equalTo(lblUsername.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        
        lblPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldUsername.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.top.equalTo(lblPassword.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        
        lblShowHiddenPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldPassword.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(15)
        }
        
        btnLogin.snp.makeConstraints { make in
            make.top.equalTo(lblShowHiddenPassword.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
    }
}
