package com.taskmanager.taskmanager_backend.task;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taskmanager.taskmanager_backend.entity.User;

public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findByUser(User user);
}
