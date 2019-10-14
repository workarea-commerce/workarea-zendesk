Workarea Zendesk
================================================================================

Zendesk plugin for the Workarea platform.


Overview
--------------------------------------------------------------------------------

This plugin includes the following features by default:

 * Javascript widget to display the help widget on the site.
 * Automatic ticket creation via the contact form.

Configuration
--------------------------------------------------------------------------------

A configuration value for the public key must be set to enable the chat widget
display on the front end of the site. Get the public key by logging into the
Zendesk portal, clicking the admin icon, then clicking the widget link. The public
key will be included in the JS widget. Simply copy it out of the widget and place it
in an initializer with the configuration value:


```ruby
  config.zendesk.public_key = "e8f40453-0656-4980-91ba-eb1492ce1d57"
```

To enable automatic ticket creation via the contact us form you will need to add a
configuration value for your Zendesk url, as this is the domain of the rest API.

```ruby
 config.zendesk.rest_endpoint = "https://d3v-5752.zendesk.com"
```

The next step is add a username and token to the secrets file:

```
  zendesk:
    api_user_name: jeffy@workarea.com
    api_token: yourtoken
```

***Be sure to enable Token API access.*** Do this by logging into the agent
portal, clicking the setting icon, then the API link. There is a toggle to enable token access.
Be sure to generate an API access token and place it in your secrets.

Getting Started
--------------------------------------------------------------------------------

This gem contains a Rails engine that must be mounted onto a host Rails application.

Then add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-zendesk'
    # ...

Update your application's bundle.

    cd path/to/application
    bundle


Workarea Platform Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea platform documentation.

License
--------------------------------------------------------------------------------

Workarea Zendesk is released under the [Business Software License](LICENSE)
