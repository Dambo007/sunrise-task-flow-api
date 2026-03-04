package com.chetraseng.sunrise_task_flow_api.repository;

import com.chetraseng.sunrise_task_flow_api.dto.TaskSummary;
import com.chetraseng.sunrise_task_flow_api.model.TaskModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<TaskModel, Long> {
  List<TaskModel> findAllByCompleted(Boolean completed);

  List<TaskModel> findAllByTitleContainingIgnoreCase(String title);

  List<TaskModel> findAllByCompletedAndTitleContainingIgnoreCase(Boolean completed, String title);

  List<TaskModel> findAllByCompletedOrderByCreatedAtDesc(Boolean completed);

  @Query("SELECT t FROM TaskModel t WHERE t.completed = false ORDER BY t.createdAt DESC")
  List<TaskModel> findAllByIncompleteOrderByCreatedAtDesc();

  @Query("SELECT t FROM TaskModel t WHERE t.title LIKE %:keyword% AND t.completed = :completed")
  List<TaskModel> search(@Param("keyword") String keyword, @Param("completed") Boolean completed);

  @Query("SELECT t FROM TaskModel t JOIN t.project p WHERE p.name = :projectName")
  List<TaskModel> findByProjectName(@Param("projectName") String projectName);

  @Query(value = "SELECT id, title, completed FROM tasks WHERE project_id = :pid",
          nativeQuery = true)
  List<TaskSummary> findSummariesByProject(@Param("pid") Long projectId);
}
