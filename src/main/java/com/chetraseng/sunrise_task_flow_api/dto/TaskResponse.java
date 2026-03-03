package com.chetraseng.sunrise_task_flow_api.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskResponse {
  private Long id;
  private String title;
  private String description;
  private Boolean completed;
  private LocalDateTime createdAt;
}
