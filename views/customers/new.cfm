<!--- The add and edit form for a customer object with normal subscritions. --->
<cfoutput>

	#contentFor(pageTitle="Add Customer with Normal Subscription(s)")#

	<h1>Add Customer with <em>Normal</em> Subscription(s)</h1>

	<p>In this example we will add a customer with a normal subscription.</p>
	<p>This exmaple follows the example outlined in the documentation.</p>

	<div>
		<cfif params.action EQ "edit" OR params.action EQ "update">
			#startFormTag(action="update", key=customer.id)#
		<cfelse>
			#startFormTag(action="create")#
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