import UIKit

struct ActivityTableViewCellViewModel {
    let date: String
    let distance: String
    let duration: String
    let activityTitle: String
    let timeAgo: String
    let icon: UIImage
    let startTime: String
    let endTime: String
}

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bind(_ model: ActivityTableViewCellViewModel) {
        distanceLabel.text = model.distance
        durationLabel.text = model.duration
        activityTitleLabel.text = model.activityTitle
        timeAgoLabel.text = model.timeAgo
        iconView.image = model.icon
    }

    
}