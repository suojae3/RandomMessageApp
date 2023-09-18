
import UIKit
import SwiftUI
import SnapKit
import Starscream


//MARK: - Properties
class MainViewController: UIViewController {
    
    private lazy var floatingButtonVC: FloatingButtonViewController = {
        let controller = FloatingButtonViewController()
        addChild(controller)
        return controller
    }()

}



//MARK: - View Cycle

extension MainViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        
    }
}


//MARK: - Setup UI

extension MainViewController {
    
    func setupUI() {
        view.addSubview(floatingButtonVC.view)
        floatingButtonVC.didMove(toParent: self)

        setupConstraints()
        
    }
    
}
//MARK: - Constraints
extension MainViewController {
    func setupConstraints() {
        let floatingButtonView = floatingButtonVC.view!
        
        floatingButtonView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-40)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }

    }
}

//MARK: - Preview
struct VCPreView2:PreviewProvider {
    static var previews: some View {
        MainViewController().toPreview().edgesIgnoringSafeArea(.all)
    }
}





