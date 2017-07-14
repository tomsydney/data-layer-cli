# Eagle CLI
The Eagle Genomics Command Line Interface (CLI) is a tool for interacting with the different Eagle APIs and instances from the command line / shell of various operating systems. Hereforth refered to as eagle_cli

It is written in Ruby. The tool is still very much a work in progress.

### Testing

#### prerequisites
- ruby 2.4.1
- bundler gem
- git

#### Steps

##### clone this repository and enter directory
```
git clone git@github.com:EagleGenomics/data-layer-cli.git
cd data-layer-cli
```

##### Install dependencies, build and install gem
```
bundler install
gem build eagle_cli.gemspec
gem install eagle_cli-0.0.1.gem
```

### Usage
You will be asked to enter your Eagle Instance credentials the first time you run a command; after the first time, credentials will be saved to ~/.eagle_cli for future use.
It’s generally a good idea to login and add your credentials immediately after installing eagle_cli so that you can use it.

```
eagle_cli configure
Enter your credentials for default profile
Instance url: https://demo.example.com/
Client Id: *****************
Client Secret: *****************
```
You are now ready to execute your first command.

#### List Datapackages
`eagle_cli list`
to list all available datapackages

#### Download Datapackages
`eagle_cli download PACKAGE_URL DOWNLOAD_DIR`
to download a specific package

#### Upload Datapackages [WIP]
`eagle_cli upload PACKAGE_PATH`
this command only accepts `.zip` or `.json` files according to the [datapackage](http://frictionlessdata.io/data-packages/) standard.


## Development

### TODOs

- Improve test coverage
- Continuous integration
- extract API wrapper to separate repo
