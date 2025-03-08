package cn.qihangerp.mall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//@EnableDiscoveryClient
//@EnableFeignClients(basePackages = "cn.qihangerp.openApi")
//@MapperScan("cn.qihangerp.openApi.mapper")
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class MallApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello mall-api!" );
        SpringApplication.run(MallApi.class, args);
    }

}
