package com.chetraseng.sunrise_task_flow_api.spec;

import com.chetraseng.sunrise_task_flow_api.model.TaskModel;
import com.chetraseng.sunrise_task_flow_api.model.TaskStatus;
import com.chetraseng.sunrise_task_flow_api.model.Priority;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;

public class TaskSpec {

  public static Specification<TaskModel> containsTitle(String title) {
    return (root, query, cb) ->
        cb.like(cb.lower(root.get("title")), "%" + title.toLowerCase() + "%");
  }

  public static Specification<TaskModel> equalProjectId(Long projectId) {
    return (root, query, cb) -> cb.equal(root.get("project").get("id"), projectId);
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Exercise 4: Specification Methods
  // ═══════════════════════════════════════════════════════════════════════════

  // TODO: hasStatus(TaskStatus status)
  // Filter tasks by their status enum
  // Hint: return (root, query, cb) -> cb.equal(root.get("status"), status);

  // TODO: hasPriority(Priority priority)
  // Filter tasks by their priority enum

  // TODO: dueBefore(LocalDate date)
  // Filter tasks with dueDate before the given date
  // Hint: Use cb.lessThan(root.get("dueDate"), date)

  // TODO: hasLabel(Long labelId)
  // Filter tasks that have a specific label — this one is challenging!
  // Hint: You need to JOIN the "labels" collection and filter by label ID
  //   return (root, query, cb) -> {
  //       var labelJoin = root.join("labels");
  //       return cb.equal(labelJoin.get("id"), labelId);
  //   };
}
