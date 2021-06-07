//
//  AchivementsListViewCell.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import UIKit

class AchivementCell: UITableViewCell {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setupView() {
        
        self.containerView.layer.cornerRadius = 8.0
        self.containerView.layer.masksToBounds = true
        self.containerView.backgroundColor = .red
        
        self.levelLabel.layer.cornerRadius = levelLabel.frame.width/2
        levelLabel.layer.masksToBounds = true
        self.levelLabel.backgroundColor = .white
        self.levelLabel.text = "Level \n 1"
    }
    
    internal func updateCell(level: String, progress: Int, total: Int, bgImgUrl: String) {
        levelLabel.text = "Level \n \(level)"
        progressView.setProgress(Float(progress), animated: true)
        
        if let url = URL(string: bgImgUrl) {
            bgImageView.load(url: url)
        }
    }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
