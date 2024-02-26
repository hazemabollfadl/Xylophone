import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        //gets the title of the specified button
        var soundName = sender.currentTitle ?? "Nothing"
        changeOpacityWithDelay(button: sender)
        playSound(sound: soundName)
    }
    
    func playSound(sound soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        //main: The system automatically creates the main queue and associates it with your application’s main thread.
        //DipatchQueue: An object that manages the execution of tasks serially or concurrently on your app's main thread or on a background thread.
        //asyncAfter(deadline: ...): Schedules a block for execution using the specified attributes, and returns immediately.
        //dedline: it's the specifies attribute, The time at which to schedule the block for execution.
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    func changeOpacityWithDelay(button senderName:UIButton){
        //Change Opacity of the pressed button
        senderName.alpha=0.85
        //Run delay function
        delayWithSeconds(0.2){
            //Change opacity back to original
            senderName.alpha=1
        }
    }
}
