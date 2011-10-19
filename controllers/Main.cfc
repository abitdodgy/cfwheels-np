/**
 * @hint Main controller. Site entry poing.
 */
component
	extends="Controller"
{
	/**
	 * @hint Renders the index page.
	 */
	public void function index()
	{
		customers =  model("customer").findAll();
		publications =  model("publication").findAll();
		subscriptions = model("subscription").findAll(include="customer,publication", order="customers.name", distinct=true);
	}

}