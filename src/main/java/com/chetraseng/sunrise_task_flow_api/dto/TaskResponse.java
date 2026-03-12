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
  private LocalDateTime createdAt;
  private String projectName;
  private Long projectId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Exercise 1: Add the following fields
  // ═══════════════════════════════════════════════════════════════════════════

  // TODO: Add 'status' field — TaskStatus (import from model package)
  // TODO: Add 'priority' field — Priority (import from model package)
  // TODO: Add 'dueDate' field — java.time.LocalDate
  // TODO: Add 'labelNames' field — List<String>
  // TODO: Add 'commentCount' field — int
}
