package library;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Locale;
import java.util.regex.Pattern;

public class LibraryString {
	private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");  
	private static final Pattern WHITESPACE = Pattern.compile("[\\s]");  
	  
	public static String md5(String str){
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());
			
			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	  
	public static String makeSlug(String input) {  
	    String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");  
	    String normalized = Normalizer.normalize(nowhitespace, Form.NFD);  
	    String slug = NONLATIN.matcher(normalized).replaceAll("");  
	    return slug.toLowerCase(Locale.ENGLISH);  
	} 

}
