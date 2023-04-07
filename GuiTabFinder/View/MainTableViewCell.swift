//
//  MainTableViewCell.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 7/4/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 10
        cellView.layer.borderColor = UIColor.green.cgColor
        cellView.layer.borderWidth = 1
    }
    
    func setup(song: String, artist: String, rating: String, votes: String) {
        songLabel.text = song
        artistLabel.text = artist
        ratingLabel.text = rating
        votesLabel.text = votes
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
