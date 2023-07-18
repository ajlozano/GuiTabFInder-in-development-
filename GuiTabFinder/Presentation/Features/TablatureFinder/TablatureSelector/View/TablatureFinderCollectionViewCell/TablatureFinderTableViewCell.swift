//
//  MainTableViewCell.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 7/4/23.
//

import UIKit

// MARK: TablatureFinderTableViewCell

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
    
    private (set) var ratingView: UIView = {
        var view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private (set) var votesView: UIView = {
        var view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

// MARK: TablatureFinderTableViewCell - Public methods

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
        
        setupArtistLabelConstraints()
    }
    
    private func setupRatingLabels() {
        ratingView.addSubview(ratingLabel)
        ratingView.addSubview(ratingValueLabel)
        shadowView.addSubview(ratingView)
        
        ratingView.backgroundColor = .clear
        
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        ratingLabel.font = Fonts.ratingAndVotesLabels
        ratingLabel.text = Constants.ratingLabel

        ratingValueLabel.textAlignment = .center
        ratingValueLabel.textColor = .black
        ratingValueLabel.font = Fonts.ratingAndVotesValues
        ratingValueLabel.text = rating
        
        setupRatingConstraints()
    }
    
    private func setupVotesLabels() {
        votesView.addSubview(votesLabel)
        votesView.addSubview(votesValueLabel)
        shadowView.addSubview(votesView)
        
        votesView.backgroundColor = .clear
        
        votesLabel.textAlignment = .center
        votesLabel.textColor = .black
        votesLabel.font = Fonts.ratingAndVotesLabels
        votesLabel.text = Constants.votesLabel

        votesValueLabel.textAlignment = .center
        votesValueLabel.textColor = .black
        votesValueLabel.font = Fonts.ratingAndVotesValues
        votesValueLabel.text = votes
        
        setupVotesConstraints()
    }
}
