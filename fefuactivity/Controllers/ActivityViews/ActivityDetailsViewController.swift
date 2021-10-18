import UIKit

class ActivityDetailsViewController: UIViewController {
    
    var model: ActivityTableViewCellViewModel? = nil
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var activityDurationLabel: UILabel!
    @IBOutlet weak var startEndTimeLabel: UILabel!
    @IBOutlet weak var activityTitleLabel: UILabel!
    
    // тут однозначно нужен фикс, странный UI
    @IBOutlet weak var secondTimeAgoLabel: UILabel!
    @IBOutlet weak var iconActivity: UIImageView!
    @IBOutlet weak var commentField: SignFEFUTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitle("Старт", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
    }
    
    private func setData() {
        distanceLabel.text = model?.distance
        timeAgoLabel.text = model?.timeAgo
        activityDurationLabel.text = model?.duration
        startEndTimeLabel.text = model?.distance
        activityTitleLabel.text = model?.activityTitle
        secondTimeAgoLabel.text = model?.timeAgo
        iconActivity.image = model?.icon
    }
}
