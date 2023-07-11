//
//  MainTableViewCell.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 7/4/23.
//

import UIKit

class TablatureFinderTableViewCell: UITableViewCell {
    var song: String?
    var artist: String?
    var rating: String?
    var votes: String?
    
    private (set) var shadowView: UIView = {
        var view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private (set) var songLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var artistLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var ratingLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var ratingValueLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var votesLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var votesValueLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        self.songLabel.text = nil
        self.artistLabel.text = nil
        self.ratingValueLabel.text = nil
        self.votesValueLabel.text = nil
    }

}

// MARK: - Public methods

extension TablatureFinderTableViewCell {
    func configure(withSong: String, withArtist: String, withRating: String, withVotes: String) {
        self.song = withSong
        self.artist = withArtist
        self.rating = withRating
        self.votes = withVotes
        setupView()
    }
}

// MARK: - Setup View

extension TablatureFinderTableViewCell {
    func setupView() {
        self.backgroundColor = .clear
        
        setupShadowView()
        setupSongLabel()
        setupArtistLabel()
        setupRatingLabels()
        setupVotesLabels()
    }
    
    private func setupShadowView() {
        addSubview(shadowView)
        shadowView.backgroundColor = .white
        shadowView.layer.cornerRadius = Constants.shadowViewCornerRadius
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOffset = Constants.shadowViewOffset
        shadowView.layer.shadowRadius = Constants.shadowViewRadius
        shadowView.layer.shadowOpacity = Constants.shadowViewOpacity
        setupShadowViewConstraints()
    }
    
    private func setupSongLabel() {
        shadowView.addSubview(songLabel)
        songLabel.textAlignment = .left
        songLabel.textColor = .black
        songLabel.font = Fonts.song
        songLabel.text = song
        songLabel.accessibilityIdentifier = AccessibilityIdentifiers.song
        setupSongLabelConstraints()
    }
    
    private func setupArtistLabel() {
        shadowView.addSubview(artistLabel)
        artistLabel.textAlignment = .left
        artistLabel.textColor = .gray
        artistLabel.font = Fonts.artist
        artistLabel.text = artist
        artistLabel.accessibilityIdentifier = AccessibilityIdentifiers.artist
        
        //setupArtistLabelConstraints()
    }
    
    private func setupRatingLabels() {
        shadowView.addSubview(ratingLabel)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        ratingLabel.font = Fonts.ratingAndVotes
        ratingLabel.text = Constants.ratingLabel

        shadowView.addSubview(ratingValueLabel)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        ratingLabel.font = Fonts.ratingAndVotes
        ratingLabel.text = rating
        
        //setupRatingLabelsConstraints()
    }
    
    private func setupVotesLabels() {
        var view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        view.addSubview(ratingLabel)
        view.addSubview(ratingValueLabel)
        
        shadowView.addSubview(view)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        ratingLabel.font = Fonts.ratingAndVotes
        ratingLabel.text = Constants.votesLabel

        shadowView.addSubview(votesValueLabel)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        ratingLabel.font = Fonts.ratingAndVotes
        ratingLabel.text = votes
        
        setupVotesLabelsConstraints(on: view)
    }
}

// MARK: - Setup Constraints

extension TablatureFinderTableViewCell {
    func setupShadowViewConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
    
    func setupSongLabelConstraints() {
        NSLayoutConstraint.activate([
            songLabel.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 1),
            songLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10)
        ])
    }
    
    func setupArtistLabelConstraints(on view: UIView) {

    }
    
    func setupRatingLabelsConstraints(on view: UIView) {
        
    }
    
    func setupVotesLabelsConstraints(on view: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 1),
            view.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 1),
            view.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10),
            view.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}

// MARK: - Constants
 
extension TablatureFinderTableViewCell {
    enum Constants {
        static let shadowViewCornerRadius: CGFloat = 3
        static let shadowViewOffset = CGSize(width: 0, height: 1.75)
        static let shadowViewRadius: CGFloat = 1.7
        static let shadowViewOpacity: Float = 0.45
        
        static let ratingLabel: String = "Rating"
        static let votesLabel: String = "Votes"
    }
    
    enum Fonts {
        static let song = UIFont(name: "Helvetica-Bold", size: 12)
        static let artist = UIFont(name: "Helvetica-LightOblique", size: 12)
        static let ratingAndVotes = UIFont(name: "Helvetica-Light", size: 8)
    }
    
    enum AccessibilityIdentifiers {
        static let song = "TabFInderTableViewCellSongLabel"
        static let artist = "TabFInderTableViewCellArtistLabel"
        static let rating = "TabFInderTableViewCellRatingLabel"
        static let votes = "TabFInderTableViewCellVotesLabel"
    }
}
