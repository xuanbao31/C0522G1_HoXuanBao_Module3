<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 23/08/2022
  Time: 1:57 CH
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="http://localhost:8080/" language="java" %>--%>
<!DOCTYPE HTML>
<html>
    <style type="text/css">
        .login {
        height:180px; width:230px;
        margin:0;
        padding:10px;
        border:1px #CCC solid;
        }
        .login input {
        padding:5px; margin:5px
        }
    </style>
    <body>
        <form action="/login" method="post">
            <div class="login">
                <h2>Login</h2>
                <input type="text" name="username" size="30"  placeholder="username" />
                <input type="password" name="password" size="30" placeholder="password" />
                <input type="submit" value="Sign in"/>
            </div>
        </form>
    </body>
</html>