/**
 * @hint Subscription model.
 */
component
	extends="Model"
{
	/**
	 * @hint Constructor
	 */
	public void function init()
	{
		belongsTo("customer");
		belongsTo("publication");
	}
}