package com.laptrinhjavaweb.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class HttpUtils {
	final public static String USER = "USER";
	final public static String ADMIN = "ADMIN";
	final public static String CART_NAME= "CART_NAME";
	final public static String SoLuongHang = "SoLuongHang";
	final public static String TOTAL_PRICE = "TOTAL_PRICE";
	private HttpUtils() {
	}

	@SuppressWarnings("unchecked")
	public static <T> T getSessionValue(final String name, final HttpServletRequest request) {
		HttpSession session = request.getSession();

		return (T) session.getAttribute(name);
	}

	public static boolean isSessionExits(final String name, final HttpServletRequest request) {
		HttpSession session = request.getSession();

		return (session.getAttribute(name) == null) ? false : true;
	}

	public static void setSessionValue(final String name, final Object value, final HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.setAttribute(name, value);
	}

}
