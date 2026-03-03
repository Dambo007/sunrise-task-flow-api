package com.chetraseng.sunrise_task_flow_api.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskModel {
  private Long id;
  private String title;
  private String description;
  private Boolean completed = false;
  private LocalDateTime createdAt = LocalDateTime.now();
}
