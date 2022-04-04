package com.tudor.todolistapp.Aspects;

import javax.servlet.http.HttpSession;

public aspect AddTaskAspect {

    pointcut checkIfTaskIsNewOrUpdate(HttpSession session): execution(* com.tudor.todolistapp.controller.TodoListController.saveOrUpdateAddedTask(..)) &&args(..,session);
    before(HttpSession session): checkIfTaskIsNewOrUpdate(session){
        Integer todoListId = (Integer) session.getAttribute("pTodoListId");
        if (todoListId == null) {
            System.out.println("Task created successfully");
        } else {
            System.out.println("Update executed successfully");
        }
    }

    pointcut taskTitleValidation(String u): execution(* com.tudor.todolistapp.model.TodoList.setTitle(String)) &&args(u);
    before(String u): taskTitleValidation(u){

        if (u.length() < 1) {
            throw new RuntimeException("Task name can't be null");
        }
    }

    pointcut assignedFieldValidation(String u): execution(* com.tudor.todolistapp.model.TodoList.setDescription(String)) &&args(u);
    before(String u): assignedFieldValidation(u){

        if (u.length() < 1) {
            throw new RuntimeException("Task assign field can't be null");
        }
    }

    pointcut dayValidation(String u): execution(* com.tudor.todolistapp.model.TodoList.setDay(String)) &&args(u);
    before(String u): dayValidation(u){

        if (u.length() < 1) {
            throw new RuntimeException("Please enter day deadline!");
        }
        if (Integer.parseInt(u) > 31 || Integer.parseInt(u) < 1) {
            throw new RuntimeException("Please enter a valid day!");
        }
    }

    pointcut monthValidation(String u): execution(* com.tudor.todolistapp.model.TodoList.setMonth(String)) &&args(u);
    before(String u): monthValidation(u){

        if (u.length() < 1) {
            throw new RuntimeException("Please enter month deadline!");
        }
        if (Integer.parseInt(u) > 12 || Integer.parseInt(u) < 1) {
            throw new RuntimeException("Please enter a valid month!");
        }
    }

    pointcut yearValidation(String y): execution(* com.tudor.todolistapp.model.TodoList.setYear(String)) &&args(y);
    before(String y): yearValidation(y){

        if (y.length() < 1) {
            throw new RuntimeException("Please enter year deadline!");
        }

    }

    pointcut statusValidation(String u): execution(* com.tudor.todolistapp.model.TodoList.setStatus(String)) &&args(u);
    before(String u): statusValidation(u){

        if (u.length() < 1) {
            throw new RuntimeException("Please enter task status!");
        }

    }

}
