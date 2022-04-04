package com.tudor.todolistapp.Aspects;

public aspect Security {

    pointcut nameValidation(String u): execution(* com.tudor.todolistapp.model.User.setName(String)) &&args(u);
    before(String u): nameValidation(u){
        if (u.length() > 20) {
            throw new RuntimeException("Name is too long");
        }
        if (u.length() < 1) {
            throw new RuntimeException("Name can't be null");
        }
    }

    pointcut usernameValidation(String u): execution(* com.tudor.todolistapp.model.User.setLoginName(String)) &&args(u);
    before(String u): usernameValidation(u){
        if (u.length() < 1) {
            throw new RuntimeException("Username can't be null");
        }
    }

    pointcut passwordValidation(String u): execution(* com.tudor.todolistapp.model.User.setPassword(String)) &&args(u);
    before(String u): passwordValidation(u){
        char[] chars = u.toCharArray();
        StringBuilder sb = new StringBuilder();
        for (char c : chars) {
            if (Character.isDigit(c)) {
                sb.append(c);
            }
        }
        if (sb.length() == 0) {
            throw new RuntimeException("Password must contain at least one digit");
        }
        if (u.length() < 1) {
            throw new RuntimeException("Please enter password");
        }
    }

    pointcut usernameValidationLogin(Object o): args(o) && this(com.tudor.todolistapp.controller.UserController) ;
    after(Object o):usernameValidationLogin(o){
        if (thisJoinPoint.toString().contains("loginForm(Model)")) {
            System.out.println("Please enter your credentials on the login page!");
        }
    }

    pointcut checkIfLoggedIn(): execution(* com.tudor.todolistapp.controller.UserController.logindo(..));
    after() returning(Object r):checkIfLoggedIn(){
        if (r.toString().contains("login")) {
            System.out.println("User could not found. Please try again..");
        } else if (r.toString().contains("redirect:addTask?act=taskpage")) {
            System.out.println("Logged in successfully!");
        }
    }

    pointcut LogoutLog(): execution(* com.tudor.todolistapp.controller.UserController.logout(..));
    after() returning(Object r):LogoutLog(){
        if (r.toString().contains("redirect:index?act=log")) {
            System.out.println("User logged out successfully!");
        }
    }
}




