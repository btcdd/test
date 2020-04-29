package com.compile.compiletest.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.compile.compiletest.config.web.MvcConfig;

@Configuration
@EnableAspectJAutoProxy
@ComponentScan("com.compile.compiletest.controller")
@Import(MvcConfig.class)
public class WebConfig {
	
}