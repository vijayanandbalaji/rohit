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
import javax.persistence.Table;



@Entity
@Table(name="items")
public class ItemDetails {

	@Id
	@Column(name="item_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int item_id;
	@Column(name="item_name")
	private String item_name;
	@Column(name="years_of_usage")
	private int years_of_usage;
	@Column(name="item_image")
	private String item_image;
	@Column(name="price")
	private String price;
	
	
	//fks
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="cat_fk_i")							//foreign keys				
	ItemCategory itemCategory;
	
	
	
	
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




	public ItemCategory getItemCategory() {
		return itemCategory;
	}




	public void setItemCategory(ItemCategory itemCategory) {
		this.itemCategory = itemCategory;
	}








	public String getPrice() {
		return price;
	}




	public void setPrice(String price) {
		this.price = price;
	}




	@Override
	public String toString() {
		return "ItemDetails [item_id=" + item_id + ", item_name=" + item_name + ", years_of_usage=" + years_of_usage
				+ ", item_image=" + item_image + ", price=" + price + ", itemCategory=" + itemCategory + "]";
	}




	public ItemDetails(int item_id, String item_name, int years_of_usage, String item_image, String price,
			ItemCategory itemCategory) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
		this.years_of_usage = years_of_usage;
		this.item_image = item_image;
		this.price = price;
		this.itemCategory = itemCategory;
	}




	public ItemDetails() {
		// TODO Auto-generated constructor stub
	}

}
