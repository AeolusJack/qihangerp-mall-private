package cn.qihangerp.ams;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.client.RestTemplate;

/**
 * Hello world!
 *
 */
@EnableDiscoveryClient
@ComponentScan(basePackages={"cn.qihangerp"})
//@MapperScan("cn.qihangerp.sys.api.mapper")
@SpringBootApplication
public class AmsApi
{
    public static void main( String[] args )
    {
        System.out.println( "Hello ams-api!" );
        SpringApplication.run(AmsApi.class, args);
    }

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
