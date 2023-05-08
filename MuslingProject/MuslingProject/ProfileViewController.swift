//
//  ProfileViewController.swift
//  MuslingProject
//
//  Created by 이나경 on 2023/04/12.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var nameField: UITextField!
    
    @IBAction func nextBtn(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "SelectVC")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectImg = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        profileImg.isUserInteractionEnabled = true
        profileImg.addGestureRecognizer(selectImg)
        
        // 이미지 원형으로 만들기
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.layer.borderWidth = 1
        profileImg.clipsToBounds = true
        profileImg.layer.borderColor = UIColor.clear.cgColor

        nameField.layer.cornerRadius = 20
        nameField.backgroundColor = UIColor.white
        nameField.layer.shadowOpacity = 0.2
        nameField.layer.shadowRadius = 3
        nameField.layer.shadowOffset = CGSize(width: 0, height: 0)
        nameField.layer.shadowColor = UIColor.darkGray.cgColor
        nameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        nameField.leftViewMode = .always
    }
    
    @objc func selectImage(sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: "프로필 사진 설정", preferredStyle: .actionSheet)
        // 이미지 피커 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        alert.addAction(UIAlertAction(title: "앨범에서 선택", style: .default) {
            (_) in self.present(picker, animated: false)
        })
        alert.addAction(UIAlertAction(title: "카메라로 촬영", style: .default) {
            (_) in picker.sourceType = .camera
            self.present(picker, animated: true)
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    // 이미지 선택 완료했을 때 호출하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택한 이미지를 미리보기에 표시
        self.profileImg.image = info[.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러 닫기
        picker.dismiss(animated: false)
    }

}
