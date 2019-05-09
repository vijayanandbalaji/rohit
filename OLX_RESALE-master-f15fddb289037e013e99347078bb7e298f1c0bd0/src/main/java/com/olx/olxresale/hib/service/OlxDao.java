package com.olx.olxresale.hib.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.olx.olxresale.exception.OlxException;
import com.olx.olxresale.model.AddressDetails;
import com.olx.olxresale.model.Cart;
import com.olx.olxresale.model.ItemCategory;
import com.olx.olxresale.model.ItemDetails;
import com.olx.olxresale.model.Purchase_Db;
import com.olx.olxresale.model.Seller_Db;
import com.olx.olxresale.model.UserDetails;

@Component
public class OlxDao implements IOlx {

	public OlxDao() {
		// TODO Auto-generated constructor stub
	}

	@PersistenceContext // connection object
	private EntityManager entityManager; // connection object

	@Transactional(readOnly = true)
	@Override
	public int checkUserDetails(UserDetails userDetails) throws Exception {
		int flag = 0;
		Query query = entityManager.createQuery("select u.user_id from UserDetails u where u.email=? and u.password=?");// here

		query.setParameter(0, userDetails.getEmail());// starts from 0;
		query.setParameter(1, userDetails.getPassword());

		List<Object[]> l = query.getResultList();

		System.out.println(l);
		if (l.isEmpty() == false) {
			System.out.println("Result" + query.getSingleResult());
			userDetails.setUser_id((int) (query.getSingleResult()));
			System.out.println("Logged in");
			flag = 1;

		} else {
			System.out.println("User not available");

		}
		return flag;
	}

	@Transactional // spring transaction
	@Override
	public int signUp(UserDetails userDetails) throws Exception {// since there are 2 dependencies (user and address
																	// tables) 1st we have to save address table and
																	// pass the generated--
																	// -- address id to user...
		AddressDetails addressDetails = userDetails.getAddressDetails();
		int addressId = this.saveAddress(addressDetails);
		addressDetails.setAddress_id(addressId);
		userDetails.setAddressDetails(addressDetails);// passing address details with generated address id to
														// userdetails

		entityManager.merge(userDetails);
		return 1;
	}

	@Transactional // spring transaction
	@Override
	public int saveAddress(AddressDetails addressDetails) throws Exception { // this the method fr saving address fr abv
																				// method
		// TODO Auto-generated method stub

		AddressDetails details = entityManager.merge(addressDetails);
		return details.getAddress_id();
	}

