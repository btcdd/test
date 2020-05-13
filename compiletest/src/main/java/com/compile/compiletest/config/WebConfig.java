package com.compile.compiletest.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.compile.compiletest.config.web.MessageConfig;
import com.compile.compiletest.config.web.MvcConfig;
import com.compile.compiletest.config.web.SecurityConfig;

@Configuration
@EnableAspectJAutoProxy
@ComponentScan("com.compile.compiletest.controller")
@Import({MvcConfig.class, SecurityConfig.class,MessageConfig.class})
public class WebConfig {
	 
}