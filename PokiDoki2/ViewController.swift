//
//  ViewController.swift
//  PokiDoki2
//
//  Created by hassen klai on 7/14/16.
//  Copyright © 2016 hassen klai. All rights reserved.
//
import UIKit
import AVFoundation
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ,UISearchBarDelegate{
    var musicIsOn = true
    var track : AVAudioPlayer!
    var pokes = [Poke]()
    var pokesFiltred = [Poke]()
    var inSearchMode = false
    
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var musicButton : UIButton!
    @IBOutlet weak var collectionCell : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pokeCellNib = UINib(nibName: "PokeCell", bundle: nil)
        collectionCell.registerNib(pokeCellNib, forCellWithReuseIdentifier: "PokeCell")
        collectionCell.delegate = self
        collectionCell.dataSource = self
        //playSound()
        musicButton.layer.cornerRadius = musicButton.frame.width/2
        musicButton.clipsToBounds = true
        parseCsv()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
    }
    func searchBarTapped(){
        view.endEditing(true)
    }
    func searchBr(){
        if(searchBar.text == "" || searchBar.text == nil ){
            view.endEditing(true)
            inSearchMode = false
            collectionCell.reloadData()
        }
        else{
            view.endEditing(false)
            inSearchMode = true
            let userInputText = searchBar.text!.lowercaseString
            pokesFiltred = pokes.filter({$0.name.rangeOfString(userInputText) != nil })
            collectionCell.reloadData()
        }
    }
    @IBAction func musicButtonTapped(sender:AnyObject!) {
        if musicIsOn {
            track.stop()
            musicIsOn = false
            musicButton.alpha = 0.5
        }
        else {
            track.play()
            musicIsOn = true
            musicButton.alpha = 1
            track.numberOfLoops = -1
        }
    }
    func parseCsv(){
        let filePath = NSBundle.mainBundle().pathForResource("PokeData", ofType: "csv")
        do{
            let csv = try CSV(contentsOfURL: filePath!)
            let rows = csv.rows
            for row in rows{
                let pokeName = String(row["identifier"]!)
                let pokeImg = Int(row["id"]!)
                let poki = Poke(name: pokeName, img: pokeImg!)
                pokes.append(poki)
            }
        }
        catch let err as NSError{
            print(err.description)
        }
    }
    func playSound() {
        let trackPath = NSBundle.mainBundle().pathForResource("PokemonSongFull", ofType: "mp3")
        do {
            track = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: trackPath!))
        }
        catch let err as NSError{
            print(err.description)
        }
        track.prepareToPlay()
        track.play()
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode{
            return pokesFiltred.count
        }
        else
        {
            return pokes.count
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "myPokeDetails" {
            if let myVc = segue.destinationViewController as? DetailsScreen{
                if let poke = sender as? Poke{
                    myVc.pokeNew = poke
                }
            }
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let mypoke : Poke!
        if inSearchMode{
            mypoke = pokesFiltred[indexPath.row]
        }
        else{
            mypoke = pokes[indexPath.row]
        }
        performSegueWithIdentifier("myPokeDetails", sender: mypoke)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if  let cell = collectionCell.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            let poki :Poke!
            if inSearchMode {
                poki = pokesFiltred[indexPath.row]
            }
            else {
                poki = pokes[indexPath.row]
            }
            cell.configCell(poki)
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
}