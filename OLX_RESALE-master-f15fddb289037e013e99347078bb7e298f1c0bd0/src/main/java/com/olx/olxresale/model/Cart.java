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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="cart")
public class Cart {

	@Id
	@Column(name="cart_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)//auto increment
	private int cart_id;
	
	//fks
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="item_fk_c")
	ItemDetails itemDetails;

	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_fk_c")
	UserDetails userDetails;
	
	
	
	public int getCart_id() {
		return cart_id;
	}



	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}



	public ItemDetails getItemDetails() {
		return itemDetails;
	}



	public void setItemDetails(ItemDetails itemDetails) {
		this.itemDetails = itemDetails;
	}



	public UserDetails getUserDetails() {
		return userDetails;
	}



	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}



	public Cart(int cart_id, ItemDetails itemDetails, UserDetails userDetails) {
		super();
		this.cart_id = cart_id;
		this.itemDetails = itemDetails;
		this.userDetails = userDetails;
	}



	@Override
	public String toString() {
		return "cart [cart_id=" + cart_id + ", itemDetails=" + itemDetails + ", userDetails=" + userDetails + "]";
	}



	public Cart() {
		// TODO Auto-generated constructor stub
	}

}
