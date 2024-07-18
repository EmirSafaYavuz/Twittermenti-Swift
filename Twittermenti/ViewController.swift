//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let sentimentClassifier = TweetSentimentClassifier()
    
    let tweets = [
        "@Apple why am I getting charged by you for $15.00 dollars ? I did not give anyone at Apple permission to keep charging my cash app account so stop it.",
        "Don't forget to add the ending credits to this Apple event and other events!",
        "So another iPhone can get released with issues that are so bad it’s not even worth the amount you put it for sale. Especially with hackers",
        "But of course, @Apple already took my money so fuck me, right?",
        "@Apple iOS 17 is amazing.. Thank you!! #ios17",
        "Reporting above fraud activities performed with @Apple customers. please help to trace and block +18338710473 used to do fraud.",
        "Love this ❤️",
        "Not gonna happen!! It’s not about you, cuz @Apple never gave a sh** about users. That speach is just a marketing LIE! The iOS home screen is the widely most well known recognizable screen in the planet. NEVER Apple is dropping that world wide marketing just for mortal users",
        "Why has it been named as 🍎 Apple?",
        "@apple needs to get the hell out of ccp China. It would be one of the best moves ever.",
        "@Apple apparently someone at Apple took $18.22 dollars from my Cash App Card when there was no money on it, so now my Cash App Account is overdrawn by $18.22 dollars, now my Cash App Account says I have -18.22 dollars.",
        "@Apple when we getting iPhone previews 👀",
        "@apple this is a serious issue and needs to be addressed. iPhone users are facing white/green screen issues after updating. If the phone is out of warranty, why do we have to pay 30-35K when there's no fault of ours?",
        "@Apple hey can you guys make it a feature that you can see when a note was created in notes. I had an idea I revisited after a long while that was actually genius. I wanted to know since when did I know that about that greatness",
        "Beautiful picture.",
        "Can I get a discount on the new iPhone @Apple",
        "@Apple Whats with a $1000 phone (14 Pro) brand naw freezing up and not responsive? And it just gets some weird freeze bug name and NO FIX? Heres an idea for a fix: a new phone… on you",
        "I miss the circular home button and the headphone Jack. Also an easily replaceable battery 🪫 like some cheap android phones would make the iPhone experience even better",
        "What is Mac?",
        "@Apple your support is fucking garbage. Someone said they would call me back and they never fucking did. Your gift cards are also garbage. Paid for it and said the code was not valid. What the actual fuck?",
        "That’ll be my hands",
        "#stop",
        "I asked China Government if they can ban @iphone @apple so I can capture Whole market for selling my Tesla Pi Phone",
        ".@Apple stop breaking my texting experience. #GetTheMessage As someone who uses a 13 pro and a s22+ and a a54 please add ot",
        "Need a portion that morphs into this jolly guy",
        "Apple Stellar wallet #Stellar #XLM",
        "i wanna buy a new iPaid which os the best? ans in comment 🤨",
        "Even cutlery is made of titanium nothing new here @Apple late cashing in on others work!",
        "what will that do for the token",
        "Do you ever do anything that actually helps people?",
        "Just Wow ! Apple Chat support is real quick ! Thankyou, @Apple",
        "TY",
        "Stop",
        "Apple is overpriced for what it does",
        "Y’all high ash send me the new one on y’all",
        "@Apple quick question. What was the point in making the messages editable if you can still see the original message",
        "@Apple 16 inch bezeless iPad with dynamic island pls I’ll pay $5k for it idc",
        "@Apple #iphone what is the white shape above the wifi symbol? I move to click on something it disappears and comes back when I take my finger off.",
        "Thanks! 🍏",
        "cuz that’s how jesus works!",
        "Add 60fps screen record for iPad 8 and 9",
        "why’d i fuckint click on that and it took me to my page am i jesus",
        "“Clear evidence” that cell phone radiation causes cancer according to NIH $30 million dollar study",
        "Recent apple update shows that they seem to cause INACCURATE PERCENTAGES despite the phone or laptops being on the chargers all day",
        "Homie I was researching this before google came out with the Pixel lol. The amount of radiation that electronics emit is negligible, and hasn’t proven to be harmful",
        "Bigger picture (even bigger than iPhone Pro Max’s screen):",
        "U.S. shouldn’t ALLOW@Apple —via @Flextronics —to be #CCPChina’s largest employer. Those jobs should be HERE.",
        "The 25% tariff on all non-USMCA imports I’ve called for would go a long way in helping @tim_cook see the light.",
        "Hostile government sponsored hackers have penetrated communications networks to access everyone’s phones they desire in the world.",
        "There is no privacy, no sanctity, no peace",
        "They are going to show a box within a box I can’t wait for it announcement the same day as @Apple event. many people speculating theres a connection",
        "@Apple known for highly secure devices.",
        "China's arbitrary ban displays highly unpredictable business environment.",
        "Lack of independent judiciary to safeguard rights means that Communist state is always an alien land for overseas industries.",
        "@Apple has issued an emergency warning to update to iOS 16.6.1 or iPadOS 16.6.1 right away. -"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func predictPressed(_ sender: Any) {
        guard let tweetText = textField.text else { return }
            
        do {
            let prediction = try sentimentClassifier.prediction(text: tweetText)
            updateSentimentLabel(predictionLabel: prediction.label)
        } catch {
            print("Error making prediction: \(error.localizedDescription)")
        }
    }
    
    func updateSentimentLabel(predictionLabel: String) {
        switch predictionLabel {
            case "Pos":
                sentimentLabel.text = "😊"
            case "Neg":
                sentimentLabel.text = "😞"
            case "Neu":
                sentimentLabel.text = "😐"
            default:
                sentimentLabel.text = "🤔"
        }
    }
    
}

