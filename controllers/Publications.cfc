/**
 * @hint Publications controller.
 */
component
	extends="Controller"
{
	/**
	 * @hint Renders the add publication page.
	 */
	public void function new()
	{
		publication = model("publication").new();
	}

	/**
	 * @hint Creates a new publication.
	 */
	public void function create()
	{
		publication = model("publication").new(params.publication);
		publication.save();

		if (publication.hasErrors())
		{
			renderPage(action="new");
		}
		else {
			redirectTo(controller="main", action="index");
		}
	}

	/**
	 * @hint Renders the edit publication page.
	 */
	public void function edit()
	{
		publication = model("publication").findByKey(params.key);	
		renderPage(action="new");
	}

	/**
	 * @hint Updates an existing publication.
	 */
	public void function update()
	{
		publication = model("publication").findByKey(params.key);
		publication.update(params.publication);

		if (publication.hasErrors())
		{
			renderPage(action="new");
		}
		else {
			redirectTo(controller="main", action="index");
		}
	}

	/**
	 * @hint Deletes a publication.
	 */
	public void function delete()
	{
		publication = model("publication").deleteByKey(params.key);		
		redirectTo(controller="main", action="index");
	}

}