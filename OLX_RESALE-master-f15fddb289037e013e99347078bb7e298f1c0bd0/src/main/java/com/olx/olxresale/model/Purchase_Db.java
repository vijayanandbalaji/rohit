package com.olx.olxresale.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="purchase_db")
public class Purchase_Db {

	@Id
	@Column(name="purchase_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)//auto increment
	private int purchase_id;
	
	@Column(name="item_id")
	private int item_id;
	@Column(name="item_name")
	private String item_name;
	@Column(name="years_of_usage")
	private int years_of_usage;
	@Column(name="item_image")
	private String item_image;
	@Column(name="price")
	private String price;
	@Column(name="category_id")
	private int category_id;	
	@Column(name="category_name")
	private String category_name;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_fk_p")
	UserDetails userDetails;
	
	
	
	//fks
	/*@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="item_fk_p")
	ItemDetails itemDetails;*/

	



/*	public ItemDetails getItemDetails() {
		return itemDetails;
	}



	public void setItemDetails(ItemDetails itemDetails) {
		this.itemDetails = itemDetails;
	}
*/


	

/*
	public Purchase_Db(int purchase_id, ItemDetails itemDetails, UserDetails userDetails) {
		super();
		this.purchase_id = purchase_id;
		this.itemDetails = itemDetails;
		this.userDetails = userDetails;
	}



	@Override
	public String toString() {
		return "Purchase_Db [purchase_id=" + purchase_id + ", itemDetails=" + itemDetails + ", userDetails="
				+ userDetails + "]";
	}
*/


	public Purchase_Db(int purchase_id, int item_id, String item_name, int years_of_usage, String item_image,
			String price, int category_id, String category_name, UserDetails userDetails) {
		super();
		this.purchase_id = purchase_id;
		this.item_id = item_id;
		this.item_name = item_name;
		this.years_of_usage = years_of_usage;
		this.item_image = item_image;
		this.price = price;
		this.category_id = category_id;
		this.category_name = category_name;
		this.userDetails = userDetails;
	}



	@Override
	public String toString() {
		return "Purchase_Db [purchase_id=" + purchase_id + ", item_id=" + item_id + ", item_name=" + item_name
				+ ", years_of_usage=" + years_of_usage + ", item_image=" + item_image + ", price=" + price
				+ ", category_id=" + category_id + ", category_name=" + category_name + ", userDetails=" + userDetails
				+ "]";
	}



	public int getPurchase_id() {
		return purchase_id;
	}



	public void setPurchase_id(int purchase_id) {
		this.purchase_id = purchase_id;
	}



	public int getItem_id() {
		return item_id;
	}



	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}



	public String getItem_name() {
		return item_name;
	}



	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}



	public int getYears_of_usage() {
		return years_of_usage;
	}



	public void setYears_of_usage(int years_of_usage) {
		this.years_of_usage = years_of_usage;
	}



	public String getItem_image() {
		return item_image;
	}



	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public int getCategory_id() {
		return category_id;
	}



	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}



	public String getCategory_name() {
		return category_name;
	}



	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}



	public UserDetails getUserDetails() {
		return userDetails;
	}



	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}



	public Purchase_Db() {
		// TODO Auto-generated constructor stub
	}

}
