/*package com.olx.olxresale.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.olx.olxresale.exception.OlxException;
import com.olx.olxresale.hib.service.IOlxItem;
import com.olx.olxresale.model.ItemDetails;

@Component
public class ItemDao implements IOlxItem {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional(readOnly=true)
	@Override
	public List<ItemDetails> getItemDetails() throws OlxException {
		// TODO Auto-generated method stub
		TypedQuery<ItemDetails> query=entityManager.createQuery("select i from ItemDetails i",ItemDetails.class);
		System.out.println("inside itemDao-->items:"+query);
		List<ItemDetails> list=query.getResultList();

		return list;
	}
}
*/