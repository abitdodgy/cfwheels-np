/**
 * @hint Customers controller.
 *
 * A 'normal subscription' refers to a setup that follows the many-to-many example in the Wheels
 * documentation (nested properties chapter).
 *
 * An 'expiring subscription' is a setup where we try to include an additional expiration column in our joiner table. This functionality is broken.
 *
 */
component
	extends="Controller"
{
	/**
	 * @hint Constructor
	 */
	public void function init()
	{
		filters(through="getPublications", only="new,create,edit,update,newExpiring,createExpiring");
	}

	// --------------------------------------------------
	// Filters

	/**
	 * @hint Retrieves publications so we don't have to repeat ourselves in all the actions where publications are required.
	 */
	public void function getPublications()
	{
		publications = model("publication").findAll();
	}

	// --------------------------------------------------
	// Public

	/**
	 * @hint Renders the add customer with normal subscription page.
	 * @note In this page we will *not* include the aditional subscription expiration column.
	 * This strictly follows the example in the CFWheels documentation.
	 */
	public void function new()
	{
		customer = model("customer").new();
	}

	/**
	 * @hint Creates a new customer with a normal subscription using nested-properties.
	 * @note Again here we create a normal subscription without the additional expiration column.
	 */
	public void function create()
	{
		customer = model("customer").new(params.customer);
		customer.save();

		if (customer.hasErrors())
		{
			renderPage(action="new");
		}
		else {
			redirectTo(controller="main", action="index");
		}
	}

	/**
	 * @hint Renders add customer with expiring subsription page.
	 * @note This page will include dateSelect() input for an expiration column in our joiner table.
	 */
	public void function newExpiring()
	{
		var subscriptions = [
				model("subscription").new(),
				model("subscription").new()
			];
		customer = model("customer").new(subscriptions=subscriptions);
	}

	/**
	 * @hint Creates a new customer object and its expiring subscriptions using nested-properties.
	 * @note Here we are including the additional expiration column. This method currently failes. See: https://groups.google.com/forum/#!topic/cfwheels/OWDYizVDJlw
	 */
	public void function createExpiring()
	{
		customer = model("customer").new(params.customer);
		customer.save();

		if (customer.hasErrors())
		{
			renderPage(action="newExpiring");
		}
		else {
			redirectTo(controller="main", action="index");
		}
	}

	/**
	 * @hint Renders the edit page for a customer with a normal subscription.
	 */
	public void function edit()
	{
		customer = model("customer").findByKey(key=params.key, include="subscriptions");		
		renderPage(action="new");
	}

	/**
	 * @hint Renders the edit page for a customer with an expiring subscription.
	 */
	public void function edit()
	{
		customer = model("customer").findByKey(key=params.key, include="subscriptions");		
		renderPage(action="new");
	}

	/**
	 * @hint Updates an existing customer (with a normal or an expiring subscription) and updates its nested-properties.
	 * @note We do not need a seperate update() function for expiring subscriptions. They simply work.
	 */
	public void function update()
	{
		customer = model("customer").findByKey(params.key);
		customer.update(params.customer);

		if (customer.hasErrors())
		{
			renderPage(action="new");
		}
		else {
			redirectTo(controller="main", action="index");
		}
	}

	/**
	 * @hint Deletes a customer object.
	 */
	public void function delete()
	{
		customer = model("customer").deleteByKey(params.key);		
		redirectTo(controller="main", action="index");
	}

}