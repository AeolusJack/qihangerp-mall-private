package cn.qihangerp.response;

import lombok.Data;

@Data
public class UserInfoResponse {
    private String token;
    private String username;
    private String mobile;
    private Long userId;
}
