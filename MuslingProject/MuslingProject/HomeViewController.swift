//
//  HomeViewController.swift
//  MuslingProject
//
//  Created by 이나경 on 2023/04/17.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel! // 날짜
    @IBOutlet var noneLabel: UILabel! // 작성되어 있지 않을 때 띄울 문구
    @IBOutlet var homeTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar 배경, 타이틀, item 색상 변경
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = UIColor.primary
        self.navigationController?.navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        // navigation bar 그림자 효과
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.primary?.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        dateFormat()
        noDiary()
    }
    
    func dateFormat() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd (E)"
        let current_date_string = formatter.string(from: Date())
        dateLabel.text = "TODAY \(current_date_string)"
        dateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        dateLabel.textColor = UIColor.darkGray
    }
    
    func noDiary() {
        noneLabel.text = "아직 오늘이 기록이 없어요\n일기를 작성해 주세요!"
    }

}
