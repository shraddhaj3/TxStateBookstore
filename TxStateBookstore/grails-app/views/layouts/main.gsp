<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<script type="text/javascript">
			function clearSearchBox(e){
				if(e.value == "Enter Search Keyword Here"){
					e.value = "";
				}
				return true;
			}
			function setDefaultSearchText(e){
				var val = e.value;
				if(val == "" || val == " "){
					e.value = "Enter Search Keyword Here";
				}
				return true;
			}

			function showMenu(id){
				var elem = document.getElementById(id);
				elem.style.display='block';
			}

			function hideMenu(id){
				var elem = document.getElementById(id);
				elem.style.display='none';
			}
		</script>
		
		<div id="grailsLogo" role="banner" style="text-align: center;"><a href="http://txstate.edu"><asset:image src="grails_logo.png" alt="Grails" style="width:150px; height: auto;	" /></a>
		<font style="color: #800040; font-size: large; vertical-align: text-top;">ONLINE BOOKSTORE</font>
		</div>
		<hr/>	
		<div class="menu">
	        <ul>
	        	<g:if test="${request.getSession(false) && session.userName }">
		            <li><g:link controller="Index" action="Index"  class="home">Home</g:link></li>
		        </g:if>
	        	<li><a href="#">Contact Us</a></li>
	            <li><a href="#">Help</a></li>
	        	<g:if test="${request.getSession(false) && session.userName }">
		            <%--<li>
		                <a href="#">Manage Inventory<span class="arrow">&#9660;</span></a>
		 
		                <ul class="sub-menu" id="sm_manageInventory">
		                	<li><g:link controller="Book" action="create">View All Books</g:link></li>
		                	<li><g:link controller="Book" action="create">Add Book</g:link></li>
		                	<li><g:link controller="Book" action="create">View Waiting List for Book</g:link></li>
		                </ul>
		            </li>
		            <li><a href="#">Recommend Books for course</a></li>
		            <li><a href="#">Generate Reports</a></li>--%>
		            
		            <%--Show cart--%>
		            <li style="float: right; margin-right: 20px;font-size: small; ">
						<g:link class="cart" controller="Book" action="viewCart"><img  src="${assetPath(src:'shopping-cart.png')}" width="25px"></img></g:link>
					</li>
	            	<%--Show logged in user's name--%>
					<li style="float:right">
						<span>Hello, <b>
								${session.userName }
						</b><br/><a href="#">Account</a></span>
						
						<%--Show sub-menu for account --%>
						<ul class="sub-menu" id="sm_account">
							<li><g:link>View Past Orders</g:link></li>
							<li><g:link controller="User" action="edit" id="${session.userId }">Update Account Information</g:link></li>
							<li><g:link>Change Password</g:link></li>
							<li><g:link controller="User" action="logout">Logout</g:link></li>
						</ul>
					</li>
				</g:if>
	        </ul>
		</div>
		<g:if test="${request.getSession(false) && session.userName }">
		<div style="text-align: center;padding-top: 10px; width:100%">
			<g:form action="search" controller="Book" >
				<select name="searchBy" style="padding-right: 5px;margin-right: 5px;">
					<option id="searchByTitle" value="title">Title</option>
					<option id="searchByAuthor" value="author">Author</option>
					<option id="searchBySubject" value="subject">Subject</option>
					<option id="searchByIsbn" value="isbn">ISBN</option>
					<option id="searchByCourseNum" value="courseNumber">Course Number</option>
					<option id="searchByProfessor" value="professor">Professor</option>
				</select>
				<g:textField class="searchbox" name="keyword" maxlength="100" minLength="2" value="Enter Search Keyword Here" onClick="clearSearchBox(this);" onBlur="setDefaultSearchText(this);"/>
				<g:submitButton name="Search" value="Search" />
			</g:form>
		</div>	
		</g:if>
		
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
