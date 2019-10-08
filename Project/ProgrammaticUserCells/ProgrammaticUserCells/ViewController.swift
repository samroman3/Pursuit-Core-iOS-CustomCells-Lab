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
        theTableView.delegate = self
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        theTableView.register(nib, forCellReuseIdentifier: "userTVC")
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
    
    
     func setConstraints() {
            self.userTableView.translatesAutoresizingMaskIntoConstraints = false
            self.userTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.userTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            self.userTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.userTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }
    

    override func viewDidLoad() {
        self.view.addSubview(userTableView)
        setConstraints()
        loadUsers()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        guard let cell = self.userTableView.dequeueReusableCell(withIdentifier: "userTVC", for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        cell.nameLabel.text = "\(user.name.title) \(user.name.first) \(user.name.last) "
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        let detailVC = UserDetailViewController()
        detailVC.user = selectedUser
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        }
    
    
    }
  

