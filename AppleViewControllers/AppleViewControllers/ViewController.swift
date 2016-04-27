//
//  ViewController.swift
//  AppleViewControllers
//
//  Created by James Pacheco on 4/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imageTapped(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "Please choose an image source", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (_) in
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (_) in
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let savedPhotosAction = UIAlertAction(title: "Saved Photos Album", style: .Default) { (_) in
            imagePicker.sourceType = .SavedPhotosAlbum
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        actionSheet.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            actionSheet.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(photoLibraryAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            actionSheet.addAction(savedPhotosAction)
        }
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func emailButtonTapped(sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["kauakim@gmail.com", "parkerdonat@gmail.com"])
        mailController.setSubject("This is us testing the mail view controller in class")
        mailController.setMessageBody("Hey! Check out this picture that I grabbed from the UIImagePickerController!", isHTML: false)
        if let image = imageView.image,
           imageData = UIImageJPEGRepresentation(image, 0.3) {
            mailController.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "Test image")
        }
        presentViewController(mailController, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        
        
    }
    
    @IBAction func browserButtonTapped(sender: AnyObject) {
        guard let url = NSURL(string: "https://www.google.com/imghp?gws_rd=ssl") else {return}
        let safariVC = SFSafariViewController(URL: url)
        presentViewController(safariVC, animated: true, completion: nil)
    }
    
    
    
}

