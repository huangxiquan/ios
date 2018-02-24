//
//  HomeTableViewCell.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/19.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    var headImg: UIImageView!;
    var authorName: UILabel!;
    var tagName: UILabel!;
    var time: UILabel!;
    var coverImage: UIImageView!;
    var title: UILabel!;
    var comment: UILabel!;
    var commenter: UILabel!;
    var likeImg: UIImageView!;
    var likeNumber: UILabel!;
    var commentImage: UIImageView!;
    var commentNumber: UILabel!;
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        let container = UIView();
        self.contentView.addSubview(container);
        container.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsets.init(top: 36, left: 18, bottom: 28, right: 18));
        }
        
        self.headImg = UIImageView();
        container.addSubview(self.headImg);
        self.headImg.snp.makeConstraints { (make) in
            make.width.height.equalTo(36);
            make.left.top.equalTo(container);
        }
        
        self.authorName = UILabel();
        self.authorName.font = UIFont.systemFont(ofSize: 14)
        self.authorName.text = "黄希权"
        container.addSubview(self.authorName);
        self.authorName.snp.makeConstraints { (make) in
            make.left.equalTo(self.headImg.snp.right).offset(9);
            make.top.equalTo(self.headImg);
        }
        
        self.tagName = UILabel();
        self.tagName.text = "#Pause"
        self.tagName.font = UIFont.systemFont(ofSize: 14)
        self.tagName.textColor = UIColor().hexStringToColor(hexString: "#24c875")
        container.addSubview(self.tagName);
        self.tagName.snp.makeConstraints { (make) in
            make.left.equalTo(self.authorName.snp.right);
            make.top.equalTo(self.authorName);
        }
        
        self.time = UILabel();
        self.time.text = "12小时前·7万次浏览";
        self.time.textColor = UIColor().hexStringToColor(hexString: "#9b9b9b")
        self.time.font = UIFont.systemFont(ofSize: 12);
        container.addSubview(self.time);
        self.time.snp.makeConstraints { (make) in
            make.top.equalTo(self.authorName.snp.bottom);
            make.left.equalTo(self.authorName)
        }
        
        self.coverImage = UIImageView();
        self.coverImage.backgroundColor = UIColor.darkGray;
        container.addSubview(self.coverImage);
        self.coverImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.time.snp.bottom).offset(28);
            make.left.equalTo(container)
            make.width.equalTo(339)
            make.height.equalTo(196)
        }
        
        self.title = UILabel();
        self.title.text = "土耳其的一夜政变";
        self.title.font = UIFont.boldSystemFont(ofSize: 26)
        self.title.numberOfLines = 0;
        container.addSubview(self.title);
        self.title.snp.makeConstraints { (make) in
            make.top.equalTo(self.coverImage.snp.bottom).offset(16);
            make.right.equalTo(container)
            make.left.equalTo(self.headImg);
            
        }
        
        self.likeImg = UIImageView();
        container.addSubview(self.likeImg)
        self.likeImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.title.snp.bottom).offset(8);
            make.left.equalTo(self.headImg);
            make.width.height.equalTo(30);
        }
        self.likeImg.image = UIImage.init(named: "likeNormal");
        
        self.likeNumber = UILabel();
        self.likeNumber.text = "123";
        self.likeNumber.font = UIFont.systemFont(ofSize: 12)
        self.likeNumber.textColor = UIColor().hexStringToColor(hexString: "#9b9b9b")
        container.addSubview(self.likeNumber);
        self.likeNumber.snp.makeConstraints { (make) in
            make.left.equalTo(self.likeImg.snp.right)
//            make.top.equalTo(self.likeImg)
            make.centerY.equalTo(self.likeImg)
        }
        
        self.commentImage = UIImageView();
        container.addSubview(self.commentImage);
        self.commentImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.likeNumber.snp.right).offset(8);
            make.top.equalTo(self.likeImg);
        }
        self.commentImage.image = UIImage.init(named: "comments_normal");
        
        self.commentNumber = UILabel();
        self.commentNumber.text = "456";
        self.commentNumber.font = UIFont.systemFont(ofSize: 12)
        self.commentNumber.textColor = UIColor().hexStringToColor(hexString: "#9b9b9b")
        container.addSubview(self.commentNumber);
        self.commentNumber.snp.makeConstraints { (make) in
            make.left.equalTo(self.commentImage.snp.right)
            make.centerY.equalTo(self.commentImage)
        }
        
        self.commenter = UILabel();
//        self.commenter.text = "评论人";
        self.commenter.font = UIFont.boldSystemFont(ofSize: 16)
        container.addSubview(self.commenter);
        self.commenter.snp.makeConstraints { (make) in
            make.top.equalTo(self.likeImg.snp.bottom).offset(8);
            make.left.equalTo(self.headImg)
            make.bottom.equalTo(container);
        }
        
        self.comment = UILabel();
//        self.comment.text = "评论内容";
        self.comment.font = UIFont.systemFont(ofSize: 16)
        self.comment.textColor = UIColor().hexStringToColor(hexString: "#4a4a4a");
        container.addSubview(self.comment);
        self.comment.snp.makeConstraints { (make) in
            make.left.equalTo(self.commenter.snp.right);
            make.top.equalTo(self.commenter);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setArticleData(article: JSON) -> Void {
//        print("article:\(article)");
        let data = article["data"][0];
//        print("data \(data)")
        let authors = data["authors"];
//        print("authors:\(authors)")
        let author = authors[0];
//        print("author:\(author)");
        if let headImgUrl = author["avatar"].rawString() {
//            self.headImg.kf.
            self.headImg.kf.setImage(with: URL(string: headImgUrl), placeholder: nil, options: [.processor(ResizingImageProcessor.init(targetSize: CGSize.init(width: 120, height: 120)).append(another: RoundCornerImageProcessor.init(cornerRadius: 60)))], progressBlock: nil, completionHandler: nil);
        }
        
        if let authorName = author["name"].rawString() {
            self.authorName.text = authorName;
        }
        
        let topics = data["topics"]
        let topic = topics[0]
        if let topicName = topic["name"].rawString() {
            self.tagName.text = "#" + topicName;
        }
        
        if let coverUrl = data["cover_url"].rawString() {
            self.coverImage.kf.setImage(with: URL.init(string: coverUrl))
        }
        
        if let title = data["title"].rawString() {
            self.title.text = title;
        }
        
        if let likeCount = data["like_times"].rawString() {
            self.likeNumber.text = likeCount;
        }
        
        if let commentCount = data["comment_times"].rawString() {
            self.commentNumber.text = commentCount
        }
        
        let comments = data["editor_choice_comments"]
        if(comments.count > 0) {
            let comment = comments[0];
//            print("comment: \(comment)")
            let user = comment["user"];
            if let userName = user["nickname"].rawString() {
                self.commenter.text = "-" + userName + ":";
            }
            
            if let commentContent = comment["content"].rawString() {
                self.comment.text = " " + commentContent;
            }
        }else {
            self.comment.text = "";
            self.commenter.text = "";
        }
        
        if let displayTime = data["display_time"].rawString(),let readTime = data["read_time"].rawString() {
            let format = formatTime(publishTime: displayTime, readTime: readTime);
//            print("format time: \(format)");
        }
        
    }
    
    func formatTime(publishTime: String, readTime: String) -> String {
//        DateFormatter
        return "";
    }
    
}

extension UIColor {
    
    public func hexStringToColor(hexString: String) -> UIColor{
        
        var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {
            return UIColor.black
        }
        if cString.hasPrefix("0X") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        if cString.characters.count != 6 {
            return UIColor.black
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(displayP3Red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        
    }
}
