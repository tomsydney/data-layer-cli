# Eagle API v2 docs
modules:

* [Authentication](#authentication)
* [Data Layer](data-layer/api.md)

**Examples:**

* [Investigations](investigation.md)
* [Studies](study.md)

## Authentication
Returns the bearer token to use for subsequent requests to any module.

* **URL:**

  /authentication/token

* **Method:**

  `POST`

* **Headers:**

  ```
  Content-Type: application/json
  Accept: application/json
  ```

* **URL Params**

  None

* **Data Params**

  **Required:**
  
  Add description of audience, grant type fields etc. eg. Instance_url: the POST url to verify authentication (https://demo.example.com/example_auth_url)

  ```json
	{
		"client_id":"...",
		"client_secret":"...",
		"audience":"Instance_url",
		"grant_type":"client_credentials"
  }
  ```
* **Success Response**

  * **Code:** 200 Ok  
  	 **Content:**

  ```json
  {
    "access_token":"XYZ.ASD...",
    "expires_in":86400,
    "scope":"read:datapackages create:datapackages",
    "token_type":"Bearer"
  }
  ```

* **Error Response:**

  * **Code:** 401 Unauthorized  
    **Content:**

    ```json
    {
    	"error":"access_denied",
    	"error_description":"Unauthorized"
    }
    ```
