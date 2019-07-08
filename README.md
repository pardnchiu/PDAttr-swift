# PDAttrbuted<br/>
<br/>
簡化設定 AttrbutedText 步驟<br/>
<br/>
透過預先整理好的項目，更能輕鬆地設定個性化文字內容<br/>
<br/>
<pre>
Body
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
label.PDAttrbuted([
    lText(text: "測試文字"),
    lText(textColor: .black),
    lText(textAlignment: .left),
    lText(font: .systemFont(ofSize: 13, weight: .bold)),
    lText(lineBreakMode: .byTruncatingTail),
    lText(lineSpacing: 10),
    lText(lineMinHeight: 30),
    lText(charSpacing: 1.0)
])
</pre>
