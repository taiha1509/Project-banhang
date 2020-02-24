package com.laptrinhjavaweb.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
				.antMatchers("/Web/**","/api/**","/admin/login", "/single_product/**", "/Image/**", "/AdminRs/**","/Login/**", "/error/**", "/source/**" )
				.permitAll()
				.antMatchers("/admin/**").authenticated()
				.and()
				.logout()
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.logoutUrl("/perform_logout")
				.logoutSuccessUrl("/home")
				.permitAll()
				.and()
				.formLogin()
				.loginPage("/admin/login")
				.loginProcessingUrl("/perform_login")
				.defaultSuccessUrl("/admin/home")
				.failureUrl("/login?error=true")
				.permitAll();				
	}

	/**
	 * sử dụng thuật toán bcrypt để mã hóa mật khẩu
	 * 
	 * @return
	 */

	/**
	 * thực hiện tham chiếu tới bean "userDetailsService" trong Spring Container.
	 */
	@Autowired
	UserDetailsService userDetailsService;
	
	@Bean public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }
	


	/**
	 * hàm này thực hiện kết nối giữa 2 Beans(AuthenticationManager và UserDetailsService).
	 * Lí do phải kết nối 2 Beans này vì cần cho AuthenticationManager biết nơi để
	 * xác thực và lấy quyền của người dùng.
	 * @param auth thực ra khi dùng @Autowired thì auth là bean được spring quản lí và add tham chiếu tới.
	 * @throws Exception 
	 */
	@Autowired public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		// thực hiện gắn kết AuthenticationManager với UserDetailsService.  
		auth.userDetailsService(userDetailsService).passwordEncoder(new NormalPasswordEncoder());
	}
	

}
