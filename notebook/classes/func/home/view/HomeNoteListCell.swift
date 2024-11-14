//
//  HomeNoteListCell.swift
//  livebook
//
//  Created by 赵超豪 on 2024/11/14.
//

import UIKit

class HomeNoteListCell: RSDBaseCollectionViewCell {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rsd.lineColor()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    private lazy var dateContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "11月20日"
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hexString: "A0A0A0")
        label.numberOfLines = 3
        label.text = " 今天的阳光透过窗户洒进来，把整个房间都染上了暖暖的金色。我起了个大早，打算整理一些手头的项目。最近一直忙于各种开发任务，从手绘画布到自定义标签栏，感觉时间过得特别快，眨眼之间就到了十一月中旬。中午时分，我出去散了个步。街上的行人比往常多一些，可能是大家都被这秋末冬初的阳光吸引出来了吧。树叶已经几乎落尽，只剩下一些顽强的黄叶，挂在树枝上随风摇曳。空气中夹杂着些许凉意，但并不刺骨，反倒让人觉得清爽。下午，我为自己泡了一杯热咖啡，静静地坐在书桌前，看着屏幕上的代码。思绪有时飘远，想着今年的时光，想着那些未完成的目标，也想着一些温暖的瞬间。这个时候，总觉得生活像是一片流动的画布，每一天都在不断涂抹新的色彩。晚上，我准备了一顿简单的晚餐，然后打算放下工作，休息一下。或许会看看一本久未翻阅的小说，或是随意刷刷影片，给自己一些放松的时间。生活继续向前，有忙碌也有安静，希望接下来的每一天都能过得充实而有意义。"
        return label
    }()
    
    private lazy var imageContentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.contentView.addSubview(self.backgroundImageView)
        
        self.contentView.addSubview(self.lineView)
        self.contentView.addSubview(self.stackView)
        self.backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.lineView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(1)
        }
        self.stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(16)
        }
        self.stackView.addArrangedSubview(self.dateContentView)
        self.dateContentView.addSubview(self.dateLabel)
        self.dateLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
        
        let item01 = HomeNoteTagView(style: .weather, title: "晴朗")
        let item02 = HomeNoteTagView(style: .mood, title: "开心")
        let item03 = HomeNoteTagView(style: .matter, title: "敲代码")
        self.stackView.addArrangedSubview(item01)
        self.stackView.addArrangedSubview(item02)
        self.stackView.addArrangedSubview(item03)
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.stackView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualToSuperview().inset(16)
        }
        self.backgroundImageView.image = UIImage(named: "home_list_bg")
    }
}

fileprivate enum HomeNoteTagStyle{
    case weather
    case mood
    case matter
}

fileprivate class HomeNoteTagView: UIView {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    convenience init(style: HomeNoteTagStyle, title: String) {
        self.init(frame: .zero)
        switch style {
        case .weather:
            self.backgroundImageView.image = UIImage(named: "home_tag_01")
        case .mood:
            self.backgroundImageView.image = UIImage(named: "home_tag_02")
        case .matter:
            self.backgroundImageView.image = UIImage(named: "home_tag_03")
        }
        self.titleLabel.text = title
    }
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.titleLabel)
        self.backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
