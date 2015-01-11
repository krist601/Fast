package user

import java.security.GeneralSecurityException
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.Charset;

class SecAppUser {

    transient springSecurityService

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    byte [] photo
    String name
    String email 
  
    static constraints = {
        username blank: false, unique: true
        password blank: false
        photo blank: true, nullable: true
        name blank: true, nullable: true
        email blank: true, nullable: true        
    }

    static mapping = {
        password column: '`password`'
    }

    Set<SecAppRole> getAuthorities() {
        SecAppUserSecAppRole.findAllBySecAppUser(this).collect { it.secAppRole } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    
    static byte[] encrypt( key,  value)
    throws GeneralSecurityException {

        byte[] raw = key.getBytes(Charset.forName("US-ASCII"));
        if (raw.length != 16) {
            throw new IllegalArgumentException("Invalid key size.");
        }

        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec,
            new IvParameterSpec(new byte[16]));
        return cipher.doFinal(value.getBytes(Charset.forName("US-ASCII")));
    }

    static String decrypt( key,  encrypted)
    throws GeneralSecurityException {

        byte[] raw = key.getBytes(Charset.forName("US-ASCII"));
        if (raw.length != 16) {
            throw new IllegalArgumentException("Invalid key size.");
        }
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec,
            new IvParameterSpec(new byte[16]));
        byte[] original = cipher.doFinal(encrypted);

        return new String(original, Charset.forName("US-ASCII"));
    }
    
    
    String toString(){
        return "${username}"
    }
}
