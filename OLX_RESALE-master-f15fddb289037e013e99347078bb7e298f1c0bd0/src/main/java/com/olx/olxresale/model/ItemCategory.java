package com.olx.olxresale.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")


public class ItemCategory {

@Id
@Column(name="category_id")
private int category_id;	
@Column(name="category_name")
private String category_name;

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



	



	public ItemCategory(int category_id, String category_name) {
	super();
	this.category_id = category_id;
	this.category_name = category_name;
}



	@Override
public String toString() {
	return "ItemCategory [category_id=" + category_id + ", category_name=" + category_name + "]";
}



	public ItemCategory() {
		// TODO Auto-generated constructor stub
	}

}
