<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>TxState Online Bookstore</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			/*Added by Shraddha*/
			.side-sub-menu {
				font-style: italic;
				font-size: x-small;
				margin-left: 2em;
				
			}
			#status li .side-sub-menu  {
			    display: none;
			} 
			#status li:hover .side-sub-menu  {
			    z-index:1;
			   display: inline-block;
			} 
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		  <div id="status" role="complementary">
			<h1>Menu</h1>
			<ul>
				<g:if test="${session.user.role == 'faculty' }"><li><a href="${createLink(controller: 'Subject', action: 'index') }">Select Books for course</a></li></g:if>
				<g:if test="${session.user.role == 'admin' }">
				<li><a href="${createLink(controller: 'UserOrder', action: 'report') }">Generate Report</a></li>
					<li><a href="#">Manage Inventory</a>
		                <ul class="side-sub-menu" id="sm_manageInventory">
		                	<li><g:link controller="Book" action="index">View All Books</g:link></li>
		                	<li><g:link controller="Book" action="create">Add Book</g:link></li>
		                	<li><g:link controller="Book" action="index" id="">Modify Book</g:link></li>
		                	<li><g:link controller="Subject" action="create">Add Course</g:link></li>
		                	<li><g:link controller="WaitingUser" action="show1" >View Waiting List for Book</g:link></li>
		                </ul>
		        	</li>
				</g:if>
				
		        <li><a href="#">My Account</a>
	                <ul class="side-sub-menu" id="sm_manageInventory">
	                	<g:if test="${session.user.role!='admin' }"><li><g:link controller="UserOrder" action="pastOrders" id="${session.userId}"  >View Past Orders</g:link></li></g:if>
						<li><g:link controller="User" action="edit" id="${session.userId }">Update Account</g:link></li>
						<g:if test="${session.user.role == 'admin' }"><li><g:link controller="User" action="changePassword" id="${session.userId }">Change Password</g:link></li></g:if>
						<li><g:link controller="User" action="logout">Logout</g:link></li>
	                </ul>
		        </li>
				
			</ul>
			<!--  <h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>-->
		</div>
		<div id="page-body" role="main">			
			<!--  <p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>-->

			<!--  <div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>-->
			
		</div>
	</body>
</html>
