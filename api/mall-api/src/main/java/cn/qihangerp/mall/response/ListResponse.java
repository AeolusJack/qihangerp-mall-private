package cn.qihangerp.mall.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class ListResponse<T> {
    @JsonProperty("current_page")
    private int currentPage=1;
    @JsonProperty("total")
    private int total;
    @JsonProperty("last_page")
    private int lastPage;
    @JsonProperty("per_page")
    private int perPage=15;
    @JsonProperty("data")
    private List<T> data = new ArrayList<>();
}
