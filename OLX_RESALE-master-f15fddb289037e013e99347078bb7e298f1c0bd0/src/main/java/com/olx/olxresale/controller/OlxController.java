package com.olx.olxresale.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.olx.olxresale.exception.OlxException;
import com.olx.olxresale.hib.service.IOlx;
import com.olx.olxresale.model.Cart;
import com.olx.olxresale.model.ItemDetails;
import com.olx.olxresale.model.UserDetails;

@Controller
public class OlxController {
	@Resource(name = "olxHbService")
	IOlx olxService;
	// IOlxItem olxItem;

	
	
	//REDIRECTING TO HOME PAGE, RECEIVES REDIRECT REQUEST FROM OTHER CONTROLLER
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage(ModelAndView modelAndView) throws OlxException {

		modelAndView.setViewName("homepage");
		List<ItemDetails> list = olxService.getItemDetails();
		System.out.println("-------------->" + list + "");

		modelAndView.addObject("itemList", list);

		return modelAndView;
	}

	
	//USER FOR LOGIN-->ONCE LOGIN IS DONE IT REDIRECTS TO "/home" CONTROLLER.
	@RequestMapping(value = "/LoginController", method = RequestMethod.POST)
	public ModelAndView login(UserDetails userDetails, ModelAndView modelAndView, HttpServletRequest request) {
		HttpSession session = request.getSession();

		int flag = 0;
		try {
			flag = olxService.checkUserDetails(userDetails);

			if (flag == 1) {
				System.out.println("user matched");

				session.setAttribute("user", userDetails.getUser_id());

				System.out.println(userDetails.getUser_id());

				/*
				 * modelAndView.setViewName("homepage"); List<ItemDetails> list =
				 * olxService.getItemDetails(); System.out.println("-------------->" + list +
				 * "");
				 * 
				 * modelAndView.addObject("itemList", list);
				 */
				modelAndView.setViewName("redirect:/app/home");//THIS IS REDIRECT REQ SENT TO /home

			} else {
				System.out.println("wrong credentials");
				modelAndView.addObject("message", "wrong credentials");
				modelAndView.setViewName("homepage");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return modelAndView;
	}

	
	//USED FOR SIGNUP
	@RequestMapping(value = "/SignupController", method = RequestMethod.POST)
	public ModelAndView signup(UserDetails userDetails, ModelAndView modelAndView, HttpServletRequest request)
			throws Exception {

		int count;
		try {
			/* modelAndView.setViewName("login"); */
			modelAndView.setViewName("homepage");
			List<ItemDetails> list = olxService.getItemDetails();
			modelAndView.addObject("itemList", list);

			count = olxService.signUp(userDetails);

			if (count > 0) {

				modelAndView.addObject("message", "Signup was successful, Kindly login for your session");
			} else {
				modelAndView.setViewName("success");
				modelAndView.addObject("error", "Signup was not successful");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			modelAndView.setViewName("success");
			modelAndView.addObject("error", e.getMessage());
		}

		return modelAndView;
	}

	
	//THIS CONTROLLER IS CALLED WHENEVER AN ITEM IS CLICKED IN HOMEPAGE AND DISPLAYS CONTENT IN "VIEWITEM.JSP PAGE"
	@RequestMapping("/ItemClickController/{itemId}")
	public ModelAndView displayItem(@PathVariable("itemId") Integer itemId, ModelAndView modelAndView)
			throws OlxException {
		System.out.println("check");
		ItemDetails itemDetails = olxService.getItemDetails(itemId);
		if (itemDetails != null) {
			modelAndView.setViewName("viewitem");
			modelAndView.addObject("itemDisplay", itemDetails);
			System.out.println("int itemCLickController");
			System.out.println("got item details");
		} else {
			modelAndView.setViewName("success");
			modelAndView.addObject("error", "data not available");
		}
		return modelAndView;
	}

	
	//THIS CONTROLLER IS CALLED FROM -->>>"VIEWITEM.JSP PAGE"<<-- IT HAS GOT 2 ACTIONS BUY NOW AND ADD TO CART
	//WHEN BUYNOW ACTION IS CLICKED ON VIEWITEM.JSP  PAGE-->IT DISPLAYS THAT ITEM CLICKED (CONTENT) IN BUYITEM.JSP PAGE
	//WHEN ADD TO CART ACTION IS CLICKED-->IT ADDS ITEM TO CART DETAILS( fn()==>addCartDetails(userDetails,itemDetails,cart) REDIRECTS TO HOME(/HOME) CONTROLLER
	
	@RequestMapping(value = "/UserActionController", method = RequestMethod.POST)
	public ModelAndView userAction(ItemDetails itemDetails, ModelAndView modelAndView, HttpSession session,
			String userAction, int item_id) throws OlxException {
		System.out.println("1");
		int user_id = (int) session.getAttribute("user");
		System.out.println("session user id-->" + user_id);
		UserDetails userDetails = new UserDetails();
		userDetails.setUser_id(user_id);

		UserDetails uDetails = olxService.getUserDetails(user_id);
		ItemDetails details = olxService.getItemDetails(item_id);

		if (userAction.equals("Buy Now")) {
			if (details != null) {
				modelAndView.setViewName("buyitem");
				modelAndView.addObject("itemDisplay", details);
				modelAndView.addObject("userDisplay", uDetails);
				System.out.println("int UserActionController-Buy Now");
				System.out.println("got item details");
			} else {
				modelAndView.setViewName("success");
				modelAndView.addObject("error", "data not available");
			}
		} else {
			Cart cart = new Cart();
			Cart cartDetails = olxService.addCartDetails(userDetails, itemDetails, cart);
			if (details != null) {

				if (cartDetails != null) {
					System.out.println("int UserActionController-Add To Cart");
					System.out.println("got item details");
					modelAndView.setViewName("redirect:/app/home");

				} else {
					modelAndView.setViewName("success");
					modelAndView.addObject("error", "data not available");
				}
			} else {
				modelAndView.setViewName("success");
				modelAndView.addObject("error", "item cant be added to cart");
			}
		}
		return modelAndView;
	}

	
	//IT RECEIVES REQ FROM DIFFERENT PAGES(CART PAGE AND BUYITEM PAGE)
	//IF CART PAGE SENDS BUY REQ-->IT BUYS ALL ITEM IN CART AND DELETES ALL ITEMS IN CART AND IT REDIRECTS TO "/OrderDetailsController"
	//IF BUY ITEM SENDS BUY REQ-->IT CHECKS PAYMENT AND BUYS ITEM AND STORES IN DB AND IT REDIRECTS TO "/OrderDetailsController"
	 
	@RequestMapping(value = "/BuyProductController", method = RequestMethod.POST)
	public ModelAndView buyProduct(ModelAndView modelAndView, HttpSession session, ItemDetails itemDetails,
			UserDetails userDetails, int user_id, int item_id, String buyAction) throws OlxException {
		System.out.println("inside buy product controller");

		if (buyAction.equals("buyCartItem")) {
			int flag = olxService.buyFromCart(userDetails);
			if (flag == 1) {
				System.out.println("payment successful");
				// ---->go to tracking order pg
				/*
				 * List orders = olxService.getOrderDetails(user_id);
				 * modelAndView.setViewName("orders"); modelAndView.addObject("order", orders);
				 */

				modelAndView.setViewName("redirect:/app/OrderPage");

			} else {
				System.out.println("wrong credentials");
				modelAndView.setViewName("redirect:/app/CartPage");
				
			}

		} else {
			UserDetails uDetails = olxService.getUserDetails(user_id);
			ItemDetails details = olxService.getItemDetails(item_id);

			System.out.println(details);
			System.out.println(uDetails);
			if (buyAction.equals("Pay")) {
				System.out.println("inside pay in buyproduct controller");

				int flag = olxService.checkPayment(userDetails, itemDetails);
				if (flag == 1) {
					System.out.println("payment successful");
					// ---->go to tracking order pg
					/*
					 * List orders = olxService.getOrderDetails(user_id);
					 * modelAndView.setViewName("orders"); modelAndView.addObject("order", orders);
					 */

					modelAndView.setViewName("redirect:/app/OrderPage");
				} else {
					System.out.println("enter correct credentials");
					modelAndView.setViewName("buyitem");
					modelAndView.addObject("message", "enter correct credentials");
					modelAndView.addObject("itemDisplay", details);
					modelAndView.addObject("userDisplay", uDetails);
				}

			} else {

				// continue shopping button
				modelAndView.setViewName("redirect:/app/home");
			}
		}
		return modelAndView;

	}

	/*@RequestMapping(value = "/OrderDetailsController", method = RequestMethod.GET) // getting redirected to this
																					// controller by
																					// butProductController
	public ModelAndView corderdetails(ModelAndView modelAndView, HttpSession session) throws OlxException {
		System.out.println("inside buy orderDetails controller");
		int user_id = (int) session.getAttribute("user");
		List orders = olxService.getOrderDetails(user_id);
		modelAndView.setViewName("orders");
		modelAndView.addObject("order", orders);

		return modelAndView;

	}
*/
	
	//
	@RequestMapping(value = "/OrderPage", method = RequestMethod.GET)
	public ModelAndView myOrders(ModelAndView modelAndView, HttpSession session, ItemDetails itemDetails,
			UserDetails userDetails) throws OlxException {
		int user_id = (int) session.getAttribute("user");
		System.out.println("session user id-->" + user_id);

		userDetails.setUser_id(user_id);

		// ---->go to tracking order pg
		List orders = olxService.getOrderDetails(user_id);
		modelAndView.setViewName("orders");
		modelAndView.addObject("order", orders);
		return modelAndView;
	}

	
	//GETTING THE CART DETAILS AND DISPLAYING IT IN CART PAGE 
	@RequestMapping(value = "/CartPage", method = RequestMethod.GET)
	public ModelAndView myCart(ModelAndView modelAndView, HttpSession session, ItemDetails itemDetails,
			UserDetails userDetails) throws OlxException {
		int user_id = (int) session.getAttribute("user");
		System.out.println("session user id-->" + user_id);

		userDetails.setUser_id(user_id);

		// ---->go to cart pg
		List cart = olxService.geCartDetails(user_id);
		modelAndView.setViewName("cart");
		modelAndView.addObject("cart", cart);
		return modelAndView;
	}

	
	//GETTING THE ADS DETAILS AND DISPLAYING IT ON AD PAGE
	@RequestMapping(value = "/MyAdsPage", method = RequestMethod.GET)
	public ModelAndView goToSoldPage(ModelAndView modelAndView, HttpSession session, ItemDetails itemDetails,
			UserDetails userDetails) throws OlxException {
		int user_id = (int) session.getAttribute("user");
		System.out.println("redirecting to sold items page");

		userDetails.setUser_id(user_id);

		// ---->go to cart pg
		List ad = olxService.getMyAds(userDetails);
		modelAndView.setViewName("AdPage");
		modelAndView.addObject("ad", ad);
		return modelAndView;
	}

	@RequestMapping(value = "/ContinueShopping", method = RequestMethod.POST)
	public ModelAndView continueShopping(ModelAndView modelAndView) throws OlxException {
		System.out.println("inside buy product controller");

		/*
		 * modelAndView.setViewName("homepage");
		 * 
		 * List<ItemDetails> list = olxService.getItemDetails();
		 * 
		 * modelAndView.addObject("itemList", list);
		 * 
		 * return modelAndView;
		 */
		modelAndView.setViewName("redirect:/app/home");
		return modelAndView;

	}

	
	//WHEN SELL BUTTON IS CLICKED ON HEADER, IT DISPLAY SELL PAGE
	@RequestMapping(value = "/SellPage", method = RequestMethod.GET)
	public ModelAndView sellPage(ModelAndView modelAndView) {
		System.out.println("redirecting to sell page--------------------");
		modelAndView.setViewName("sell");
		return modelAndView;
	}

	
	//WHEN SELL BUTTON IS CLICKED ON SELL PAGE, IT STORES PRODUCT DETAILS IN SELLER DB AND REDIRECTS TO HOME PAGE
	@RequestMapping(value = "/SellItem", method = RequestMethod.POST)
	public ModelAndView sell(ModelAndView modelAndView, HttpSession session, ItemDetails itemDetails)
			throws OlxException {
		System.out.println("in SellItem controller");
		int user_id = (int) session.getAttribute("user");
		UserDetails userDetails = new UserDetails();
		userDetails.setUser_id(user_id);
		int flag = olxService.sellItem(itemDetails, userDetails);
		if (flag == 1) {
			System.out.println("got details from sellItem Dao and successfull");
			/*
			 * modelAndView.setViewName("homepage");
			 * 
			 * List<ItemDetails> list = olxService.getItemDetails();
			 * 
			 * modelAndView.addObject("itemList", list);
			 */
			modelAndView.setViewName("redirect:/app/home");
			return modelAndView;
		} else {
			modelAndView.setViewName("sell");
			System.out.println("got details from sellItem Dao and Not successfull");

			modelAndView.addObject("message", "Item Not Posted");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/LogoutController", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, ModelAndView modelAndView) throws OlxException {
		request.getSession().invalidate();
		modelAndView.setViewName("redirect:/app/home");
		return modelAndView;
	}

	public OlxController() {
		// TODO Auto-generated constructor stub
	}

}
