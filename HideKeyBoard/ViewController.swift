//
//  ViewController.swift
//  HideKeyBoard
//
//  Created by Charles Konkol on 2/9/15.
//  Copyright (c) 2016 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var txtContacts: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
// 1) Add MessageBox function using AlertView
    func MsgBox(message:String)
    {
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //Create Alert
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
        
    }
// 2) Add touchesBegan function to catch screen tap and resign keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //forces resign first responder and hides keyboard
       txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)

        
    }
    
// 3) Add DismissKeyboard function to resign keyboard on all textboxes
    func DismissKeyboard(){
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //forces resign first responder and hides keyboard
      txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
       
    }
    
//  4) Add textFieldShouldReturn function. This is called when 'return' key pressed on any UITextField. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField!) -> Bool     {
         //Add Below Code from "Code for Steps.txt". Read Comments
        textField.resignFirstResponder()
        return true;
    }
    
//  5) Add textFieldDidBeginEditing function. ScrollPoint when entering UItextfied
    func textFieldDidBeginEditing(textField:UITextField){
         //Add Below Code from "Code for Steps.txt". Read Comments
        var scrollPoint:CGPoint
        scrollPoint = CGPointMake(0, textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
       
    }
    
// 6) Add textFieldDidEndEditing function. ScrollPoint when done editing UItextfied
    func textFieldDidEndEditing(textField:UITextField){
         //Add Below Code from "Code for Steps.txt". Read Comments
        ScrollView.setContentOffset(CGPointZero, animated: true)
    }
    
// 7) Add textViewDidBeginEditing function. ScrollPoint when entering UItextView
    func textViewDidBeginEditing(textField:UITextView){
         //Add Below Code from "Code for Steps.txt". Read Comments
        var scrollPoint:CGPoint
        scrollPoint = CGPointMake(0, textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
// 8) Add textViewDidEndEditing function. ScrollPoint when done ending UItextView
    func textViewDidEndEditing(textField:UITextView){
         //Add Below Code from "Code for Steps.txt". Read Comments
        ScrollView.setContentOffset(CGPointZero, animated: true)
    }
    
    
// 9) Modify existing viewDidLoad function. Default Function to load when view is shown
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Add Below Code. Read Comments
        
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
       ScrollView.addGestureRecognizer(tap)
        //gets ScreenSize of current device
        let size: CGRect = UIScreen.mainScreen().bounds
        //Go to left  = 0 pixels, top = 50 pixels, width or device in pixels, height of device in pixels
       ScrollView.frame = CGRectMake(0, 50, size.width, size.height)
        //Set focus on txtFirst
      txtFirst.becomeFirstResponder()
        
    }
    
// 10) Default didReceiveMemoryWarning Function to dispose of memory automatically.Leave this function alone
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }

// 11) Modify btnBack function. Goes back to original ScrollView position
    @IBAction func btnBack(sender: UIButton) {
         //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
        
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        ScrollView.setContentOffset(CGPointZero, animated: true)
        
        //set txtFirst as firstresponder
       txtFirst.becomeFirstResponder()

       
    }
    
// 12) Modify btnView functions. Goes to position in ScrollView where the btnBack button is
    @IBAction func btnView(sender: UIButton) {
        //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
        
        //hide keyboard
        DismissKeyboard()
        
        //declare CGPoint scrollPoint
        var scrollPoint:CGPoint
        
        //X = from Left, Y = from Top
        //get X = 0, Y = location of btnBack Y
        scrollPoint = CGPointMake(0, btnBack.frame.origin.y)
        
        //Set ScrollPoint and Go to animated
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
//  13) Modify btnSave function. Validates UITextfields have content, formats text to place in UITextView txtContacts, Goes to location of btnBack button.
    @IBAction func btnSave(sender: UIButton) {
        //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
       
        //hide keyboard
       DismissKeyboard()
        
        //validation that all fields are entered
        if(txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="")
        {
            MsgBox("All fields required, please correct")
        }
        else
        {
            if(txtContacts.text=="")
            {
            txtContacts.text = "MyContacts \n"
            }
            txtContacts.text = "\(txtContacts.text!)\n\(txtFirst.text!) \n\(txtLast.text!)\n\ (txtEmail.text!)\n"
            txtFirst.text = ""
            txtLast.text = ""
            txtEmail.text = ""
            var scrollPoint:CGPoint
            
            ScrollView.setContentOffset(scrollPoint,animated:true)
        }
        
    
        

    
}

}