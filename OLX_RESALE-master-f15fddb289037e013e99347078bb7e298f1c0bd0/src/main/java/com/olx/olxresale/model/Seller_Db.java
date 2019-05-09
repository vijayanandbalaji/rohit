package com.olx.olxresale.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="seller")
public class Seller_Db {
	
	@Id
	@Column(name="sno")
	@GeneratedValue(strategy=GenerationType.IDENTITY)//auto increment
	private int sno;
	
	//fks
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="item_fk_s")
	ItemDetails itemDetails;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_fk_s")
	UserDetails userDetails;
	
	public Seller_Db(int sno, ItemDetails itemDetails, UserDetails userDetails) {
		super();
		this.sno = sno;
		this.itemDetails = itemDetails;
		this.userDetails = userDetails;
	}

	@Override
	public String toString() {
		return "Seller_Db [sno=" + sno + ", itemDetails=" + itemDetails + ", userDetails=" + userDetails + "]";
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
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



	public Seller_Db() {
		
	}

}
