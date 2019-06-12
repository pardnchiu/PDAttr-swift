# AttrbutedTextExtension

簡化設定 AttrbutedText 步驟

透過整理好的項目，方便設定個性化文字內容

Paragraph
    textAlignment;        // 對齊方向
    lineBreakMode;        // 斷行顯示
    lineSpacing;          // 行間距
    lineMinHeight;        // 最低行高
    lineMaxHeight;        // 最高行高
    paragraphSpacing;     // 段间距
    firstLineHeadIndent;  // 首行縮進
    headIndent;           // 整體縮進
    tailIndent;
    baseWritingDirection; // 書寫方向
    
Attribute
    font;        // 自型
    textColor;   // 顏色
    charSpacing; // 字元間距

-------- before
var label = UILabel()

var paraph = NSMutableParagraphStyle()
paraph.alignment         = .left;
paraph.lineBreakMode     = .byTruncatingTail
paraph.lineSpacing       = 10;
paraph.minimumLineHeight = 30;

let attributes = [
    NSAttributedString.Key.paragraphStyle : paraph,
    NSAttributedString.Key.kern           : 1.0,
    NSAttributedString.Key.font           : UIFont.systemFont(ofSize: 13, weight: .bold),
    NSAttributedString.Key.foregroundColor: UIColor.black
];

label.attributedText = NSAttributedString(string: "測試文字", attributes: attributes);

-------- after
var label = UILabel() 
label.attrbuted(
    "測試文字",
    sParagraphs([
        sParagraph(key: .textAlignment, value: NSTextAlignment.left),
        sParagraph(key: .lineBreakMode, value: NSLineBreakMode.byTruncatingTail),
        sParagraph(key: .lineSpacing, value: 10),
        sParagraph(key: .lineMinHeight, value: 30)
        ]),
    sAttributes([
        sAttribute(key: .charSpacing, value: 1.0),
        sAttribute(key: .font, value: UIFont.systemFont(ofSize: 13, weight: .bold)),
        sAttribute(key: .textColor, value: UIColor.black)
        ]));
