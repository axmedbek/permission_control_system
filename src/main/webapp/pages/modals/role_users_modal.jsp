<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="#" method="post">
                <label for="role_users">Users</label>
                <select multiple="multiple" id="role_users" name="role_users[]">
                    <c:forEach items="${users}" var="user">
                        <option value='${user.id}'>${user.username}</option>
                    </c:forEach>
                </select>
            </form>
        </div>
    </div>
</div>