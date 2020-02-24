package com.laptrinhjavaweb.service;

import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

@Service
public class BaseService {
	@PersistenceContext
	protected EntityManager entityManager; // như là 1 database quản lí các entities.

	private static final int LIMIT = 5;

	protected long totalPages(long numberOfRecords) {
		return (numberOfRecords + LIMIT - 1) / LIMIT;
	}

	@SuppressWarnings("unchecked")
	protected <t> t executeListQuery(String jqpl, Class<?> clazz, Map<String, Object> parameters) {
		Query query = entityManager.createQuery(jqpl, clazz);
		for (Map.Entry<String, Object> entry : parameters.entrySet()) {
			if ("page".equals(entry.getKey()) || "limit".equals(entry.getKey()))
				continue;
			query.setParameter(entry.getKey(), entry.getValue());
		}
		if (parameters.containsKey("page") && !String.valueOf(parameters.get("page")).isEmpty()) {
			int limit = LIMIT;
			if (parameters.containsKey("limit"))
				limit = Integer.valueOf(String.valueOf(parameters.get("limit")));

			int pageNumber = Integer.valueOf(String.valueOf(parameters.get("page")));
			query.setFirstResult((pageNumber - 1) * limit);
			query.setMaxResults(limit);
		}
		return (t) query.getResultList();
	}

	@SuppressWarnings("unchecked")
	protected <t> t executeSingleQuery(String jqpl, Class<?> clazz, Map<String, Object> parameters) {
		Query query = entityManager.createQuery(jqpl, clazz);
		for (Map.Entry<String, Object> entry : parameters.entrySet()) {
			if ("page".equals(entry.getKey()))
				continue;
			query.setParameter(entry.getKey(), entry.getValue());
		}
		if (parameters.containsKey("page") && !String.valueOf(parameters.get("page")).isEmpty()) {
			int pageNumber = Integer.valueOf(String.valueOf(parameters.get("page")));
			query.setFirstResult((pageNumber - 1) * LIMIT);
			query.setMaxResults(LIMIT);
		}
		return (t) query.getSingleResult();
	}
}
