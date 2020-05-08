package com.compile.compiletest.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.compile.compiletest.config.app.DBConfig;
import com.compile.compiletest.config.app.MyBatisConfig;

@Configuration
@EnableAspectJAutoProxy
@ComponentScan({"com.compile.compiletest.service", "com.compile.compiletest.repository"})
@Import({DBConfig.class, MyBatisConfig.class})
public class AppConfig {

}
