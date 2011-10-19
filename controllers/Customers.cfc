/**
 * @hint Customers controller.
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
	 * @hint Retrieves publications so we don't have to repeat ourselves in all the actions.
	 */
	public void function getPublications()
	{
		publications = model("publication").findAll();
	}

	// --------------------------------------------------
	// Public

	/**
	 * @hint Renders the customer page.
	 * @note In thia page we will not include the aditional expiration column.
	 */
	public void function new()
	{
		customer = model("customer").new();
	}

	/**
	 * @hint Creates a new customer and attempts to create subscription nested-properties.
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
	 * @hint Renders the customer page.
	 * @note This page will include dateSelect() inputs for the additional expiration columns.
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
	 * @hint Creates a new customer and attempts to create subscription nested-properties, including an expiration column.
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
	 * @hint Renders the edit customer page.
	 */
	public void function edit()
	{
		customer = model("customer").findByKey(key=params.key, include="subscriptions");		
		renderPage(action="new");
	}

	/**
	 * @hint Updates an existing customer and attempts to update its nested-properties.
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
	 * @hint Deletes a customer.
	 */
	public void function delete()
	{
		customer = model("customer").deleteByKey(params.key);		
		redirectTo(controller="main", action="index");
	}

}