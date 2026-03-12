package com.chetraseng.sunrise_task_flow_api.dto;

import lombok.Data;

@Data
public class FilterTaskDto {
  private Long projectId;
  private String title;

  // ═══════════════════════════════════════════════════════════════════════════
  // Exercise 4: Add the following filter fields
  // ═══════════════════════════════════════════════════════════════════════════

  // TODO: Add 'status' field — TaskStatus
  // TODO: Add 'priority' field — Priority
  // TODO: Add 'dueBefore' field — java.time.LocalDate
  // TODO: Add 'labelId' field — Long
}
