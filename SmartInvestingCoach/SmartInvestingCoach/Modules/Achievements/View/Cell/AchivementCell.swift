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
    @IBOutlet weak var minPoints: UILabel!
    @IBOutlet weak var maxPoints: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func setupView() {
        
        self.containerView.layer.cornerRadius = 8.0
        self.containerView.layer.masksToBounds = true
        
        self.levelLabel.layer.cornerRadius = levelLabel.frame.width/2
        levelLabel.layer.masksToBounds = true
        self.levelLabel.backgroundColor = .white
        
        progressView.progressTintColor = .green
        progressView.trackTintColor = .white
        progressView.layer.cornerRadius = 5.0
        progressView.layer.masksToBounds = true
    }
    
    internal func updateCell(achievement: Achievement) {
            
        guard let level = achievement.level,
              let bgImageUrl = achievement.bg_image_url,
              let progress = achievement.progress,
              let total = achievement.total,
              let accessible = achievement.accessible else {
            return
        }
        
        levelLabel.attributedText = self.getAttributedString(level: level)
        progressView.progress = Float((Double(progress)/Double(total)))
        minPoints.text = "\(progress)pts"
        maxPoints.text = "\(total)pts"
        if let url = URL(string: bgImageUrl) {
            bgImageView.load(url: url)
        }
        
        if !accessible {
            self.contentView.alpha = 0.5
        }
    
    }
    
    
    internal func getAttributedString(level: String) -> NSMutableAttributedString {
        let boldAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 50)]
        let regularAttribute = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)]
        let boldText = NSAttributedString(string: level, attributes: boldAttribute)
        let regularText = NSAttributedString(string: "Level\n", attributes: regularAttribute)
        let attributedString = NSMutableAttributedString()
        attributedString.append(regularText)
        attributedString.append(boldText)
        
        return attributedString
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
