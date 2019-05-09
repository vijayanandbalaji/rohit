package com.olx.olxresale.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="address")

public class AddressDetails {
	
	@Id
	@Column(name="address_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int address_id;
	@Column(name="city")
	private String city;
	@Column(name="sublocation")
	private String sublocation;
	@Column(name="state")
	private String state;
	@Column(name="pincode")
	private int pincode;
	@Column(name="country")
	private String country;
	@Column(name="street")
	private String street;
	
	
	
	public AddressDetails(int address_id, String city, String sublocation, String state, int pincode, String country,
			String street) {
		super();
		this.address_id = address_id;
		this.city = city;
		this.sublocation = sublocation;
		this.state = state;
		this.pincode = pincode;
		this.country = country;
		this.street = street;
	}



	@Override
	public String toString() {
		return "AddressDetails [address_id=" + address_id + ", city=" + city + ", sublocation=" + sublocation
				+ ", state=" + state + ", pincode=" + pincode + ", country=" + country + ", street=" + street + "]";
	}



	public int getAddress_id() {
		return address_id;
	}



	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getSublocation() {
		return sublocation;
	}



	public void setSublocation(String sublocation) {
		this.sublocation = sublocation;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public int getPincode() {
		return pincode;
	}



	public void setPincode(int pincode) {
		this.pincode = pincode;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getStreet() {
		return street;
	}



	public void setStreet(String street) {
		this.street = street;
	}



	public AddressDetails() {
		// TODO Auto-generated constructor stub
	}

}
