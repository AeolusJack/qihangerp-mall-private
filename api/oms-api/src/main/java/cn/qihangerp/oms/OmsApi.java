package cn.qihangerp.oms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;

//@EnableDiscoveryClient
@EnableFeignClients(basePackages = "cn.qihangerp.oms")
@MapperScan("cn.qihangerp.oms.mapper")
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class OmsApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello oms-api!" );
        SpringApplication.run(OmsApi.class, args);
    }
//    @Value("${spring.datasource.url}")
//    private String dbUrl;
//
//    // 或者使用 Environment 对象
//    @Autowired
//    private Environment env;
//
//    public void someMethod() {
//        String dbUrl = env.getProperty("spring.datasource.url");
//        // 使用 dbUrl 进行后续操作
//    }
}
