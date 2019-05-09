package com.olx.olxresale.hib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olx.olxresale.exception.OlxException;
import com.olx.olxresale.model.AddressDetails;
import com.olx.olxresale.model.Cart;
import com.olx.olxresale.model.ItemDetails;
import com.olx.olxresale.model.Purchase_Db;
import com.olx.olxresale.model.UserDetails;

@Service("olxHbService")
public class OlxHbService implements IOlx {
	@Autowired
	IOlx olxDao;

	public int checkUserDetails(UserDetails userDetails) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("In checkUserDetails login hib");
		System.out.println(userDetails);
		return olxDao.checkUserDetails(userDetails);
	}

	public int signUp(UserDetails userDetails) throws Exception {
		System.out.println("in saveuser service hib");

		return olxDao.signUp(userDetails);
	}

	public OlxHbService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int saveAddress(AddressDetails addressDetails) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// to display all items in home page
	@Override
	public List<ItemDetails> getItemDetails() throws OlxException {

		return olxDao.getItemDetails();
	}

	@Override
	public ItemDetails getItemDetails(int itemID) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.getItemDetails(itemID);
	}

	@Override
	public Cart addCartDetails(UserDetails userDetails, ItemDetails itemDetails, Cart cart) throws OlxException {

		return olxDao.addCartDetails(userDetails, itemDetails, cart);
	}

	@Override
	public UserDetails getUserDetails(int user_id) throws OlxException {

		return olxDao.getUserDetails(user_id);
	}

	@Override
	public int checkPayment(UserDetails userDetails, ItemDetails itemDetails) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.checkPayment(userDetails, itemDetails);
	}

	@Override
	public List<Purchase_Db> getOrderDetails(int user_id) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.getOrderDetails(user_id);
	}

	@Override
	public List geCartDetails(int user_id) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.geCartDetails(user_id);
	}

	@Override
	public int buyFromCart(UserDetails userDetails) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.buyFromCart(userDetails);
	}

	@Override
	public int sellItem(ItemDetails itemDetails, UserDetails userDetails) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.sellItem(itemDetails, userDetails);
	}

	@Override
	public List getMyAds(UserDetails userDetails) throws OlxException {
		// TODO Auto-generated method stub
		return olxDao.getMyAds(userDetails);
	}

}
