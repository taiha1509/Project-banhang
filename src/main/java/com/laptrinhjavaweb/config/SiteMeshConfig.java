package com.laptrinhjavaweb.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SiteMeshConfig extends ConfigurableSiteMeshFilter {
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder
		.addDecoratorPath("/", "/decorators/web.jsp")
		.addDecoratorPath("/home/*", "/decorators/web.jsp")
		// Exclude few paths from decoration.
        .addExcludedPath("/login")
        .addExcludedPath("/error/*")
        .addExcludedPath("/cart")
        .addExcludedPath("/checkout")
        .addExcludedPath("/contact")
        .addExcludedPath("/single_product")
		.addExcludedPath("/register")
		.addExcludedPath("/admin/**")
		.addExcludedPath("/admin")
		.addExcludedPath("/order");
	}
}
