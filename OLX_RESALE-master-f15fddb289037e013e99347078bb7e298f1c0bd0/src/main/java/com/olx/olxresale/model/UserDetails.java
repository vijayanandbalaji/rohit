package com.olx.olxresale.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class UserDetails {

	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)//auto increment
	private int user_id;
	@Column(name="first_name")
	private String first_name;
	@Column(name="last_name")
	private String last_name;
	@Column(name="age")
	private int age;
	@Column(name="gender")
	private String gender;
	@Column(name="contact_number")
	private String contact_number;
	@Column(name="password")
	private String password;
	@Column(name="email")
	private String email;
	
	//fks
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="address_fk_u")
	AddressDetails addressDetails;
	
	
	
	
	
	
	
	
	public int getUser_id() {
		return user_id;
	}








	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}








	public String getFirst_name() {
		return first_name;
	}








	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}








	public String getLast_name() {
		return last_name;
	}








	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}








	public int getAge() {
		return age;
	}








	public void setAge(int age) {
		this.age = age;
	}








	public String getGender() {
		return gender;
	}








	public void setGender(String gender) {
		this.gender = gender;
	}








	public String getContact_number() {
		return contact_number;
	}








	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}








	public String getPassword() {
		return password;
	}








	public void setPassword(String password) {
		this.password = password;
	}








	public String getEmail() {
		return email;
	}








	public void setEmail(String email) {
		this.email = email;
	}








	public AddressDetails getAddressDetails() {
		return addressDetails;
	}








	public void setAddressDetails(AddressDetails addressDetails) {
		this.addressDetails = addressDetails;
	}







//for login use constructor
	public UserDetails(String first_name, String password) {
		super();
		this.first_name = first_name;
		this.password = password;
	}








	public UserDetails(int user_id, String first_name, String last_name, int age, String gender, String contact_number,
			String password, String email, AddressDetails addressDetails) {
		super();
		this.user_id = user_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.age = age;
		this.gender = gender;
		this.contact_number = contact_number;
		this.password = password;
		this.email = email;
		this.addressDetails = addressDetails;
	}








	@Override
	public String toString() {
		return "UserDetails [user_id=" + user_id + ", first_name=" + first_name + ", last_name=" + last_name + ", age="
				+ age + ", gender=" + gender + ", contact_number=" + contact_number + ", password=" + password
				+ ", email=" + email + ", addressDetails=" + addressDetails + "]";
	}








	public UserDetails() {
		// TODO Auto-generated constructor stub
	}

}
