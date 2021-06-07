//
//  AchievementsViewController.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import UIKit

class AchievementsViewController: UIViewController, AnyView {
    
    @IBOutlet weak var tableView: UITableView!
        
    var presenter: AnyPresenter?
    var achievements: [Achievement] = []
    
    // Presenter will communicate success state to the view through this method.
    func updateAchievements(with title: String, achievements: [Achievement]) {
        self.achievements = achievements
        DispatchQueue.main.async {
            self.setupNavigationBar(with: title)
            self.tableView.reloadData()
        }
    }

    // Presenter will communicate failure state to the view through this method.
    func updateAchievements(with error: FetchError) {
        print(error)
        var errorText = ""
        switch error {
        case .failed:
            errorText = "Error in fetching data!"
        case .noData:
            errorText = "No Data found!"
        case .parsingError:
            errorText = "Error in parsing data!"
        }
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Please Try again later!!", message: errorText, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupNavigationBar(with title:String) {
        self.title = title
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.412794888, green: 0.2138850689, blue: 0.8086236119, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "AchivementCell", bundle: .main), forCellReuseIdentifier: "cell")
    }
}

extension AchievementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AchivementCell
        cell?.updateCell(achievement: achievements[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
}

