<%--
  Created by IntelliJ IDEA.
  User: axmedbek
  Date: 7/29/19
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <style>
        .login-btn__button {
            color: #fff;
            background-color: #f25638;
            border-color: #f25638;

        }

        .login-btn__button:hover {
            color: #fff;
            background-color: #f25638;
            border-color: #f25638;
        }

        .login-btn__button:active:focus {
            color: #fff;
            background-color: #f25638;
            border-color: #f25638;
        }
    </style>
</head>
<body>
<div class="container" style="    min-height: 100%;
    min-width: 100%;">
    <div class="row" style="height: 100%;">
        <div class="col-md-8" style="background-color: #F15738">
            <div style="    margin-top: 120px;
    text-align: center;
    color: white;
    font-size: 60px;
    font-family: monospace;
    font-weight: bold;">Permission Control System
            </div>
            <img style="margin-left: 210px;" src="${pageContext.request.contextPath}/assets/images/permission1.png"
                 alt="">
        </div>
        <div class="col-md-4" style="background-color: #282725">
            <div class="row" style="display: contents">
                <div class="col-md-12" style="    margin-top: 50%;
    font-size: 45px;
    color: #ffffff;
    text-align: center;
    font-family: monospace">Welcome
                </div>
                <div class="col-md-12" style="display: ${error != null ? 'block' : 'none'}">
                    <div class="alert alert-danger">${error}</div>
                </div>
                <div class="col-md-12" style="display: ${logout != null ? 'block' : 'none'}">
                    <div class="alert alert-success">${logout}</div>
                </div>
                <div class="col-m-12" style="margin-top: 2%">
                    <form action="${pageContext.request.contextPath}/login" class="was-validated" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" placeholder="Enter username"
                                   name="username">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                   name="pwd">
                        </div>
                        <div class="form-group form-check">
                            <label class="form-check-label" style="color: #ffffff;">
                                <input class="form-check-input" type="checkbox" name="remember"> I agree
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block login-btn__button">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>
