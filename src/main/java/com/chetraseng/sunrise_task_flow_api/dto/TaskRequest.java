package com.chetraseng.sunrise_task_flow_api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskRequest {
  private String title;
  private String description;

  // ═══════════════════════════════════════════════════════════════════════════
  // Exercise 1: Add the following fields
  // ═══════════════════════════════════════════════════════════════════════════

  // TODO: Add 'projectId' field — Long
  // TODO: Add 'priority' field — Priority (import from model package)
  // TODO: Add 'status' field — TaskStatus (import from model package)
  // TODO: Add 'dueDate' field — java.time.LocalDate
}
