<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Permission Managerment System</title>
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/multi-select.css" type="text/css"/>
    <style>
        .profile-dropdown {
            position: absolute;
            top: 10px;
            right: -100px;
            padding-top: 4px;
            height: 60px;
            cursor: pointer;
            display: inline-block;
            /*position: relative;*/
            background: #f2f2f2;
            margin: auto;
            font-weight: bold;
            font-size: 1.3rem;
            border-radius: 3px;
            -webkit-user-select: none;
            /* Chrome all / Safari all */
            -moz-user-select: none;
            /* Firefox all */
            -ms-user-select: none;
            /* IE 10+ */
            user-select: none;
            /* Likely future */
        }

        .profile-dropdown * {
            -webkit-user-select: none;
            /* Chrome all / Safari all */
            -moz-user-select: none;
            /* Firefox all */
            -ms-user-select: none;
            /* IE 10+ */
            user-select: none;
            /* Likely future */
        }

        .profile-dropdown input[type="checkbox"] {
            display: none;
        }

        .profile-dropdown input[type="checkbox"]:checked ~ ul {
            display: block;
            animation: pulse 0.5s;
        }

        .profile-dropdown input[type="checkbox"]:checked ~ img {
            background: orange;
        }

        .profile-dropdown input[type="checkbox"]:checked ~ label {
            background: orange;
        }

        .profile-dropdown input[type="checkbox"]:checked ~ label i {
            color: #f2f2f2;
        }

        .profile-dropdown input[type="checkbox"]:checked ~ label:after {
            content: '';
            position: absolute;
            top: 100%;
            right: calc(50% - 10px);
            display: block;
            border-style: solid;
            border-width: 7px 10px 0 10px;
            border-color: orange transparent transparent transparent;
            width: 0;
            height: 0;
        }

        .profile-dropdown img {
            display: inline-block;
            background: #d9d9d9;
            height: 2.5rem;
            vertical-align: middle;
            margin-right: 1rem;
            margin: 0.5rem 0.75rem 0.5rem 0.5rem;
            border-radius: 50%;
        }

        .profile-dropdown span {
            display: inline-block;
            vertical-align: sub;
            width: 125px;
            margin-right: 2rem;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .profile-dropdown ul {
            display: none;
            list-style: none;
            padding: 0;
            marrgin: 0;
            background: #fff;
            position: absolute;
            top: 100%;
            right: 0;
            width: 100%;
            border-radius: 3px;
        }

        .profile-dropdown ul li a {
            display: block;
            padding: 0.75rem 1rem;
            text-decoration: none;
            color: #737373;
            font-size: 1rem;
        }

        .profile-dropdown ul li a i {
            font-size: 1.3rem;
            vertical-align: middle;
            margin: 0 0.75rem 0 -0.25rem;
        }

        .profile-dropdown ul li a:hover {
            background: #e5e5e5;
        }

        .profile-dropdown ul li:first-child a:hover {
            border-radius: 3px 3px 0 0;
        }

        .profile-dropdown ul li:last-child a:hover {
            border-radius: 0 0 3px 3px;
        }

        .profile-dropdown > label {
            position: relative;
            height: 3.5rem;
            display: block;
            text-decoration: none;
            background: transparent;
            color: #333;
            box-sizing: border-box;
            padding: 0.9rem;
            float: right;
            border-radius: 0 3px 3px 0;
        }

        .profile-dropdown > label i {
            color: #b2b2b2;
            font-size: 1.75rem;
        }

        .profile-dropdown:after {
            content: '';
            display: table;
            clear: both;
        }

        .container_avatar {
            width: 80%;
            margin: 4rem auto 2rem;
        }

        .container_avatar .half {
            width: 50%;
            float: left;
            margin-bottom: 2rem;
        }

        .container_avatar:after {
            content: '';
            display: table;
            clear: both;
        }

    </style>
</head>
<body>
<div class="container" style="    min-height: 100%;
    min-width: 100%;">
    <div class="row" style="height: 100%;position:absolute;width: 100%;">
        <%-- header start here --%>
        <div class="col-md-12" style="position: absolute;
    width: 100%;
    height: 80px;background-color: #2a2b2b;color: #ffffff;">
            <div class="row">
                <div class="col-md-3" style="    margin-top: 18px;
    margin-left: 20px;
    font-size: 18px;
    font-weight: bold;
    border: 2px solid #c36726f0;
    border-radius: 4px;
    padding: 6px;
    max-width: 260px;
    height: 40px;">
                    Permission Control System
                </div>
                <div class="col-md-9">
                    <div class="container_avatar">
                        <div class="half">
                            <label for="profile2" class="profile-dropdown">
                                <input type="checkbox" id="profile2">
                                <img src="https://cdn0.iconfinder.com/data/icons/avatars-3/512/avatar_hipster_guy-512.png"
                                     alt="avatar"/>
                                <span style="color: #2a2b2b;">${username}</span>
                                <label for="profile2"><i class="mdi mdi-menu"></i></label>
                                <ul style="z-index: 9;">
                                    <li><a style="cursor: pointer" href="#"><i class="mdi mdi-account"></i>
                                        Account
                                    </a>
                                    </li>
                                    <li><a style="cursor: pointer" href="#"><i class="mdi mdi-settings"></i>
                                        Settings
                                    </a>
                                    </li>
                                    <li><a style="cursor: pointer" href="${pageContext.request.contextPath}/logout">
                                        <i class="mdi mdi-logout"></i>Logout</a>
                                    </li>
                                </ul>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- header end here --%>

        <div class="col-md-12" style="position: absolute;
    top: 80px;height: calc(100% - 80px);">
            <div class="row" style="height: 100%;">
                <div class="col-md-2" style="margin-left: -18px;background-color: #ebf0f0;">
                    <ul class="list-group">
                        <li class="list-group-item"
                            style="cursor: pointer;background-color: #ebf1f0;width: calc(100% + 15px);font-weight: bold">
                            <a style="text-decoration: none;color: #2a2b2b;" href="#">Projects</a>
                        </li>
                        <li class="list-group-item"
                            style="cursor: pointer;background-color: #ebf1f0;width: calc(100% + 15px);font-weight: bold">
                            <a style="text-decoration: none;color: #2a2b2b;" href="#">Users</a>
                        </li>
                        <li class="list-group-item"
                            style="cursor: pointer;background-color: #ebf1f0;width: calc(100% + 15px);font-weight: bold">
                            <a style="text-decoration: none;color: #2a2b2b;" href="${pageContext.request.contextPath}/roles">Roles</a>
                        </li>
                        <li class="list-group-item"
                            style="cursor: pointer;background-color: #ebf1f0;width: calc(100% + 15px);font-weight: bold">
                            <a style="text-decoration: none;color: #2a2b2b;" href="#">Settings</a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-10">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Role</th>
                            <th>Users</th>
                            <th>Modules</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${roles}" var="role">
                            <tr id="${role.id}">
                                <th scope="row">${role.id}</th>
                                <td>${role.name}</td>
                                <td>
                                    <button type="button" class="btn btn-outline-warning"
                                            data-toggle="modal" data-modal-type="users"
                                            data-target="#multi_purpose_modal">
                                        Users
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-outline-success"
                                            data-toggle="modal" data-modal-type="modules"
                                            data-target="#multi_purpose_modal">
                                        Modules
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary"
                                            data-toggle="modal" data-modal-type="edit"
                                            data-target="#multi_purpose_modal">
                                        Edit
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger"
                                            data-toggle="modal" data-modal-type="delete"
                                            data-target="#multi_purpose_modal">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="multi_purpose_modal" tabindex="-1" role="dialog" aria-labelledby="multi_purpose_modal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="multi_purpose_modal_label">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.multi-select.js"></script>
<script>

    $('[data-target="#multi_purpose_modal"]').on('click',function(){
        var token = $('#_csrf').attr('content');
        var header = $('#_csrf_header').attr('content');
        var selected_modal = $("#multi_purpose_modal");
        var role_id = selected_modal.find('tr:parents(0)').attr('role_id');

        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/roles/load',
            data :
                {
                    type : $(this).attr('data-modal-type'),
                    role_id : role_id},
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                selected_modal.find('.modal-body').html('');
                selected_modal.find('.modal-body').html(data);
                selected_modal.find('#role_users').multiSelect();
                <%--selected_modal.find('.modal-title').text('${header}');--%>
                // console.log(selected_modal.find('form'));

                <%--$.ajax({--%>
                    <%--type: "POST",--%>
                    <%--url: '${pageContext.request.contextPath}/roles/process',--%>
                    <%--data : {type : selected_modal.attr('data-modal-type')},--%>
                    <%--beforeSend: function(xhr) {--%>
                        <%--xhr.setRequestHeader(header, token);--%>
                    <%--},--%>
                    <%--success: function(data) {--%>
                        <%--console.log(data);--%>
                    <%--},--%>
                    <%--error: function(request, status, error) {--%>
                        <%--console.log(error);--%>
                    <%--}--%>
                <%--});--%>
            },
            error: function(request, status, error) {
                console.log(error);
            }
        });
    });

</script>
</body>
</html>
