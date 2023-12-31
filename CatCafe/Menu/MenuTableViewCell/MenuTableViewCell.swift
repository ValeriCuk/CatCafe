import UIKit
import SnapKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
        addDescriptionLabelFrame()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func addDescriptionLabelFrame() {
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupConstraints() {
        
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo( contentView.snp.top).offset(5)
            make.left.equalTo(itemImage.snp.right).offset(5)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-5)
            make.height.equalTo(25)
        }
        
        itemImage.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(descriptionLabel.snp.left).offset(-10)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        descriptionLabel.snp.makeConstraints{ make in
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.height.equalTo(60)
        }
        
        priceLabel.snp.makeConstraints{ make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.height.equalTo(20)
        }
    }
}
