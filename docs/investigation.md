# Investigations

endpoints:

* [Create investigation](#create-investigation)
* [List investigations](#list-investigations)

## Create investigation
Upload investigation datapackage to create a new invstigation.

full details: [upload data-package](data-layer/api.md##upload-datapackage)

* **Method:**

	`POST`

* **URL:**

  /data-layer/v1/investigations

* **Datapackage schema:**

```json
{
  "title":"Investigation A",
  "summary":"<p>Investigation A about XYZ</p>",
  "description":"<p>Investigation A is about exploring the concepts X, Y and Z</p>",
  "start_date":"2017-07-04",
  "resources":[]
}
```

* **Success Response:**

  * **Code:** 201 Created  
    **Content:** 

```json
{
	"id":"HTTPS://SERVER/data-layer/v1/investigations/:uuid",
	"title":"Investigation A",
	"resources":[]
}
```

## List investigations
List available investigations:

full details: [upload data-package](data-layer/api.md##list-datapackages)

* **Method:**

	`GET`

* **URL:**

  /data-layer/v1/investigations

* **Success Response:**

  * **Code:** 200 Ok  
    **Content:** 

```json
[
  {
    "id":"HTTPS://SERVER/data-layer/v1/investigations/:UUID",
	 "title":"Investigation A",
	 "resources":[
	 	{
	 		"id":"HTTPS://SERVER/data-layer/v1/studies/:UUID",
	 		"title":"Study X"
	 		"kind":"study"
	 	},
	 ]
  },
  {
    "id":"HTTPS://SERVER/data-layer/v1/investigations/:uuid",
	 "title":"Investigation B",
	 "resources":[]
  }
]
```
