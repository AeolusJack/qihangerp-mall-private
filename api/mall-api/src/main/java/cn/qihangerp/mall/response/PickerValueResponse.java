package cn.qihangerp.mall.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class PickerValueResponse {
    @JsonProperty("value")
    private Long id;
    @JsonProperty("text")
    private String name;
}
