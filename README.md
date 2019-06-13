# PDAttrbuted<br/>
<br/>
簡化設定 AttrbutedText 步驟<br/>
<br/>
透過預先整理好的項目，更能輕鬆地設定個性化文字內容<br/>
<br/>
<pre>
PDParagraphItem
    textAlignment;       // 對齊
    lineBreakMode;       // 斷行
    lineSpacing;         // 行間距
    lineMinHeight;       // 最低行高
    lineMaxHeight;       // 最高行高
    paragraphSpacing;    // 段间距
    firstLineHeadIndent; // 首行縮進
    headIndent;          // 整體縮進
    tailIndent;
    writingDirection;    // 書寫方向
</pre>
<br/>
<pre>
PDAttributeItem
    font;
    textColor;
    charSpacing;
</pre>
<br/>
簡化前<br/>
<br/>
<pre>
var label = UILabel();
<br/>
var paraph = NSMutableParagraphStyle();
paraph.alignment         = .left;
paraph.lineBreakMode     = .byTruncatingTail;
paraph.lineSpacing       = 10;
paraph.minimumLineHeight = 30;
<br/>
let attributes = [
    NSAttributedString.Key.paragraphStyle : paraph,
    NSAttributedString.Key.kern           : 1.0,
    NSAttributedString.Key.font           : UIFont.systemFont(ofSize: 13, weight: .bold),
    NSAttributedString.Key.foregroundColor: UIColor.black,
    ];
<br/>
label.attributedText = NSAttributedString(string: "測試文字", attributes: attributes);
</pre>
<br/>
簡化後<br/>
<pre>
var label = UILabel();
label.attrbuted(
    "測試文字",
    PDParagraphs([
        PDParagraph(key: .textAlignment, value: NSTextAlignment.left),
        PDParagraph(key: .lineBreakMode, value: NSLineBreakMode.byTruncatingTail),
        PDParagraph(key: .lineSpacing, value: 10),
        PDParagraph(key: .lineMinHeight, value: 30)
        ]),
    PDAttributes([
        PDAttribute(key: .charSpacing, value: 1.0),
        PDAttribute(key: .font, value: UIFont.systemFont(ofSize: 13, weight: .bold)),
        PDAttribute(key: .textColor, value: UIColor.black)
        ]));
</pre>
