//
//  HomeNoteListCell.swift
//  livebook
//
//  Created by 赵超豪 on 2024/11/14.
//

import UIKit

class HomeNoteListCell: RSDBaseCollectionViewCell {
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rsd.lineColor()
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        
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
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
