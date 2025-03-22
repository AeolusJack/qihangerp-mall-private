package cn.qihangerp.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class UserInfo {
    private String token;
    @JsonProperty("nick_name")
    private String nickName;
    private String mobile;
    @JsonProperty("user_id")
    private Long userId;
    private String avatar;
}
