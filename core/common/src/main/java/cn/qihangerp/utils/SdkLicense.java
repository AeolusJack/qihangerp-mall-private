package cn.qihangerp.utils;


import cn.qihangerp.utils.http.ExpressClient;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component
public class SdkLicense {
    @Value("${spring.application.name}")
    private String appName;
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    @PostConstruct
    public void startAuthorizationCheck() {
        scheduler.scheduleAtFixedRate(this::checkServerAuthorization, 0, 1, TimeUnit.HOURS);
    }
    @PostConstruct
    public void init() throws IOException {
        String uniqueID = UniqueIDGenerator.generateUniqueID();
//        System.out.println("Generated Unique ID: " + uniqueID);
        ExpressClient.getLicenseSdk(uniqueID,appName);
    }

    private void checkServerAuthorization() {
        try {
            String uniqueID = UniqueIDGenerator.generateUniqueID();
            log.info("Get License Unique ID: " + uniqueID);
            ExpressClient.getLicenseSdk(uniqueID,appName);
        } catch (Exception e) {
//            e.printStackTrace();
        }
    }

}
