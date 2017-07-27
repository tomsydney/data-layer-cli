# Data layer API 
Endpoints:  

* [List datapackages](#list-datapackages)
* [Download datapackage](#download-datapackage)
* [Upload datapackage](#upload-datapackage)

## List Datapackages
Returns urls to exisiting data packages.

* **URL**

  /data-layer/v1/data-packages

* **Method:**

  `GET`

* **Headers:**
  
  ```
  Authorization: 'Bearer XYZ.ASD...'
  Content-Type: application/json
  ```
  
* **URL Params**

  None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 Ok  
    **Content:** 
    
    ```
    { 
    "packages": [
    	".../data-layer/v1/data-packages/046dae65-a9fd-4387-beab-b068ba6fdee6",
    	".../data-layer/v1/data-packages/ba08dd46-3c83-4fa5-9823-8dca7ca3f25f"
      ]
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
    
* **Sample Call:**
 
  Curl:
  
  ```
  	curl "https://demo.automateddatascientist.com/data-layer/v1/data-packages" \
     -H "Authorization: Bearer XYZ.ASD..." \
     -H "Content-Type: application/json; charset=utf-8"
  ```
  
## Download Datapackage
Returns urls to exisiting data packages.

* **URL**

  /data-layer/v1/data-packages/:id

* **Method:**

  `GET`

* **Headers:**
  
  ```
  Authorization: 'Bearer XYZ.ASD...'
  Content-Type: application/json
  ```

* **URL Params**

  **Required:**
 
   `id=[uuid]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 Ok  
    **Content:** 
    
    ```
    "PK\x03\x04\x14\x00\x00\x00\x00\x00\f..."
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
    
  OR

  * **Code:** 404 Not Found 
    **Content:** 
    
    ```json
    {
    	"error":"Datapackage could not be found"
    }
    ```
  
    
* **Sample Call:**

  Curl:
  
  ```
  	curl "https://demo.automateddatascientist.com/data-layer/v1/data-packages/UUID" \
     -H "Authorization: Bearer XYZ.ASD..." \
     -H "Content-Type: application/json; charset=utf-8"
  ```
  
## Upload Datapackage
Upload a datapackage to the data layer, only json and zip are allowed

* **URL**

  /data-layer/v1/data-packages

* **Method:**

  `POST`

* **Headers:**

  `Authorization: 'Bearer XYZ.ASD...'`

  JSON: `Content-Type: application/json`

  ZIP:	 `Content-Type: application/zip`

* **URL Params**

  None

* **Data Params**

  **application/json:** the complete body of the datapackage.json file
  
  **application/zip:** The binary content of zip file

* **Success Response:**

  * **Code:** 201 Created  
    **Content:** 
    
    ```
    {
    "resource":"https://demo.automateddatascientist.com/data-layer/v1/data-packages/f041e55c-6abb-4556-b089-30041db7d69e"
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

  OR

  * **Code:** 415 Unsupported Media Type  
    **Content:** 
    
    ```json
    {
    	"error":"Only data packages are supported."
    }
    ```

* **Sample Call:**

	JSON:

	```shell
	curl -X "POST" "https://demo.automateddatascientist.com/data-layer/v1/data-packages" \
     -H "Authorization: Bearer XYZ.ASD..." \
     -H "Content-Type: application/json" \
     -d $'{
		"title": "example data package",
		"eagle-description": {
			"version": "0.1.0",
			"package": "eaglecore",
		},
		"name": "an-example-dataset",
		"resources": [
			{"path": "http://exaple.com/public.csv"}
		]
	}'
	```
	
	ZIP:

	```shell
	curl -X "POST" "https://demo.automateddatascientist.com/data-layer/v1/data-packages" \
     -H "Authorization: Bearer XYZ.ASD..." \
     -H "Content-Type: application/zip" \
     --data-binary @/home/user/junk/test.zip 
	```