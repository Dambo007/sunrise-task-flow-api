package com.chetraseng.sunrise_task_flow_api.dto;

import lombok.Data;

@Data
public class Pagination {
  private Integer size = 10;
  private Integer page = 0;
  private Long total;
  private Integer totalPage;
}
