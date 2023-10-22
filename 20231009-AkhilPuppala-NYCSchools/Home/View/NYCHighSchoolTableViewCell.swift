//
//  NYCHighSchoolTableViewCell.swift
//  20231009-AkhilPuppala-NYCSchools
//
//  Created by Akhil  on 09/10/23.
//

import UIKit

class NYCHighSchoolTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nycSchoolNameLbl: UILabel!
    @IBOutlet weak var nycSchoolDescriptionLbl: UILabel!
    @IBOutlet weak var nycLocationLbl: UILabel!
    @IBOutlet weak var nycPhoneNumberLbl: UILabel!
    
    @IBOutlet weak var schoolImageView: UIImageView! {
        didSet {
            self.schoolImageView.layer.cornerRadius = self.schoolImageView.frame.size.width / 2
            self.schoolImageView.clipsToBounds = true
            self.schoolImageView.image = UIImage(named: arrayOfImages.randomElement() ?? "SchoolImage1")
        }
    }
    
    var arrayOfImages = ["SchoolImage1","SchoolImage2", "SchoolImage3", "SchoolImage4", "SchoolImage5", "SchoolImage6", "SchoolImage7", "SchoolImage8", "SchoolImage9"]
    
    static var identifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var cellViewModel: NYCHighSchoolCellViewModel? {
        didSet {
            nycSchoolNameLbl.text = cellViewModel?.schoolName
            nycSchoolDescriptionLbl.text = cellViewModel?.overViewParagraph
            nycLocationLbl.text = cellViewModel?.location
            nycPhoneNumberLbl.text = cellViewModel?.phoneNumber
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    func initView() {
        // Cell view customization
        backgroundColor = .clear
        
        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nycSchoolNameLbl.text = nil
        nycSchoolDescriptionLbl.text = nil
        nycLocationLbl.text = nil
        nycPhoneNumberLbl.text = nil
    }
}
