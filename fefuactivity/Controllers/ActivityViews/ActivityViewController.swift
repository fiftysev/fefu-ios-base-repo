
import UIKit

// try to test so beautiful
let data: [ActivityTableViewCellViewModel] =
[
    ActivityTableViewCellViewModel(
        date: "Вчера",
        distance: "14.32 км",
        duration: "2 часа 46 минут",
        activityTitle: "Велосипед",
        timeAgo: "14 часов назад",
        icon: UIImage(systemName: "bicycle.circle.fill") ?? UIImage(),
        startTime: "14:49",
        endTime: "16:31"
        ),
    ActivityTableViewCellViewModel(
        date: "Май 2022 года",
        distance: "14.32 км",
        duration: "2 часа 46 минут",
        activityTitle: "Велосипед",
        timeAgo: "14 часов назад",
        icon: UIImage(systemName: "bicycle.circle.fill") ?? UIImage(),
        startTime: "14:49",
        endTime: "16:31"
        )
]

class ActivityViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var emptyStateTitle: UILabel!
    @IBOutlet weak var emptyStateDescription: UILabel!
    @IBOutlet weak var emptyStateView: UIView!
    
    @IBOutlet weak var listOfActivities: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Активности"
        startButton.setTitle("Старт", for: .normal)
        
        emptyStateTitle.text = "Время потренить"
        emptyStateDescription.text = "Нажимай на кнопку ниже и начинаем трекать активность"
        
        listOfActivities.dataSource = self
        listOfActivities.delegate = self
        
        listOfActivities.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
    }
    
    @IBAction func didExitEmptyState(_ sender: Any) {
        emptyStateView.isHidden = true
    }
    
    
}

extension ActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = ActivityDetailsViewController(nibName: "ActivityDetailsViewController", bundle: nil)

        detailsView.model = data[indexPath.row]
        
        navigationController?.pushViewController(detailsView, animated: true)
    }
}

extension ActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let activityData = data[indexPath.row]
        
        let dequeuedCell = listOfActivities.dequeueReusableCell(withIdentifier: "ActivityTableViewCell", for: indexPath)
        
        guard let upcastedCell = dequeuedCell as? ActivityTableViewCell else {
            return UITableViewCell()
        }
        
        upcastedCell.bind(activityData)
        
        return upcastedCell
    }
    
    
}
