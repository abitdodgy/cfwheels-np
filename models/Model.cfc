/**
 * @hint Base Model.
 */
component
	extends="Wheels"
{
	/**
	 * @hint Sanitze the name property for publication and customer.
	 */
	private void function sanitize()
	{
		if (structKeyExists(this, "name"))
			this.name = HTMLEditFormat(this.name);
	}

}