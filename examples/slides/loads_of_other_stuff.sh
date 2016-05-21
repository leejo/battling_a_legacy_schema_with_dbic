#!/bin/bash

curl -XPOST api.metacpan.org/v0/release/_search?size=100 -d '{
	"query": {
		"wildcard" : {
			"release.distribution" : "DBIx-Class*"
		}
	},
	"size" : 5000,
	"filter" : {
		"term" : {
			"status" : "latest"
		}
	},
	"fields": [
		"release.distribution",
		"release.date",
		"provides"
	]
}' | jq -r '.hits.hits[].fields.distribution' | sort
