# citibike-cli

A simple cli that takes an address and returns bike & dock availability stats.
Uses [citibike.cr](https://github.com/woodruffw/citibike.cr/blob/master/src/citibike.cr) to access [GBFS](https://gbfs.citibikenyc.com/gbfs/en/station_information.json) to provide data.

## Installation

```bash
git clone https://github.com/phantomphildius/citibike-cli
crsytal build src/citibike-cli.cr --release
```

## Usage

```bash
./citibike-cli

What is station do you want to check?
1 Ave & E 78 St
```

## Contributing

1. Fork it (<https://github.com/your-github-user/citibike-cli/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [phantomphildius](https://github.com/phantomphildius) Andrew Freeman - creator, maintainer
