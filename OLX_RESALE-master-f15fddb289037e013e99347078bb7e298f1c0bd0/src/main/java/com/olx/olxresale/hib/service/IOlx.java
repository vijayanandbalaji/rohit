package com.olx.olxresale.hib.service;


import java.util.List;

import com.olx.olxresale.exception.OlxException;
import com.olx.olxresale.model.AddressDetails;
import com.olx.olxresale.model.Cart;
import com.olx.olxresale.model.ItemDetails;
import com.olx.olxresale.model.Purchase_Db;
import com.olx.olxresale.model.UserDetails;

public interface IOlx {
	public int checkUserDetails(UserDetails userDetails) throws Exception;
	public int signUp(UserDetails userDetails) throws Exception;
	int saveAddress(AddressDetails addressDetails) throws Exception;
	public List<ItemDetails> getItemDetails() throws OlxException;
	public ItemDetails getItemDetails(int itemID)throws OlxException;
	public Cart addCartDetails(UserDetails userDetails,ItemDetails itemDetails,Cart cart) throws OlxException;
	public UserDetails getUserDetails(int user_id) throws OlxException;
	public int checkPayment(UserDetails userDetails,ItemDetails itemDetails) throws OlxException;
	public List<Purchase_Db> getOrderDetails(int user_id)throws OlxException;
	public List geCartDetails(int user_id) throws OlxException;
	public int buyFromCart(UserDetails userDetails)throws OlxException;
	public int sellItem(ItemDetails itemDetails, UserDetails userDetails)throws OlxException;
	public List getMyAds(UserDetails userDetails) throws OlxException;

}
