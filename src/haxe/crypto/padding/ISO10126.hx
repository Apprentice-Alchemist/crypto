package haxe.crypto.padding;

import haxe.io.BytesBuffer;
import haxe.io.Bytes;

class ISO10126
{
    public static function pad(ciphertext:Bytes, blockSize:Int):Bytes
    {
      var padding:Int = blockSize - ciphertext.length % blockSize -1;
      var bsize = ciphertext.length+padding;
      var buffer: Bytes =Bytes.alloc(bsize+1);
      buffer.blit(0,ciphertext,0,ciphertext.length);
      for(i in ciphertext.length...bsize) {
        buffer.set(i,Std.random(256)); 
      }
      buffer.set(bsize+1,padding+1);
      return buffer;
    }

    public static function unpad(encrypt:Bytes):Bytes
    {
      var padding : Int = encrypt.get(encrypt.length-1);
      return encrypt.sub(0,encrypt.length - padding);
    }
}
