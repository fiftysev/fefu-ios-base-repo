import UIKit

struct ActivityTableViewCellViewModel {
    let distance: Double
    let duration: Double
    let activityType: String
    let startDate: Date
    let icon: UIImage
    let startTime: String
    let endTime: String
}

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var designContentView: UIView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
        designContentView.layer.cornerRadius = 10
        designContentView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(_ model: ActivityTableViewCellViewModel) {
        let distanceStr = String(format: "%.2f км", model.distance / 1000)
        distanceLabel.text = distanceStr
    
        let durationFormatter = DateComponentsFormatter()
        durationFormatter.allowedUnits = [.hour, .minute, .second]
        durationFormatter.zeroFormattingBehavior = .pad
        durationLabel.text = durationFormatter.string(from: model.duration)
        
        activityTitleLabel.text = model.activityType
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        dateLabel.text = dateFormatter.string(from: model.startDate)
        iconView.image = model.icon
    }

    
}
