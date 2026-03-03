package com.chetraseng.sunrise_task_flow_api.repository;

import com.chetraseng.sunrise_task_flow_api.model.TaskModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<TaskModel, Long> {
  List<TaskModel> findAllByCompleted(Boolean completed);

  List<TaskModel> findAllByTitleContainingIgnoreCase(String title);

  List<TaskModel> findAllByCompletedAndTitleContainingIgnoreCase(Boolean completed, String title);
}
