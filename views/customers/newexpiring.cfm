<cfoutput>

	#contentFor(pageTitle="Add Customer with Expiring Subscription(s)")#

	<h1>Add Customer with <em>Expiring</em> Subscription(s)</h1>

	<p>In this example we will add a customer with an <strong>expiring subscription</strong>.</p>
	<p>We will use an additional expiration column (dateSelect()) that gets stored in the subscriptions (joiner) table.</p>

	<div>
		<cfif params.action EQ "edit" OR params.action EQ "update">
			#startFormTag(action="update", key=customer.id)#
		<cfelse>
			#startFormTag(action="createExpiring")#
		</cfif>

			<fieldset>
				<legend>Customer Details</legend>
				#textField(objectName="customer", property="name", label="Name ")#
				#errorMessageOn(objectName="customer", property="name")#
			</fieldset>

			<fieldset>
				<legend>Add Subscription</legend>

				<cfloop query="publications">
					<div>#hasManyCheckBox(objectName="customer", association="subscriptions", keys="#customer.key()#,#publications.id#", label=publications.name, labelPlacement="after")#</div>
					<div>#dateSelect(objectName="customer", association="subscriptions", property="expires", position=publications.currentRow, label=" Expires")#</div>
					<hr>
				</cfloop>

				<cfif NOT publications.recordCount>
					<h3>There are no publications.</h3>
					<p>#linkTo(controller="publications", action="new", text="Add Publication")#</p>
				</cfif>
			</fieldset>
			
			<div>#submitTag(value="Save Customer")# #linkTo(controller="main", action="index", text="Back Home")#</div>
		#endFormTag()#
	</div>

</cfoutput>