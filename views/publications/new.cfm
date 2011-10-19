<cfoutput>

	#contentFor(pageTitle="Add Publication")#

	<h1>Add Publication</h1>

	<div>
		<cfif params.action EQ "edit" OR params.action EQ "update">
			#startFormTag(action="update", key=publication.id)#
		<cfelse>
			#startFormTag(action="create")#
		</cfif>

			<fieldset>
				<legend>Publication Details</legend>
				#textField(objectName="publication", property="name", label="Publication Name ")#
				#errorMessageOn(objectName="publication", property="name")#
			</fieldset>

			#submitTag(value="Save Publication")# #linkTo(controller="main", action="index", text="Back Home")#
		#endFormTag()#
	</div>

</cfoutput>