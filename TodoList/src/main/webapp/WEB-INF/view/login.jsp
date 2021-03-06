
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>

    <div>
        <jsp:include page="include/menu.jsp"/>
    </div>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
        <link href="static/css/style_login.css?version=51" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="simple_form">
            <s:url var="url_log_form" value="/logindo"/>
            <f:form action="${url_log_form}" modelAttribute="command" id="reg">
                <h1  style="color:red;">Login Form</h1>
                <c:if test="${error != null}">
                    <p id="error">${error}</p>
                </c:if>
                <f:input path="loginName" placeholder="Enter your username" id="box"/>

                </br>
                </br>

                <f:password path="password" placeholder="Enter your password" id="box"/>
                </br>
                </br>
                </br>
                <f:button id="butt">Login</f:button>
                <s:url var="url_registrationform" value="/reg_form"/>
                <h4 style="color: white">If you do not have an account <a href="${url_registrationform}">Register</a> Now!</h4>
            </f:form>

        </div>
        <<div id="footer">
            <footer>
                <jsp:include page="include/footer.jsp"/>
            </footer>
        </div>

    </body>
</html>
