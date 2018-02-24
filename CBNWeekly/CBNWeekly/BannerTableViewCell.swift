//
//  BannerTableViewCell.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/9/29.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import SwiftyJSON


class BannerTableViewCell: UITableViewCell {
    
    var banner: BannerCollectionView!;
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        print("init banner");
        let viewLayout = UICollectionViewFlowLayout();
        viewLayout.itemSize = CGSize(width: 240,height: 117);
        viewLayout.scrollDirection = UICollectionViewScrollDirection.horizontal;
        viewLayout.sectionInset.left = -176;
        viewLayout.minimumLineSpacing = 4;
        self.banner = BannerCollectionView(frame: CGRect(x: 0,y: 0,width: 0,height: 0),collectionViewLayout: viewLayout);
//        self.contentView.isUserInteractionEnabled = true;
        self.contentView.backgroundColor = UIColor.white;
        self.contentView.addSubview(banner);
//        banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
        banner.snp.makeConstraints { (make) in
//            make.leading.trailing.equalTo(self.contentView)
            make.height.equalTo(117);
            make.edges.equalTo(self.contentView);
//            banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
        }
    }
    
    override func didAddSubview(_ subview: UIView) {
//        self.banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
