import UIKit

class ViewController: UIViewController {
    
    var users = [User]() {
        didSet{
            userTableView.reloadData()
        }
    }
    
    
    
    lazy var userTableView: UITableView = {
        let theTableView = UITableView()
        theTableView.dataSource = self
        let nib = UINib(nibName: "userTableViewCell", bundle: nil)
        theTableView.register(nib, forCellReuseIdentifier: "userTableViewCell")
        //cells - we've created a cell variable that dequeues a cell IB item that we created in storyboard
        //
        return theTableView
    }()
    
    
    func loadUsers(){
        UsersFetchingService.manager.getUsers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.users = data
                }
            }
        }
    }

    override func viewDidLoad() {
        self.view.addSubview(userTableView)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
