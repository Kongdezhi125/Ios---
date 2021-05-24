//
//  ViewController.swift
//  timer
//
//  Created by student on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labals: UILabel!
    var count = 5
    private var timer:Timer!
    //CADisplayLink和屏幕刷新率同步的定时器
    var cadTimer:CADisplayLink?
    var gcdTimer:DispatchSourceTimer? = DispatchSource.makeTimerSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//
        //自动执行的timer
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
//            self.count -= 1
//            self.labals.text = "\(self.count)"
//        }
        
        //需要手动开启timer
        let timer = Timer(timeInterval: 1.0, repeats: true) { (Timer) in
            self.count -= 1
            self.labals.text = "\(self.count)"
            if self.count == 0{
                //定时器直接销毁，不能再次调用
                self.timer.invalidate()
                self.view.backgroundColor = .gray
            }
            
        }
        //RunLoop用来处理事件的循环，保持程序的持续运行，APP启动后会开启一个主线程，主线程启动时会运行一个对应的RunLoop，RunLoop保证主线程不会被销毁，从而保证了程序的持续运行。
        //default 默认模式
        //tracking 界面跟踪模式
        //common 通用模式，前面两种的结合
        RunLoop.current.add(timer, forMode: .default)
        
    }


    @IBAction func pauseAndResume(_ sender: UISwitch) {
        if sender.isOn {
            //重启
            timer.fireDate = Date.distantPast
        }
        else{
            //暂停
            timer.fireDate = Date.distantFuture
        }
    }
    
    @IBAction func btnTimer(_ sender: Any) {
        func cadTimers(){
            cadTimer = CADisplayLink(target: self, selector: #selector(cadTimerAction))
            //ios设备屏幕的刷新率60次每秒，CADDisplayLink默认每秒运行60次，但是通过它的preferredFramesPerSecond
            //每秒运行2次
            cadTimer?.preferredFramesPerSecond = 2
            cadTimer?.add(to: RunLoop.current, forMode: .default)
        }

    }
    @objc func cadTimerAction(){
        
    }
    
    @IBAction func gcd(_ sender: Any) {
        gcdTimer?.setEventHandler(handler: {
            DispatchQueue.main.async {
                self.count -= 1
                self.labals.text = "\(self.count)"
                
                if self.count == 0{
                    self.gcdTimer?.cancel()
                    self.gcdTimer = nil
                }
            }
        })
        //参数leeway，指的是一个期望的容忍时间，将它设置为一秒，意味着系统可能在定时器时间到达的前一秒后一秒才真正触发定时器
        gcdTimer?.schedule(deadline: .now(), repeating: 1, leeway: DispatchTimeInterval.seconds(0))
        gcdTimer?.resume()
    }
    
}

