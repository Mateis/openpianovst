import Cocoa
import AVFoundation

class ViewController: NSViewController {
    var audioPlayers = [String: AVAudioPlayer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAudioSamples()
    }

    func loadAudioSamples() {
        let notes = ["C", "D", "E", "F", "G", "A", "B"] // Extend this list based on your samples
        for note in notes {
            if let url = Bundle.main.url(forResource: note, withExtension: "wav") {
                do {
                    audioPlayers[note] = try AVAudioPlayer(contentsOf: url)
                } catch {
                    print("Error loading \(note) sample: \(error)")
                }
            }
        }
    }

    @IBAction func keyClicked(_ sender: NSButton) {
        if let player = audioPlayers[sender.title] {
            player.play()
        }
    }
}
