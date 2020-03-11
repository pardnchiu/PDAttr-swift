//
//  PDAttributed.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/6/9.
//  Copyright © 2016-2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public struct PDAttr {
    public enum body {
        case text;
        
        case font;
        case textColor;
        case charSpacing;
        
        case textAlignment;    // 對齊
        case lineBreakMode;    // 斷行
        case lineSpacing;      // 行間距
        case lineMinHeight;    // 最低行高
        case lineMaxHeight;    // 最高行高
        case paragraphSpacing; // 段间距
        case firstLineIndent;  // 首行縮進
        case headIndent;       // 整體縮進
        case tailIndent;
        case direction;        // 書寫方向
    };
    public var key: body, value: Any
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};
public func aText(text value: String)                   -> PDAttr { return PDAttr(.text, value) };
public func aText(font value: UIFont)                   -> PDAttr { return PDAttr(.font, value) };
public func aText(textColor value: UIColor)             -> PDAttr { return PDAttr(.textColor, value) };
public func aText(textAlignment value: NSTextAlignment) -> PDAttr { return PDAttr(.textAlignment, value) };
public func aText(charSpacing value: Float)             -> PDAttr { return PDAttr(.charSpacing, value) };
public func aText(lineBreakMode value: NSLineBreakMode) -> PDAttr { return PDAttr(.lineBreakMode, value) };
public func aText(lineSpacing value: CGFloat)           -> PDAttr { return PDAttr(.lineSpacing, value) };
public func aText(lineMinHeight value: CGFloat)         -> PDAttr { return PDAttr(.lineMinHeight, value) };
public func aText(lineMaxHeight value: CGFloat)         -> PDAttr { return PDAttr(.lineMaxHeight, value) };
public func aText(paragraphSpacing value: CGFloat)      -> PDAttr { return PDAttr(.paragraphSpacing, value) };
public func aText(firstLineIndent value: CGFloat)       -> PDAttr { return PDAttr(.firstLineIndent, value) };
public func aText(headIndent value: CGFloat)            -> PDAttr { return PDAttr(.headIndent, value) };
public func aText(tailIndent value: CGFloat)            -> PDAttr { return PDAttr(.tailIndent, value) };
public func aText(direction value: NSWritingDirection)  -> PDAttr { return PDAttr(.direction, value) };

public func PDAttrString(_ values: [PDAttr]) -> NSAttributedString {
    var attributes: [NSAttributedString.Key:Any] = [:];
    var text: String = "";
    let style = NSMutableParagraphStyle().set { (style) in
        values.forEach {
            switch $0.key {
            case .text            : if let value = $0.value as? String { text = value };
            case .font            : if let value = $0.value as? UIFont { attributes[NSAttributedString.Key.font] = value };
            case .textColor       : if let value = $0.value as? UIColor { attributes[NSAttributedString.Key.foregroundColor] = value };
            case .charSpacing     : if let value = $0.value as? Float { attributes[NSAttributedString.Key.kern] = value };
            case .textAlignment   : if let value = $0.value as? NSTextAlignment { style.alignment = value };
            case .lineBreakMode   : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
            case .lineSpacing     : if let value = $0.value as? CGFloat { style.lineSpacing = value };
            case .lineMinHeight   : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
            case .lineMaxHeight   : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
            case .paragraphSpacing: if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
            case .firstLineIndent : if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
            case .headIndent      : if let value = $0.value as? CGFloat { style.headIndent = value };
            case .tailIndent      : if let value = $0.value as? CGFloat { style.tailIndent = value };
            case .direction       : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
            };
        };
    };
    attributes[NSAttributedString.Key.paragraphStyle] = style;
    return NSAttributedString(string: text, attributes: attributes);
}

public extension UIButton {
    func PDAttr(normal values: [PDAttr]) { self.setAttributedTitle(PDAttrString(values), for: .normal) };
    func PDAttr(highlight values: [PDAttr]) { self.setAttributedTitle(PDAttrString(values), for: .highlighted) };
    func PDAttr(disabled values: [PDAttr]) { self.setAttributedTitle(PDAttrString(values), for: .disabled) };
};

public extension UILabel {
    func PDAttr(_ values: [PDAttr]) { self.attributedText = PDAttrString(values) };
};

public extension UITextField {
    func PDAttr(txt values: [PDAttr]) { self.attributedText = PDAttrString(values) };
    func PDAttr(phd values: [PDAttr]) { self.attributedPlaceholder = PDAttrString(values) };
};
