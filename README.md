# A GitHub Action to Deploy Static Sites to Github Pages - Middleman Jekyll etc...

A GitHub Action for deploying static sites. Works with any static site generator.
Simple, fast, and easy.

This action uses the more secure `github.token` rather than a user created Personal Access Token.

This action will only deploy a static site. However, see the below examples for building and deploying a static site.

## Optional Inputs

* `build-dir`: The directory containing the files to deploy. Defaults to `build`.
* `deploy-branch`: The branch to deploy to your site to. Defaults to `gh-pages`.
* `github-token`: The token to authorize push requests.
* `github-actor`: Name of the deploy actor.
* `github-repo`: GitHub repository to push the built site to.

## Examples

Add/Customize one of the following examples to: `.github/workflows/github-pages.yml`

### Jekyll Example:

```yaml
name: Build and Deploy a Jekyll Site

on:
  push:
    branches: [ main ]

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: ruby/setup-ruby@v1
      with:
        ruby-version: 2.7.2 # Not needed with a .ruby-version file
        bundler-cache: true
    - run: bundle exec jekyll build
    - name: Deploy site
      with:
        build-dir: _site
      uses:  NickSchimek/deploy_jamstack_action@main
```

### Middleman Example:

```yaml
name: Build and Deploy Middleman Site

on:
  push:
    branches: [ main ]

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: ruby/setup-ruby@v1
      with:
        ruby-version: 2.7.2 # Not needed with a .ruby-version file
        bundler-cache: true
    - run: bundle exec middleman build
    - name: Deploy site
      uses:  NickSchimek/deploy_jamstack_action@main
```
