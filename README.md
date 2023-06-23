# actions-hc-releases-create-metadata

GitHub action for generating and publishing release metadata using hc-releases.

## Usage

**Params**

| Parameter          | Description                                                                                             | Required | Default                                                  | Type        |
| ------------------ | --------------------------------------------------------------------------------------------------------| ---------| ---------------------------------------------------------| ------------|
| private-tools-token| Token with permission to download bob and hc-releases                                                   | Yes      | -                                                        | string      |
| product-name       | Product name                                                                                            | Yes      | -                                                        | string      |
| version            | Product version                                                                                         | Yes      | -                                                        | string      |
| hc-releases-host   | hc releases host                                                                                        | Yes      | -                                                        | string      |
| hc-releases-key    | hc releases api key                                                                                     | Yes      | -                                                        | string      |
| metadata-file      | Release hcl metadata-file (will use project-dir as the base dir)                                        | No       | .release/release-metadata.hcl                            | string      |
| changelog          | Add changelog URL to the release metadata                                                               | No       | 'true'		    										 | string      |
| artifact-dir       | Directory containing release artifacts                                                                  | No       | 'dist'                                                   | string      |
| build-artifacts    | (Deprecated) Build artifact file extensions - space separated list. These files will get added to the build metadata | No       | 'zip'                                                    | string      |
| product-repo       | Org-qualified product repo if not the same as the repo running the action, e.g. "hashicorp/vault".      | No       | ''                                                       | string      |

### Example Usage

```
	-
	name: Create Release metadata
	uses: hashicorp/actions-hc-releases-create-metadata@v1
	with:
		private-tools-token: "${{ secrets.PRIVATE_TOOLS_GITHUB_TOKEN }}"
		product-name: "terraform-ls"
		version: "${{ github.ref_name }}"
		hc-releases-host: "${{ secrets.HC_RELEASES_HOST_STAGING }}"
		hc-releases-key: "${{ secrets.HC_RELEASES_KEY_STAGING }}"
		changelog: "false"
```
