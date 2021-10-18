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
        commonInit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: nil, action: nil)
    }
    
    private func commonInit() {
        distanceLabel.text = model?.distance
        timeAgoLabel.text = model?.timeAgo
        activityDurationLabel.text = model?.duration
        startEndTimeLabel.text = model?.distance
        activityTitleLabel.text = model?.activityTitle
        secondTimeAgoLabel.text = model?.timeAgo
        iconActivity.image = model?.icon
        
        self.title = model?.activityTitle
    }
}