	// to display all items in homepage
	@Transactional(readOnly = true)
	@Override
	public List<ItemDetails> getItemDetails() throws OlxException {
		// TODO Auto-generated method stub
		TypedQuery<ItemDetails> query = entityManager.createQuery("select i from ItemDetails i", ItemDetails.class);
		System.out.println("inside itemDao-->items:" + query);
		List<ItemDetails> list = query.getResultList();
		System.out.println(list);

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public ItemDetails getItemDetails(int itemID) throws OlxException {

		ItemDetails itemDetails = entityManager.find(ItemDetails.class, itemID);

		return itemDetails;
	}

	@Transactional()
	@Override
	public Cart addCartDetails(UserDetails userDetails, ItemDetails itemDetails, Cart cart) throws OlxException {

		TypedQuery<ItemDetails> itemQuery = entityManager.createQuery("select i from ItemDetails i where i.item_id=?",
				ItemDetails.class);
		itemQuery.setParameter(0, itemDetails.getItem_id());
		itemDetails = (ItemDetails) itemQuery.getSingleResult();

		TypedQuery<UserDetails> userQuery = entityManager.createQuery("select u from UserDetails u where u.user_id=?",
				UserDetails.class);
		userQuery.setParameter(0, userDetails.getUser_id());
		userDetails = (UserDetails) userQuery.getSingleResult();

		cart.setItemDetails(itemDetails);
		cart.setUserDetails(userDetails);
		System.out.println("in addcart details-->olxDao");
		System.out.println(userDetails);
		System.out.println(itemDetails);
		Cart c = entityManager.merge(cart);

		return c;
	}

	@Override
	public UserDetails getUserDetails(int user_id) throws OlxException {
		UserDetails user = entityManager.find(UserDetails.class, user_id);
		return user;
	}

	@Transactional()
	@Override
	public int checkPayment(UserDetails userDetails, ItemDetails itemDetails) throws OlxException {
		int flag = 0;
		System.out.println("inside payment checking dao");
		Query query = entityManager.createQuery(
				"select u.user_id from UserDetails u where u.contact_number=? and u.password=? and u.user_id=?");// here
																													// LoginDetails
																													// is
																													// class
																													// name
																													// and
																													// username
																													// and
																													// password
																													// is
																													// class
																													// variables
		query.setParameter(0, userDetails.getContact_number());// starts from 0;
		query.setParameter(1, userDetails.getPassword());
		query.setParameter(2, userDetails.getUser_id());

		List<Object[]> l = query.getResultList();

		if (l.isEmpty() == false) {
			System.out.println("Result" + query.getSingleResult());
			System.out.println("user available");
			System.out.println("payment processing");
			UserDetails uDetails = getUserDetails(userDetails.getUser_id());
			ItemDetails iDetails = getItemDetails(itemDetails.getItem_id());
			int c_id=iDetails.getItemCategory().getCategory_id();
			String c_name=iDetails.getItemCategory().getCategory_name();

			Purchase_Db db = new Purchase_Db();
			/*db.setItemDetails(iDetails);*/
			db.setUserDetails(uDetails);
			db.setItem_id(iDetails.getItem_id());
			System.out.println("1");
			db.setItem_name(iDetails.getItem_name());
			System.out.println("2");
			db.setYears_of_usage(iDetails.getYears_of_usage());
			System.out.println("3");
			db.setItem_image(iDetails.getItem_image());
			System.out.println("4");
			db.setPrice(iDetails.getPrice());
			System.out.println("5");
			db.setCategory_id(c_id);
			System.out.println("6");
			db.setCategory_name(c_name);
			System.out.println("7");
			Purchase_Db purchase_Db = entityManager.merge(db);
			System.out.println("payment done");

			/*
			 * Cart removeFromCart = entityManager.find(Cart.class,
			 * itemDetails.getItem_id());
			 * System.out.println("cart-------------------------->"+removeFromCart+
			 * "-------------------------"); if (removeFromCart != null) {
			 * entityManager.remove(removeFromCart);
			 * System.out.println("item removed from cart"); }
			 * 
			 * Seller_Db removeFromSeller = entityManager.find(Seller_Db.class,
			 * itemDetails.getItem_id());
			 * System.out.println("seller-------------------------->"+removeFromCart+
			 * "-------------------------"); if (removeFromSeller != null) {
			 * entityManager.remove(removeFromSeller);
			 * System.out.println("item sold from seller_db"); }
			 */

			Query itemQuery = entityManager.createQuery("DELETE FROM Cart c where c.itemDetails.item_id=?");// to remove
																											// all
			itemQuery.setParameter(0, itemDetails.getItem_id()).executeUpdate();
			if (itemQuery != null) {
				System.out.println("items removed from cart");
			}
			
			
			Query soldItemQuery = entityManager.createQuery("DELETE FROM Seller_Db s where s.itemDetails.item_id=?");																									// all
			soldItemQuery.setParameter(0, itemDetails.getItem_id()).executeUpdate();
			if (soldItemQuery != null) {
				System.out.println("items SOLD");
			}

			Query removeItem = entityManager.createQuery("DELETE FROM ItemDetails i where i.item_id=?");// to remove all
			removeItem.setParameter(0, itemDetails.getItem_id()).executeUpdate();
			if (removeItem != null) {
				System.out.println("Ad removed from items table");
			}
			flag = 1;

		} else {
			System.out.println("User not available");
			flag = 0;

		}

		return flag;
	}

	@Transactional()
	@Override
	public List<Purchase_Db> getOrderDetails(int user_id) throws OlxException {
		UserDetails userDetails = new UserDetails();
		System.out.println("1");
		userDetails.setUser_id(user_id);

		Query query = entityManager.createQuery("select c from Purchase_Db c where userDetails.user_id=?",
				Purchase_Db.class);
		query.setParameter(0, userDetails.getUser_id());

		List<Purchase_Db> order = query.getResultList();
		if (order != null) {
			System.out.println("data available in orders");
			System.out.println(order);
		}
		return order;
	}

	@Override
	public List geCartDetails(int user_id) throws OlxException {
		UserDetails userDetails = new UserDetails();
		System.out.println("in getcartDetails");
		userDetails.setUser_id(user_id);

		Query query = entityManager.createQuery("select c from Cart c where userDetails.user_id=?", Cart.class);
		query.setParameter(0, userDetails.getUser_id());

		List<Cart> cart = query.getResultList();
		if (cart != null) {
			System.out.println("data available in cart");
			System.out.println(cart);
		}
		return cart;

	}

	@Transactional()
	@Override
	public int buyFromCart(UserDetails userDetails) throws OlxException {
		int flag = 0;
		System.out.println("inside buy from cart user check dao");
		Query query = entityManager.createQuery(
				"select u.user_id from UserDetails u where u.contact_number=? and u.password=? and u.user_id=?");// here
																													// LoginDetails
																													// is
																													// class
																													// name
																													// and
																													// username
																													// and
																													// password
																													// is
																													// class
																													// variables
		query.setParameter(0, userDetails.getContact_number());// starts from 0;
		query.setParameter(1, userDetails.getPassword());
		query.setParameter(2, userDetails.getUser_id());
		// System.out.println("Result" + query.getSingleResult());

		List<Object[]> l = query.getResultList();

		if (l.isEmpty() == false) {
			System.out.println("user available");
			System.out.println("payment processing of cart items");
			UserDetails uDetails = getUserDetails(userDetails.getUser_id());
			Query queryCart = entityManager.createQuery("select c from Cart c where c.userDetails.user_id=?");
			queryCart.setParameter(0, userDetails.getUser_id());

			List<Cart> listCartItems = queryCart.getResultList();

			Purchase_Db db = new Purchase_Db();
			if (listCartItems != null) {
				for (Cart c : listCartItems) {
					/*db.setItemDetails(c.getItemDetails());*/
					db.setItem_id(c.getItemDetails().getItem_id());
					db.setItem_name(c.getItemDetails().getItem_name());
					db.setYears_of_usage(c.getItemDetails().getYears_of_usage());
					db.setItem_image(c.getItemDetails().getItem_image());
					db.setPrice(c.getItemDetails().getPrice());
					
					db.setCategory_id(c.getItemDetails().getItemCategory().getCategory_id());
					db.setCategory_name(c.getItemDetails().getItemCategory().getCategory_name());
					
					db.setUserDetails(c.getUserDetails());
					Purchase_Db purchase_Db = entityManager.merge(db);
					
					Query soldItemQuery = entityManager.createQuery("DELETE FROM Seller_Db s where s.itemDetails.item_id=?");																									// all
					soldItemQuery.setParameter(0, c.getItemDetails().getItem_id()).executeUpdate();
					if (soldItemQuery != null) {
						System.out.println("items SOLD");
					}

					Query removeItem = entityManager.createQuery("DELETE FROM ItemDetails i where i.item_id=?");// to remove all
					removeItem.setParameter(0,c.getItemDetails().getItem_id()).executeUpdate();
					if (removeItem != null) {
						System.out.println("Ad removed from items table");
					}

				}
			}

			System.out.println("payment done");

			Query q = entityManager.createQuery("DELETE FROM Cart c where c.userDetails.user_id=?");// to remove all
																									// items of that
																									// user from cart
																									// after placing
																									// order
			q.setParameter(0, userDetails.getUser_id()).executeUpdate();

			System.out.println("items removed from cart");
			
			

			flag = 1;

		} else {
			System.out.println("User not available");
			flag = 0;

		}

		return flag;
	}

	@Transactional()
	@Override
	public int sellItem(ItemDetails itemDetails, UserDetails userDetails) throws OlxException {
		System.out.println("in sellItemDao");
		int flag = 0;
		ItemDetails itemDetails2 = entityManager.merge(itemDetails);// this is for uploading item to itemtable

		Seller_Db seller_Db = new Seller_Db();

		int cat_id = itemDetails.getItemCategory().getCategory_id();
		Query queryUser = entityManager.createQuery("select u from UserDetails u where  u.user_id=?");
		queryUser.setParameter(0, userDetails.getUser_id());// fetching user details by id

		userDetails = (UserDetails) queryUser.getSingleResult();// fetching user details and saving to userdetails

		System.out.println(userDetails);
		System.out.println("----------------------------------------------------");
		System.out.println(itemDetails2);

		seller_Db.setUserDetails(userDetails);// below both is for setting to seller_Db table values(columns)
		seller_Db.setItemDetails(itemDetails2);
		System.out.println(itemDetails2);
		Seller_Db s_db = entityManager.merge(seller_Db);
		System.out.println(s_db);
		if (s_db != null) {
			System.out.println("successfully uploaded to seller_db......");
			System.out.println("item successfully uploaded to sell item page and itemDetails");
			if (itemDetails2 != null) {
				System.out.println("flag---->1");
				flag = 1;
			}
		}
		return flag;
	}

	@Transactional(readOnly = true)
	@Override
	public List getMyAds(UserDetails userDetails) throws OlxException {

		Query query = entityManager.createQuery("select s from Seller_Db s where s.userDetails.user_id=?",
				Seller_Db.class);
		query.setParameter(0, userDetails.getUser_id());

		List<Cart> ad = query.getResultList();
		if (ad != null) {
			System.out.println("data available in AD table");
			System.out.println(ad);
		}
		return ad;

	}

}
