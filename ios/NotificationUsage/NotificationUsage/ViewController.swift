//
//  ViewController.swift
//  NotificationUsage
//
//  Created by cemal tüysüz on 1.01.2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
       
        // Bildirim için izin kontrolü
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]){ (granted,error) in
            self.izinKontrol = granted
            
            if granted {
                print("İzin alma başarılı.")
            }else {
                print("İzin alma başarısız.")
            }
        }
    }
    @IBAction func bildirimOlusturButton(_ sender: Any) {
        if izinKontrol {
            
            let icerik = UNMutableNotificationContent()
            icerik.title = "Bildirim başlığı"
            icerik.subtitle = "Bildirim alt başlığı"
            icerik.body = "Bildirim Mesajı"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
            
            let istek = UNNotificationRequest(identifier: "bildirim", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(istek, withCompletionHandler: nil)
        }
    }
}

extension ViewController :UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        
        if app.applicationState == .active {
            print("Ön planda iken bildirime tıklanıldı.")
        }
        
        if app.applicationState == .inactive {
            print("Arka planda iken bildirim tıklanıldı.")
        }
        
        app.applicationIconBadgeNumber = 0
        completionHandler()
    }
}

