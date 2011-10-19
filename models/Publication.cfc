/**
 * @hint Publication model.
 */
component
	extends="Model"
{
	/**
	 * @hint Constructor
	 */
	public void function init()
	{
		hasMany(name="subscriptions", dependent="deleteAll");

		validatesPresenceOf(property="name", message="Please provide a publication name.");

		beforeSave("sanitize");
	}

}