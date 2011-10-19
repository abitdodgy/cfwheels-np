<h1>Nested Properties Demo - Many-to-many Relationships</h1>

<div>

	<p>This demo is based on the many-to-many <a href="http://cfwheels.org/docs/1-1/chapter/nested-properties" target="_blank">nested properties example</a> provided in the ColdFusion on Wheels documentation.</p>

	<cfoutput>

		<h2>Customers</h2>
		<ol>
		<cfloop query="customers">
			<li>
				#customers.name# - 
				[ #linkTo(controller="customers", action="Edit", key=customers.id, text="Edit")# ]
				[ #linkTo(controller="customers", action="delete", key=customers.id, text="Delete")# ]
			</li>
		</cfloop>
		</ol>
		<cfif NOT customers.recordCount>
			<h3>No customers exist. Create some.</h3>
		</cfif>
		<p>#linkTo(controller="customers", action="new", text="Add Customer with Normal Subscription")#</p>
		<p>#linkTo(controller="customers", action="newExpiring", text="Add Customer with Expiring Subscription")#</p>
	
		<hr>
	
		<h2>Publications</h2>
		<ol>
		<cfloop query="publications">
			<li>
				#publications.name# - 
				[ #linkTo(controller="publications", action="edit", key=publications.id, text="Edit")# ]
				[ #linkTo(controller="publications", action="delete", key=publications.id, text="Delete")# ]
			</li>
		</cfloop>
		</ol>
		<cfif NOT publications.recordCount>
			<h3>No publications exist. Create some.</h3>
		</cfif>
		<p>#linkTo(controller="publications", action="new", text="Add Publication")#</p>
	
	</cfoutput>

	<hr>

	<h2>Customer Subscriptions</h2>
	<ol>
	<cfoutput query="subscriptions" group="name">
		<li>#subscriptions.name#</li>
		<ol>
		<cfoutput>
			<li>#subscriptions.publicationName#</li>
		</cfoutput>
		</ol>
	</cfoutput>
	</ol>

</div>