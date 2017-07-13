# Eagle data layer CLI tool
The Eagle data layer Command Line Interface (CLI) is a tool for interacting with the Eagle Data layer instances from the command line / shell of various operating systems. Hereforth refered to as **edlcli**

It is built with Ruby. The distribution model is to be decided and the tool is still very much a work in progress

### Testing

#### prerequisites
- ruby 2.4.1
- bundler gem
- git

#### Steps

##### clone this repository and enter directory
```
git clone git@github.com:EagleGenomics/data-layer-cli.git`
cd data-layer-cli
```

##### install dependencies, build and install gem
```
bundler install
gem build edlcli.gemspec
gem install edlcli-1.0.0.gem
```

### Usage
You will be asked to enter your EDL credentials the first time you run a command; after the first time, credentials will be saved to ~/.edlcli for future use.
It’s generally a good idea to login and add your credentials immediately after installing edlcli so that you can use it.

```
edlcli configure
Enter your EDL credentials for defualt profile
edl_url: https://example.eagle-core.com/
client_id: *****************
secret: *****************
Thank you
```
You are now ready to execute your first command

#### List Datapackages
`edlcli list`
to list all available datapackages

#### Download Datapackages
`edcli download PACKAGE_URL DOWNLOAD_DIR`
to dowload a specific package

#### Upload Datapackages [WIP]
`edcli upload PACKAGE_PATH`
this command only accepts `.zip` or `.json` files according to the datapackage standard.
