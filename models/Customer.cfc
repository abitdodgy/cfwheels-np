/**
 * @hint Customer model.
 */
component
	extends="Model"
{
	/**
	 * @hint Constructor
	 */
	public void function init()
	{
		hasMany(name="subscriptions", dependent="deleteAll", shortcut="publications");
		nestedProperties(associations="subscriptions", allowDelete=true);

		validatesPresenceOf(property="name", message="Please provide a customer name.");

		beforeSave("sanitize");
	}

}