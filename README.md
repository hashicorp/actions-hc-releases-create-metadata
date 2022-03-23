# actions-hc-releases-create-metadata

GitHub action for generating and publishing release metadata using hc-releases.

## Usage

**Params**

| Parameter          | Description                                                                                      | Required | Default                                                  | Type        |
| ------------------ | -------------------------------------------------------------------------------------------------| ---------| ---------------------------------------------------------| ------------|
| product-name       | Product name                                                                                     | Yes      | -                                                        | string      |
| version            | Product version                                                                                  | Yes      | -                                                        | string      |
| hc-releases-host   | hc releases host                                                                                 | Yes      | -                                                        | string      |
| hc-releases-key    | hc releases api key                                                                              | Yes      | -                                                        | string      |
| metadata-file      | Release hcl metadata-file (will use project-dir as the base dir)                                 | No       | .release/release-metadata.hcl                            | string      |
| changelog          | Add changelog URL to the release metadata                                                        | No       | 'true'		    										  | string      |


### Example Usage

```
	-
	name: Create Release metadata
	uses: hashicorp/actions-hc-releases-create-metadata@v1
	with:
		product-name: "terraform-ls"
		version: "${{ github.ref_name }}"
		hc-releases-host: "${{ secrets.HC_RELEASES_HOST }}"
		hc-releases-key: "${{ secrets.HC_RELEASES_KEY }}"
		changelog: "false"
```