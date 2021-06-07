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
    
    func updateAchievements(with achievements: [Achievement], title: String) {
        
    }
    
    func updateAchievements(with error: String) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupNavigationBar(with: "Smart Investing")
    }
    
    private func setupNavigationBar(with title:String) {
        self.title = title
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.412794888, green: 0.2138850689, blue: 0.8086236119, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
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
        return 5 //presenter?.getAchivementsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AchivementCell
        return cell ?? UITableViewCell()
    }
}

