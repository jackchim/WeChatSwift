//
//  AddContactCellNode.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/30.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

class AddContactCellNode: ASCellNode {
    
    private let imageButtonNode = ASButtonNode()
    
    private let titleNode = ASTextNode()
    
    private let descNode = ASTextNode()
    
    private let arrowNode = ASImageNode()
    
    private let lineNode = ASDisplayNode()
    
    init(model: AddContactSource) {
        super.init()
        automaticallyManagesSubnodes = true
        
        imageButtonNode.setImage(model.image, for: .normal)
        imageButtonNode.imageNode.style.preferredSize = CGSize(width: 16, height: 16)
        imageButtonNode.backgroundColor = model.backgroundColor
        imageButtonNode.isUserInteractionEnabled = false
        
        let titles = model.titles
        titleNode.attributedText = model.attributedStringForTitle(titles.0)
        descNode.attributedText = model.attributedStringForDesc(titles.1)
        arrowNode.image = UIImage.SVGImage(named: "icons_outlined_arrow")
        
        lineNode.backgroundColor = Colors.DEFAULT_BORDER_COLOR
    }
    
    override func didLoad() {
        super.didLoad()
        
        backgroundColor = Colors.white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        imageButtonNode.style.spacingBefore = 16
        imageButtonNode.style.preferredSize = CGSize(width: 24, height: 24)
        arrowNode.style.preferredSize = CGSize(width: 12, height: 24)
        arrowNode.style.spacingAfter = 16
        
        let vertical = ASStackLayoutSpec.vertical()
        vertical.spacing = 4
        vertical.style.flexGrow = 1.0
        vertical.children = [titleNode, descNode]
        
        let stack = ASStackLayoutSpec.horizontal()
        stack.spacing = 16
        stack.alignItems = .center
        stack.children = [imageButtonNode, vertical, arrowNode]
        stack.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 67)
        
        lineNode.style.preferredSize = CGSize(width: Constants.screenWidth - 56, height: Constants.lineHeight)
        lineNode.style.layoutPosition = CGPoint(x: 56, y: 67 - Constants.lineHeight)
        
        let layout = ASAbsoluteLayoutSpec(children: [stack, lineNode])
        return layout
    }
}