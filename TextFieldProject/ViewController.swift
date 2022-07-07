//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 유현이 on 2022/07/07.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        textField.becomeFirstResponder()
    }
    
    // 화면의 탭을 감지하는 역할
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 텍스트필드의 입력을 시작할떼 호출(시작할지 말지 여부 허락)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("텍스트 입력을 시작")
    }
    
    // 텍스트필드 글자 내용이 (한글자,한글자) 입력되거나 지워질때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // print(string)
        // print(#function)
        
        // 10글자까지만 입력되게 하기
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

        return newString.length <= maxLength
    }
    
    // 클리어버튼 누름과 동시에 실행
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }

    // 텍스트필드의 엔터키가 눌러지면 다음동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "텍스트를 입력하세요!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날때 호출(끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 실제로 끝날때 호출(시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("텍스트 입력을 종료")
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
}
