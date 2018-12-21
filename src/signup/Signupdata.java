package signup;

import java.io.InputStream;

public class Signupdata {
	String aadhar;
	String con_no;
	String otp;
	String name;
	String address;
	String gender;
	String dob;
	String email;
	String password;
	InputStream photoStream;
	int photoSize;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPhotoSize() {
		return photoSize;
	}
	public void setPhotoSize(int photoSize) {
		this.photoSize = photoSize;
	}
	public InputStream getPhotoStream() {
		return photoStream;
	}
	public void setPhotoStream(InputStream photoStream) {
		this.photoStream = photoStream;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAadhar() {
		return aadhar;
	}
	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}
	public String getCon_no() {
		return con_no;
	}
	public void setCon_no(String con_no) {
		this.con_no = con_no;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
}
