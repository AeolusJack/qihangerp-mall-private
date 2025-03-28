package cn.qihangerp.response;

import lombok.Data;

@Data
public class LoginUserInfoResponse {
    private String token;
    private String username;
    private String nickname;
    private String headImg;
    private String mobile;
    private Long userId;
    private Integer businessType;//商务身份（10谈判人20商务）
}
