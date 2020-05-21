package com.douzone.common.controller.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.douzone.common.controller.config.web.MVCConfig;
import com.douzone.common.controller.config.web.SecurityConfig;


@Configuration
@EnableAspectJAutoProxy
@ComponentScan(value= {"com.douzone.common.controller.main"})
@Import(value={MVCConfig.class, SecurityConfig.class})
public class WebConfig {
	
}
