//
//  ARTopBannerTableCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 06/04/22.
//

import UIKit

final class ARTopBannerTableCell: UITableViewCell {
    lazy var carouselView: CarouselView<UIImageView, Int> = {
        let view = CarouselView<UIImageView, Int>()
        view.scrollingType = .pagination
        return view
    }()
    lazy var currentPageLabel: UILabel = {
       let view = UILabel()
        view.backgroundColor = .black
        view.textAlignment = .center
        view.textColor = .white
        return view
    }()
    
    private lazy var carouselItemSize: CGSize = {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = width / 2.5
        return CGSize(width: width, height: height)
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupAddSubview()
        setupConstraint()
    }
    
    private func setupAddSubview() {
        contentView.addSubview(carouselView)
        contentView.addSubview(currentPageLabel)
    }
    
    private func setupConstraint() {
        carouselView.makeConstraint {[
            $0.heightAnchor.constraint(equalToConstant: self.carouselItemSize.height),
            $0.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            $0.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]}
        currentPageLabel.makeConstraint {[
            $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]}
    }
    
    func configure() {
        currentPageLabel.text = "Page: \(carouselView.currentPage)"
        
        carouselView.didPageScroll = { [weak self](view, number, page) in
            self?.currentPageLabel.text = "Page: \(page)"
        }
        carouselView.configure(items: Array(1...10), itemSize: carouselItemSize) { view, number, indexPath in
            let imageUrl = "https://global-uploads.webflow.com/6100d0111a4ed76bc1b9fd54/617b2e0d60041b7f14d37df5_WebDev%20Banner%403x.png"
            view.loadImage(resource: imageUrl)
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
        }
    }
}
