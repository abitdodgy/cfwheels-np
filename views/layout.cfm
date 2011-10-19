<cfparam name="pageTitle" default="Nested Properties Demo in CFWheels">
<cfoutput>
<html>
	<head>
		<title>#includeContent("pageTitle")#</title>
	</head>
	<body>
		#includeContent()#
	</body>
</html>
</cfoutput>