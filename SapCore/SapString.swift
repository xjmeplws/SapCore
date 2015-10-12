//
//  SapString.swift
//  SapcORE
//
//  Created by huangyawei on 15/10/10.
//  Copyright © 2015年 sapze. All rights reserved.
//

import Foundation
import CommonCrypto

public extension String {
    //base64
    public var base64Encoding: String {
        get{
            let utf8Str = self.dataUsingEncoding(NSUTF8StringEncoding)
            return utf8Str!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        }
    }
    public var base64Decoding: String {
        get{
            guard let data = NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions.init(rawValue: 0)) else {
                return ""
            }
            return (NSString(data: data, encoding: NSUTF8StringEncoding) as! String)
        }
    }
    //md5
    public var md5Encoding: String{
        get{
            let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
            let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
            let digestLen = Int(CC_MD5_DIGEST_LENGTH)
            let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
            CC_MD5(str!, strLen, result)
            
            let hash = NSMutableString()
            for i in 0..<digestLen {
                hash.appendFormat("%x", result[i])
            }
            result.destroy()
            return hash as String
        }
    }
    //sha1
    public var sha1Encoding: String {
        get{
            let data = self.dataUsingEncoding(NSUTF8StringEncoding)
            var digest = [UInt8](count: Int(CC_SHA1_DIGEST_LENGTH), repeatedValue: 0)
            CC_SHA1(data!.bytes, CC_LONG(data!.length), &digest)
            
            let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
            
            for byte in digest {
                output.appendFormat("%02x", byte)
            }
            digest.removeAll()
            return output as String
        }
    }
    //sha256
    public var sha256Encoding: String {
        get{
            let data = self.dataUsingEncoding(NSUTF8StringEncoding)
            var digest = [UInt8](count: Int(CC_SHA256_DIGEST_LENGTH), repeatedValue: 0)
            CC_SHA256(data!.bytes, CC_LONG(data!.length), &digest)
            
            let output = NSMutableString(capacity: Int(CC_SHA256_DIGEST_LENGTH))
            
            for byte in digest {
                output.appendFormat("%02x", byte)
            }
            digest.removeAll()
            return output as String
        }
    }
}