# Studies

endpoints:

* [Create study](#create-study)
* [List studies](#list-studies)

## Create study
Upload study datapackage to create a new study.

full details: [upload data-package](data-layer/api.md##upload-datapackage)

* **Method:**

	`POST`

* **URL:**

  /data-layer/v1/investigations/:UUID

* **Datapackage JSON schema:**

```json
{
  "title":"Study X",
  "summary":"<p>Study about X</p>",
  "description":"<p>Study X is about exploring the concept X</p>",
  "identifier":"STDY_X",
  "contacts":[],
  "reference_dates":[
    { 
      "name":"imporant date 1",
      "date":"TIMESTAMP"
    }
  ],
  "tags": {
    "AssayType":"16S",
    "randomExtraTag":"whoispayingforthis"
  }
  "resources":[
    {
    	"title":"link to something",
    	"path":"https://another.system.com/something",
    	"kind":"link"
    },
    {
    	"title":"Mapping file",
    	"path":"mapping.csv",
    	"format":"csv",
    	"kind":"assaytable",
    	"schema": {
    	  "fileds": [
    	    {
    	      "name":"#SampleID",
    	      "type":"integer"
    	    },
    	    {
    	      "name":"X one",
    	      "type":"string"
    	    },
    	  ]
    	}
    }
  
  ]
}
```

_NOTE: actual request body is a zip file that includes the mapping.csv file_

* **Success Response:**

  * **Code:** 201 Created  
    **Content:** 

```json
{
  "id":"HTTPS://SERVER/data-layer/v1/studies/:UUID",
  "title":"Study X",
  "resources":[
    {
      "id":"HTTPS://SERVER/data-layer/v1/links/:UUID",
      "title":"link to something",
      "kind":"link"
    },
    {
      "id":"HTTPS://SERVER/data-layer/v1/assaytable/:UUID",
      "title":"Mapping file",
      "format":"csv",
      "kind":"assaytable"
    }
  ]
}
```

## List studies
List available studies in an investigation:

full details: [list data-package](data-layer/api.md##list-datapackages)

* **Method:**

	`GET`

* **URL:**

  /data-layer/v1/investigations/:UUID

* **Success Response:**

  * **Code:** 200 Ok  
    **Content:** 

```json
[
  {
    "id":"HTTPS://SERVER/data-layer/v1/studies/:UUID",
	 "title":"Study X",
	 "kind":"study"
  },
  {
    "id":"HTTPS://SERVER/data-layer/v1/studies/:UUID",
	 "title":"Study Y",
	 "kind":"study"
  }
]
```
