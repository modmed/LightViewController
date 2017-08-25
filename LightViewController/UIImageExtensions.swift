import Foundation
import UIKit

extension UIImage
{
    class func imageFromText(text:String) -> UIImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraph.alignment = .center
        
        let attributedString = NSAttributedString(string: text as String, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.red, NSParagraphStyleAttributeName:paragraph])
        
        let size = sizeOfAttributeString(str: attributedString, maxWidth: 100)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func sizeOfAttributeString(str: NSAttributedString, maxWidth: CGFloat) -> CGSize {
        let size = str.boundingRect(with: CGSize(width: maxWidth, height: 1000), options:(NSStringDrawingOptions.usesLineFragmentOrigin), context:nil).size
        return size
    }
    

}
